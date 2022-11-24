#!/bin/sh

# Get the file name from the arguments
file_name=$1

# Get flags all from the arguments
# --clear: clear the screen before running the program
# --infinite: run the program infinitely unless the user stops it
flags=${@:2}

# Time now
time_now=$(date +%s)

gcc $file_name -lm

if [[ $flags == *"--clear"* ]]; then
    clear
fi

# Check if the program should run infinitely
if [[ $flags == *"--infinite"* ]]; then
    while [ 1 ]
    do
        if [[ $flags == *"--clear"* ]]; then
            clear
        fi
        ./a.out

        # Wait for the user to press enter
        echo ""
        echo ""
        echo ""
        read -p "Program finished after $(($(date +%s) - $time_now)) seconds. Press enter to run again or Ctrl+C to stop."
        time_now=$(date +%s)
    done
else
    ./a.out
    echo "Program finished after $(($(date +%s) - $time_now)) seconds."
fi

echo ""