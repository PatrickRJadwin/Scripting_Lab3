#!/bin/bash

# Invalid Argument Catch
if [ "$#" -ne 2 ]
then
    echo -e "Invalid argument\nUsage: ./Jadwin_Lab3.sh (-e|-p) input_file"
    exit 1
fi

# Getopts for flags
while getopts 'e:p:' OPTION; do
    case "$OPTION" in 
	# Email
    e)
	    avalue="$OPTARG"
	    grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" $OPTARG
	    ;;
	# Phone Number 
    p)
	    avalue="$OPTARG"
	    grep -E -o "[0-9]{3}-[0-9]{3}-[0-9]{4}|\([0-9]{3}\)[0-9]{3}-[0-9]{4}" $OPTARG
	    ;;
    #Invalid flag    
	\?)
	    echo -e "Invalid argument\nUsage: ./Jadwin_Lab3.sh (-e|-p) input_file" >&2
	    exit 1
	    ;;
	 	
    esac
done
shift "$((OPTIND -1))"
