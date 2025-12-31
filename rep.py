#!/usr/bin/env python3
"""
repair_targets_from_sorryAx.py - Add @[target] to declarations with sorryAx.

Usage:
    python3 repair_targets_from_sorryAx.py <project_dir> [--dry-run]

This script:
1. Finds all .lean files under ¨src/
2. Runs get_targets --submission on each file
3. Identifies declarations with sorryAx in axioms
4. Adds @[target] annotation to those declarations
5. Repeats until fixpoint (no changes needed)
"""

import re
import subprocess
import sys
from pathlib import Path
from typing import Set, List, Tuple, Dict


def is_auto_generated_name(name: str) -> bool:
    """Check if a declaration name is auto-generated (not user-defined)."""
    # Auto-generated proof obligations from instances
    if '.proof_' in name:
        return True
    # Auto-generated auxiliary lemmas
    if name.startswith('_auxLemma') or '._auxLemma' in name:
        return True
    # Match patterns like Foo.proof_1
    if re.match(r'.*\.proof_\d+$', name):
        return True
    # Instance declarations
    if '.inst' in name or name.startswith('inst'):
        return True
    # Private declarations
    if '_private' in name:
        return True
    if name.startswith('_') and not name.startswith('_root_'):
        return True
    return False


def parse_get_targets_output(output: str) -> List[Tuple[str, str, List[str], bool]]:
    """Parse the get_targets output to extract declarations and their axioms.

    Returns list of (kind, name, axioms, is_target) tuples.
    """
    declarations = []

    # Split by '---' separator
    blocks = output.split('---')

    for block in blocks:
        block = block.strip()
        if not block:
            continue

        lines = block.split('\n')
        if len(lines) < 2:
            continue

        kind = lines[0].strip()
        if kind not in ('theorem', 'lemma', 'def'):
            continue

        name = lines[1].strip()

        # Find axioms line (starts with #[)
        axioms = []
        for line in lines:
            line = line.strip()
            if line.startswith('#[') and line.endswith(']'):
                # Parse axioms like #[propext, Quot.sound, sorryAx]
                axiom_str = line[2:-1]  # Remove #[ and ]
                if axiom_str:
                    axioms = [a.strip() for a in axiom_str.split(',')]
                break

        # Check if this block shows it's a target (look for "target" in attributes)
        # The get_targets output shows if something is a target by including info
        is_target = False  # We'll determine this from source

        declarations.append((kind, name, axioms, is_target))

    return declarations


def find_declarations_needing_target(project_dir: Path, source_file: Path) -> Set[str]:
    """Find declarations that need @[target] but don't have it."""
    # Run get_targets on this file
    result = subprocess.run(
        ['lake', 'exe', 'get_targets', '--submission', str(source_file)],
        cwd=project_dir,
        capture_output=True,
        text=True
    )
    output = result.stdout + result.stderr

    # Parse declarations
    declarations = parse_get_targets_output(output)

    # Read source to check existing targets
    content = source_file.read_text()

    needs_target = set()

    for kind, name, axioms, _ in declarations:
        # Skip auto-generated declarations
        if is_auto_generated_name(name):
            continue

        # Must have sorryAx in axioms
        if 'sorryAx' not in axioms:
            continue

        # Check if already marked @[target] in source
        short_name = name.split('.')[-1] if '.' in name else name
        escaped_name = re.escape(short_name)

        # Pattern to check if already has @[target]
        already_target_pattern = rf'@\[[^\]]*\btarget\b[^\]]*\]\s*(?:protected\s+)?(?:theorem|lemma|def)\s+{escaped_name}\b'
        if re.search(already_target_pattern, content):
            continue

        needs_target.add(name)

    return needs_target


def add_target_decorator(source_path: Path, decl_name: str) -> bool:
    """Add @[target] decorator to a declaration in the source file.

    Returns True if modification was made, False otherwise.
    """
    content = source_path.read_text()

    # The declaration name might be fully qualified (e.g., Hamming.toHamming_zero)
    short_name = decl_name.split('.')[-1] if '.' in decl_name else decl_name

    # Escape special regex characters in the name
    escaped_name = re.escape(short_name)

    # First check if it already has @[target]
    already_target_pattern = rf'@\[[^\]]*\btarget\b[^\]]*\]\s*(?:protected\s+)?(?:theorem|lemma|def)\s+{escaped_name}\b'
    if re.search(already_target_pattern, content):
        return False

    # Pattern for declaration with existing attributes (but not target) - handles protected too
    with_attrs_pattern = rf'(@\[([^\]]+)\]\s*)(protected\s+)?(theorem|lemma|def)\s+({escaped_name})\b'
    match = re.search(with_attrs_pattern, content)

    if match:
        # Has attributes, add target to them
        attrs = match.group(2)
        protected_kw = match.group(3) or ''
        kind = match.group(4)
        name = match.group(5)

        # Add target to attributes
        new_attrs = f'target, {attrs}'
        replacement = f'@[{new_attrs}] {protected_kw}{kind} {name}'
        new_content = content[:match.start()] + replacement + content[match.end():]
        source_path.write_text(new_content)
        return True

    # Pattern for protected declaration without attributes
    protected_no_attrs_pattern = rf'^(\s*)(protected)\s+(theorem|lemma|def)\s+({escaped_name})\b'
    match = re.search(protected_no_attrs_pattern, content, re.MULTILINE)

    if match:
        # Protected but no attributes, add @[target]
        indent = match.group(1)
        protected_kw = match.group(2)
        kind = match.group(3)
        name = match.group(4)

        # Replace with @[target] version
        replacement = f'{indent}@[target]\n{indent}{protected_kw} {kind} {name}'
        new_content = content[:match.start()] + replacement + content[match.end():]
        source_path.write_text(new_content)
        return True

    # Pattern for declaration without attributes (no protected)
    no_attrs_pattern = rf'^(\s*)(theorem|lemma|def)\s+({escaped_name})\b'
    match = re.search(no_attrs_pattern, content, re.MULTILINE)

    if match:
        # No attributes, add @[target]
        indent = match.group(1)
        kind = match.group(2)
        name = match.group(3)

        # Replace with @[target] version
        replacement = f'{indent}@[target]\n{indent}{kind} {name}'
        new_content = content[:match.start()] + replacement + content[match.end():]
        source_path.write_text(new_content)
        return True

    print(f"  Warning: Could not find declaration {decl_name} (short: {short_name}) in {source_path}")
    return False


def find_lean_files(project_dir: Path) -> List[Path]:
    """Find all .lean files in the src/ directory."""
    src_dir = project_dir / 'Library'
    if not src_dir.exists():
        return []
    return sorted(src_dir.rglob('*.lean'))


def repair_targets_for_project(project_dir: Path, dry_run: bool = False, max_iterations: int = 10) -> int:
    """Repair targets for all files in a project until fixpoint."""
    lean_files = find_lean_files(project_dir)
    print(f"Found {len(lean_files)} Lean files in {project_dir}")

    if not lean_files:
        print("No Lean files found in src/")
        return 0

    total_added = 0
    iteration = 0

    while iteration < max_iterations:
        iteration += 1
        print(f"\n{'='*60}")
        print(f"=== Iteration {iteration} ===")
        print(f"{'='*60}")

        # Rebuild project
        print("\nRebuilding project...")
        result = subprocess.run(['lake', 'build'], cwd=project_dir, capture_output=True, text=True)
        if result.returncode != 0:
            print(f"Build warning (continuing anyway):\n{result.stderr[:500]}")

        iteration_added = 0
        for source_file in lean_files:
            print(f"\nProcessing {source_file.relative_to(project_dir)}")

            # Find declarations needing target
            needs_target = find_declarations_needing_target(project_dir, source_file)

            if not needs_target:
                print(f"  No changes needed")
                continue

            print(f"  Declarations needing @[target]: {len(needs_target)}")
            for name in sorted(needs_target):
                print(f"    - {name}")

            if dry_run:
                iteration_added += len(needs_target)
                continue

            # Add @[target] to each
            for name in needs_target:
                if add_target_decorator(source_file, name):
                    iteration_added += 1

        total_added += iteration_added

        if iteration_added == 0:
            print(f"\n{'='*60}")
            print("No more targets to add. Fixed point reached.")
            print(f"{'='*60}")
            break
        else:
            print(f"\nIteration {iteration}: Added {iteration_added} targets")

        # In dry-run mode, exit after one iteration
        if dry_run:
            print("\n(Dry run complete - showing targets that would be added)")
            break
    else:
        print(f"Warning: Reached max iterations ({max_iterations})")

    return total_added


def main():
    if len(sys.argv) < 2:
        print("Usage: repair_targets_from_sorryAx.py <project_dir> [--dry-run]")
        sys.exit(1)

    project_dir = Path(sys.argv[1]).resolve()
    dry_run = '--dry-run' in sys.argv

    if not project_dir.exists():
        print(f"Error: Project directory {project_dir} does not exist")
        sys.exit(1)

    if dry_run:
        print("DRY RUN - no changes will be made")

    total = repair_targets_for_project(project_dir, dry_run=dry_run)
    print(f"\nTotal targets added: {total}")


if __name__ == '__main__':
    main()
