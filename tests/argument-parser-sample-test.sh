#!/bin/sh

setUp() {
    parser='./argument-parser-sample.sh'
}

test_default() {
    assertEquals 'Usage:' "$($parser)"
}

test_help() {
    assertEquals 'Usage:' "$($parser -h)"
    assertEquals 'Usage:' "$($parser --help)"
}

test_version() {
    assertEquals '0.1.0' "$($parser -v)"
    assertEquals '0.1.0' "$($parser --version)"
}

test_flag() {
    assertEquals 'flag=1' "$($parser -f)"
    assertEquals 'flag=1' "$($parser --flag)"
}

test_output() {
    assertEquals 'output=FILE' "$($parser -o FILE)"
    assertEquals 'output=FILE' "$($parser --output FILE)"
}

test_input() {
    assertEquals 'input=FILE' "$($parser FILE)"
}

test_shorts() {
    assertEquals "flag=1
output=FILE" "$($parser -fo FILE)"
}

test_complex() {
    assertEquals "input=INPUT
flag=1
output=OUTPUT" "$($parser INPUT -o OUTPUT -f)"
}

test_options_end() {
    assertEquals "input=-f
output=OUTPUT" "$($parser -o OUTPUT -- -f)"
}

test_stdin() {
    assertEquals 'input=/dev/stdin' "$($parser -)"
    assertEquals 'input=/dev/stdin' "$($parser -- -)"
}

test_stdout() {
    assertEquals 'output=/dev/stdout' "$($parser -o -)"
    assertEquals 'output=/dev/stdout' "$($parser -o - --)"
}

test_invalid_option() {
    assertFalse "$parser -abc"
    assertFalse "$parser -ha"
}

test_wrong_number_of_arguments() {
    assertFalse "$parser a b c"
}

