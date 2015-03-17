#!/bin/sh

set -e
set -u

input=
push_arguments() {
    if [ -z "$input" ]; then
        if [ "$1" = '-' ]; then
            input='/dev/stdin'
        else
            input="$1"
        fi
        return
    fi
    echo "error: invalid argument $1."
    exit 1
}

help='Usage:'
set_option_help() {
    echo "$help"
    exit
}

version='0.1.0'
set_option_version() {
    echo "$version"
    exit
}

flag=0
set_option_flag() {
    flag=1
}

output=
set_option_output() {
    if [ "$1" = '-' ]; then
        output='/dev/stdout'
    else
        output="$1"
    fi
}

# default
if [ $# -eq 0 ]; then
    set_option_help
fi

# parse arguments
options_end=0
while [ $# -gt 0 ]
do
    if [ $options_end -eq 1 ]; then
        push_arguments "$1"
        shift
        continue
    fi
    case "$1" in
        -)
            push_arguments "$1"
            ;;
        --)
            options_end=1
            ;;
        -h | --help)
            set_option_help
            ;;
        -v | --version)
            set_option_version
            ;;
        -f | --flag)
            set_option_flag
            ;;
        -o | --output)
            shift
            set_option_output "$1"
            ;;
        -*)
            if expr "$1" : '-.*[^hvfo]' > /dev/null; then
                echo "error: invalid option $1." >&2
                exit 1
            fi
            if expr "$1" : '-.*h' > /dev/null; then
                set_option_help
            fi
            if expr "$1" : '-.*v' > /dev/null; then
                set_option_version
            fi
            if expr "$1" : '-.*f' > /dev/null; then
                set_option_flag
            fi
            if expr "$1" : '-.*o' > /dev/null; then
                shift
                set_option_output "$1"
            fi
            ;;
        *)
            push_arguments "$1"
            ;;
    esac
    shift
done

# main entry point
if [ -n "$input" ]; then
    echo "input=$input"
fi

if [ $flag -eq 1 ]; then
    echo "flag=$flag"
fi

if [ -n "$output" ]; then
    echo "output=$output"
fi

