# About mdbook

`mdbook` is a rust program that builds html documentation with `markdown` files.

The build process is simple for users.  The only config needed is to make sure each page
is denoted in your `SUMMARY.md` file.  The pages in that file are the ones that will be built.

## Options and arguments

There are different options that can be parsed.

## Mdbook --help output

Next will be the output from the command `mdbook --help`.

```
mdbook v0.4.6
Mathieu David <mathieudavid@mathieudavid.org>
Creates a book from markdown files

USAGE:
    mdbook [SUBCOMMAND]

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

SUBCOMMANDS:
    build    Builds a book from its markdown files
    clean    Deletes a built book
    help     Prints this message or the help of the given subcommand(s)
    init     Creates the boilerplate structure and files for a new book
    serve    Serves a book at http://localhost:3000, and rebuilds it on changes
    test     Tests that a book's Rust code samples compile
    watch    Watches a book's files and rebuilds it on changes

For more information about a specific command, try `mdbook <command> --help`
The source code for mdBook is available at: https://github.com/rust-lang/mdBook
```

For some reason, after putting in this output, `nvim` goes crazy!
I'm using `vim` atm.
