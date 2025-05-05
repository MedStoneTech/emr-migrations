#!/usr/bin/env python3

import re
import os
import sys
import networkx as nx
from pathlib import Path


def parse_migration_metadata(file_path):
    """Extracts metadata from a migration file"""
    metadata = {
        'path': str(file_path),
        'name': os.path.basename(str(file_path)),
        'depends_on': []
    }

    with open(file_path, 'r') as f:
        content = f.read()

        # Extract migration name
        name_match = re.search(r'-- Migration: ([\w\d_]+)', content)
        if name_match:
            metadata['name'] = name_match.group(1)

        # Extract dependencies
        depends_matches = re.findall(r'-- Depends-On: ([\w\d_]+)', content)
        metadata['depends_on'] = depends_matches

    return metadata


def validate_dependencies():
    """Validates dependencies between migrations"""
    # Find all migration files
    migration_files = list(Path('.').rglob("V*.sql"))

    # Parse metadata
    migrations = [parse_migration_metadata(f) for f in migration_files]
    migration_names = [m['name'] for m in migrations]

    # Build dependency graph
    graph = nx.DiGraph()

    # Add nodes
    for migration in migrations:
        graph.add_node(migration['name'], path=migration['path'])

    print(f"Found {len(migrations)} migration files")

    # Add edges
    dependency_errors = []
    for migration in migrations:
        for dependency in migration['depends_on']:
            if dependency not in migration_names:
                dependency_errors.append(
                    f"ERROR: Migration {migration['name']} depends on {dependency} which does not exist.")
            else:
                graph.add_edge(dependency, migration['name'])

    # Report dependency errors
    if dependency_errors:
        print("\n".join(dependency_errors))
        return False

    # Check for cycles
    try:
        cycle = nx.find_cycle(graph)
        cycle_str = " -> ".join([str(node) for node in cycle])
        print(f"ERROR: Circular dependency detected: {cycle_str}")
        return False
    except nx.NetworkXNoCycle:
        pass

    # Get topological sort (execution order)
    try:
        execution_order = list(nx.topological_sort(graph))
        print("Valid execution order:")
        for i, migration in enumerate(execution_order):
            print(f"{i+1}. {migration}")
        return True
    except nx.NetworkXUnfeasible as e:
        print(f"ERROR: Couldn't determine execution order: {str(e)}")
        return False


if __name__ == "__main__":
    success = validate_dependencies()
    if not success:
        sys.exit(1)
