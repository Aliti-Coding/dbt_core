#!/usr/bin/env python
"""
Dynamic File Convention Checker

This script checks that files follow naming conventions based on:
1. File type (SQL, YAML, Python etc...)
2. Directory location
3. Custom patterns defined in a configuration

Usage:
  python check_conventions.py [directory_path] EXAMPLE => python check_conventions.py dbt_project/models
"""

import os
import sys
import re
from pathlib import Path
from typing import Dict, List, Tuple, Union, Optional, Any

# Define color codes for terminal output
GREEN = "\033[92m"
YELLOW = "\033[93m"
RED = "\033[91m"
BLUE = "\033[94m"
BOLD = "\033[1m"
RESET = "\033[0m"


# UTILITY FUNCTIONS
def load_conventions(config_path: Optional[str] = None) -> Dict:
    """Load naming conventions"""
    import check_naming_config as config
    return config.CONVENTIONS

def find_files(directory: str, exclude_dirs: List[str] = None) -> List[str]:
    """Find all relevant files in the specified directory and subdirectories."""
    if exclude_dirs is None:
        exclude_dirs = ['.git', 'target', 'dbt_packages', 'logs', '.venv', 'venv', 'env', '.env']
    

    
    all_files = []
    for root, dirs, files in os.walk(directory):
        # Skip excluded directories
        dirs[:] = [d for d in dirs if d not in exclude_dirs]
        
        for file in files:
            file_path = os.path.join(root, file)
            all_files.append(file_path)
    
    return all_files

# print(find_files('dbt_project/models'))

def get_file_type(file_path: str) -> str:
    """Extract file extension without the dot."""
    file, format = os.path.splitext(file_path) # returns datatype tupple (file, format)
    return format[1:] if format else ""
# print(get_file_type('dbt_project/models/staging/jaffle_shop/stg_jaffle_shop__payments.sql'))

def get_parent_directory(file_path: str) -> str:
    """Extract the relevant parent directory name for convention checking."""
    path_parts = Path(file_path).parts
    
    # Dynamically extract special directories from the conventions config
    conventions = load_conventions()
    special_dirs = set()
    
    # Gather all directory names from the conventions configuration
    for file_type, type_conventions in conventions.items():
        for directory in type_conventions.keys():
            if directory != "default":
                special_dirs.add(directory)
                print(directory)
    # print(special_dirs)
    # Look for special directories in the path
    for special_dir in special_dirs:
        if special_dir in path_parts:
            return special_dir
            
    # Fall back to immediate parent directory if no special directory found
    return os.path.basename(os.path.dirname(file_path))

# print(get_parent_directory('dbt_project/models/staging/jaffle_shop/stg_jaffle_shop__payments.sql'))


def check_file_convention(file_path: str, conventions: Dict) -> Tuple[bool, Optional[str]]:
    """Check if a file follows naming conventions based on type and location."""
    file_name = os.path.basename(file_path)
    file_type = get_file_type(file_path)
    parent_dir = get_parent_directory(file_path)
    # print(parent_dir)
    # Get type-specific conventions or default
    type_conventions = conventions.get(file_type, conventions.get("default", {}))
    # print(type_conventions)
    # Get directory-specific conventions or default for this file type
    dir_conventions = type_conventions.get(parent_dir, type_conventions.get("default", {}))
    
    # Check if file follows the convention
    if "patterns" in dir_conventions:
        # Multiple allowed patterns
        patterns = dir_conventions["patterns"]
        if any(re.match(pattern, file_name) for pattern in patterns):
            return True, None
        message = dir_conventions.get("message", f"File doesn't match any allowed patterns")
        examples = dir_conventions.get("examples", [])
        if examples:
            example_str = ", ".join(examples)
            message += f". Examples: {example_str}"
        return False, message
    elif "pattern" in dir_conventions:
        # Single pattern
        pattern = dir_conventions["pattern"]
        if re.match(pattern, file_name):
            return True, None
        message = dir_conventions.get("message", f"File doesn't match pattern {pattern}")
        example = dir_conventions.get("example")
        if example:
            message += f". Example: {example}"
        return False, message
    
    # No patterns defined
    return True, None

# print('dbt_project/models/staging/jaffle_shop/source_#_jaffle_shop.yml', load_conventions())

def print_results(issues: List[Dict[str, str]], stats: Dict[str, int]) -> None:
    """Print results in a colorful, easy-to-read format."""
    if issues:
        print(f"\n{RED}{BOLD}❌ Issues Found: {len(issues)}{RESET}\n")
        
        # Group issues by file type
        by_type = {}
        for issue in issues:
            file_type = issue.get("type", "unknown")
            if file_type not in by_type:
                by_type[file_type] = []
            by_type[file_type].append(issue)
        
        # Print issues by type
        for file_type, type_issues in by_type.items():
            print(f"{BLUE}{BOLD}[{file_type.upper()} Files]{RESET}")
            for issue in type_issues:
                print(f"  {RED}●{RESET} {issue['file']}:")
                print(f"    {issue['message']}")
                print()
        
        print(f"{RED}{BOLD}Action Required:{RESET} Please fix the naming convention issues and try again.\n")
    else:
        print(f"\n{GREEN}{BOLD}✓ All files follow naming conventions!{RESET}\n")
    
    # Print statistics
    print(f"{BLUE}{BOLD}Summary:{RESET}")
    print(f"  Total files checked: {stats['total']}")
    
    file_types = {k: v for k, v in stats.items() if k != 'total' and k != 'issues'}
    for file_type, count in file_types.items():
        print(f"  {file_type.upper()} files: {count}")
    
    if issues:
        print(f"  Issues found: {RED}{stats['issues']}{RESET}")
    else:
        print(f"  Issues found: {GREEN}0{RESET}")
    print()

# ========================
# MAIN FUNCTION
# ========================

def main():
    """Main function to check naming conventions."""
    # Parse command line arguments
    target_dir = sys.argv[1] if len(sys.argv) > 1 else "."
    config_path = sys.argv[2] if len(sys.argv) > 2 else None
    
    # Load conventions
    conventions = load_conventions(config_path)
    
    # Find files
    print(f"{BLUE}Checking naming conventions in {target_dir}...{RESET}")
    target_dir_default = "dbt_project/models"
    all_files = find_files(target_dir_default)
    
    # Check each file
    issues = []
    stats = {"total": len(all_files), "issues": 0}
    
    for file_path in all_files:
        file_type = get_file_type(file_path)
        
        # Update statistics
        if file_type not in stats:
            stats[file_type] = 0
        stats[file_type] += 1
        print(file_path)
        # Check convention
        valid, message = check_file_convention(file_path, conventions)
        
        if not valid:
            rel_path = os.path.relpath(file_path, os.getcwd())
            issues.append({
                "file": rel_path,
                "type": file_type,
                "message": message
            })
            stats["issues"] += 1
    
    # Print results
    print_results(issues, stats)
    
    # Return exit code
    return 1 if issues else 0

if __name__ == "__main__":
    sys.exit(main())