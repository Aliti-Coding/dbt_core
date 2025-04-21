#!/usr/bin/env python
"""
Script to check DBT model naming conventions.

Usage:
  python check_naming_conventions.py [directory_path]
"""

import os
import sys
import re
import json

# Define naming conventions - can be extended for other model types
NAMING_CONVENTIONS = {
    'staging': {
        'prefix': 'stg_',
        'dir': 'staging'
    },
    'intermediate': {
        'prefix': 'int_',
        'dir': 'intermediate'
    },
    'marts': {
        'prefix': ['fct_', 'dim_'],
        'dir': 'marts'
    }
}

def list_sql_files(directory):
    """Find all SQL files in the specified directory and subdirectories."""
    sql_files = []
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.sql'):
                sql_files.append(os.path.join(root, file))
    return sql_files

def check_model_naming(model_path):
    """Check if the model follows naming conventions based on its location."""
    # Extract directory and filename parts
    model_dir = os.path.dirname(model_path)
    model_file = os.path.basename(model_path)
    
    # Which convention folder is this in?
    convention_type = None
    for conv_type, rules in NAMING_CONVENTIONS.items():
        dir_pattern = f"/{rules['dir']}/"
        if dir_pattern in model_dir:
            convention_type = conv_type
            break
    
    if not convention_type:
        # Not in a directory we're checking conventions for
        return True, None
    
    # Get the expected prefix for this directory
    expected_prefixes = NAMING_CONVENTIONS[convention_type]['prefix']
    if not isinstance(expected_prefixes, list):
        expected_prefixes = [expected_prefixes]
    
    # Remove .sql extension and check prefix
    model_name = os.path.splitext(model_file)[0]
    prefix_match = any(model_name.startswith(prefix) for prefix in expected_prefixes)
    
    if not prefix_match:
        message = f"Error: Model '{model_path}' should have prefix {' or '.join(expected_prefixes)}"
        return False, message
    
    return True, None

def main():
    """Main function to check naming conventions in a directory."""
    # Default directory is models/, or use command line argument
    models_dir = sys.argv[1] if len(sys.argv) > 1 else "models"
    
    # Find all SQL files
    print(f"Checking naming conventions in {models_dir}...")
    sql_files = list_sql_files(models_dir)
    
    # Check each file
    issues = []
    for sql_file in sql_files:
        valid, message = check_model_naming(sql_file)
        if not valid:
            issues.append(message)
    
    # Report results
    if issues:
        print("\nNaming convention issues found:")
        for issue in issues:
            print(f"  - {issue}")
        sys.exit(1)  # Exit with error code
    else:
        print("All models follow naming conventions! ✓")
        sys.exit(0)  # Exit with success code

if __name__ == "__main__":
    main()