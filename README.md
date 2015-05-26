# An example for complex argument parsing with POSIX sh

[![Build Status](https://travis-ci.org/manicmaniac/argument-parser-sample.sh.svg?branch=master)](https://travis-ci.org/manicmaniac/argument-parser-sample.sh)

## Introduction

Parsing arguments with POSIX `sh` is a heavy work.

There are some tools for it, e.g. `getopt` and `bash`'s `getopts`.

But these tools are not enough to parse complex arguments and options.

Because;

- `getopt` has different implementation, GNU and BSD.
- BSD's `getopt` is not so powerfull; it cannot parse *long* options.
- `getopts` is not portable. it can be used only in `bash`.
- Any other tools have further less compatibility.

The only measure left is *DO IT YOURSELF*!

## Parsing arguments with `sh` script

The concept of this program is easy to understand.

- A single `while` loop parses arguments one by one, and call functions.
- Parser functions have one-to-one correspondence with each arguments.
- A little tricks to deal special options (e.g. `--` and `-`).

This simple program can;

- parse long options (e.g. `--help`)
- parse argumented option (e.g. `-o FILE`)
- parse concatenated *shorts* options (e.g. `-fo FILE`)
- show usage when no options are specified
- stop parsing options when `--` is found
- treat `-` as `/dev/stdin`
- treat `-` as `/dev/stdout` when it appears just after `--output` option
- parse options in any order
- uproariously fail when invalid options specified
- work rapidly!

## Testing

You can run unit test to ensure how this program works.

    make test

Check if all the tests are success.

## TAKE FREE

You can use this program as a template of your script.

- Any modification are permitted
- Any copyright notices are not needed
- Any warranty are not provided

## License

This program is licensed under the [CC0](http://creativecommons.org/publicdomain/zero/1.0/legalcode) License.

See [LICENSE.txt](LICENSE.txt) for more information.

