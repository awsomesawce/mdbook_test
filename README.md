# MD Book for Bash/Zsh Shell Notes

## Why?

This repo was originally for testing [mdbook](https://github.com/rust-lang/mdBook) which is a great tool for creating a full site from just a few **Markdown** files.

`mdbook` is fast, but it doesn't include some of the extra _syntax_ that `kramdown` supports.

`mdbook` is a `rust` program.  It can be installed easily on _Windows_ or _Unix_-based machines.

## Subjects

- `bash` syntax.
- `zsh` syntax.
- Difference between `bash`/`zsh` and `powershell` syntax.

I'm documenting when there is overlap with shell builtins and external commands.  For instance, in Linux there is both an `echo` external command and `echo` bash builtin.
Also documenting the difference between **Zsh's** `print` and the `printf` external command.  **Zsh** can emulate `printf` by using `print -f`.  **Zsh's** `print` is like an enhanced version of **Bash's** `echo`.

## Important dirs and files

- `src/`: contains the source of the book generated by `mdbook`
- `book.toml`: `mdbook` reads this file to determine the book build.
- `src\SUMMARY.md`: `mdbook` reads this file to determine how the html is formatted.

## Ignored Dirs and Files

- `book/`: this will not be ignored for long once I get GitHub Pages running
- `ignore`: dir for experimental files that aren't necessary for commiting to the repo.
  Right now I'm testing out different markdown formatters besides mdbook.  `mdbook` is designed to output an entire book
  out of some `*.md` files, while other tools like _Josh Gruber's_ `markdown.pl` simply convert one by one.
  I will write more about the different markdown syntaxes in the `src/` dir.

## TODO

- [ ] Test out [GitHub](https://github.com)'s online editor.
- [ ] Test out [Sourcegraph](https://github.com/sourcegraph/sourcegraph)'s Chrome Extension.
