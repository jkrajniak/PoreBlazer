#!/usr/bin/env bash

CMD=$1

echo "Running regression tests using $CMD"

# This script runs all the tests in the tests/regression directory.
# It is intended to be run from the top-level directory of the
# repository.

# Run the tests in the tests/regression directory.
for test_dir in tests/regression/*; do
    if [ -d "$test_dir" ]; then
        echo "Running test $test_dir"
        cd "$test_dir"
        $CMD  < input.dat
        diff -q summary.dat summary.dat.ref
        if [ $? -eq 0 ]; then
            echo "Test $test_dir passed"
        else
            echo "Test $test_dir failed"
            exit 1
        fi
        cd -
    fi
done