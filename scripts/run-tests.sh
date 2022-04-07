#! /bin/bash

# Summary: automates tests for competitive programming

# Parameters:
#   $1: the prefix of the problem test data files (e.g. 'A' for 'Atest1.dat' or 'Atest2.dat')

# Requirements: executable must be named './a.out' and there must be existing test .dat files in the format above

# $1: the character/string to repeat
# $2: the number of times to print the string
function repeat()
{
    i=0
    while [ $i -le $2 ]; do
        echo -n $1
        ((i++))
    done
}

# 1. Get the current executable and all test files
PROGRAM="$PWD"/a.out
TESTS=("$PWD"/"$1"test*.dat) #defaults to 'test*.dat' if no argument provided

# 2. Make sure there is a compiled program './a.out'
if [[ ! -x "$PROGRAM" ]]; then
    echo Error: executable ./a.out does not exist
    exit 1
fi

# 3. Run the executable with each test
for test in ${TESTS[@]}; 
do
    if [[ -f $test ]]; then
        # Print header
        echo Debugging with test $test
        echo -n ===================
        repeat '=' ${#test}
        echo 

        # Run the program with the given test data
        $PROGRAM  < $test
        echo
    fi
done
