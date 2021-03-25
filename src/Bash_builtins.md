# Bash builtins

AUTHOR: Carl Capodice
DATE: Sat Feb  6 10:14:07 AM EST 2021
Updated: Thu Feb 11 09:51:33 PM EST 2021

> This is originally written in my `wsl-notes/shell_*` folder.

[^1]
[^1]: I used `read !date` to automatically read the output of the `date` command into the buffer.
There are builtins in Bash (and Zsh) that exist where there is an executable of the same name.

Here is a list of some examples.

In both shells you can use the `builtin` command to reference the shell builtin instead of a different command of the same name.

There is also an option for the shell to reference the executable _instead_ of the builtin.

> INFO: You can type `builtin ` into bash and press <kbd>TAB</kbd> twice to see a list of builtins that bash provides.
> You can do the same with zsh.  Note that zsh has more builtins than bash.

## Shell builtins

### echo

- `echo`: echo is available as a regular executable in `/usr/sbin/echo`.
  **Difference**: `echo --help` will work if it references the executable, but when using the builtin it just echoes the word `--help`.
  Use `bash -c "help echo"` to see bash's version of `echo`, and use `/usr/bin/echo --help` to see `coreutils` version of `echo`.
  > For a more controllable way to print text in `zsh`, use `print`.  Check out `run-help print` on `zsh`.

### printf

- `printf`: this is available as both an exe and a builtin on both `bash` and `zsh`.
  This utility is similar to `echo` in that it echos whatever you write into the terminal, but there are extra formatting rules.
  These utilities try to mimic `C`'s `printf` utility by providing some of the same syntax.

#### printf example

```bash
printf "My brother %s is %d years old.\n" Carl 34 Bubbah 46
```

This will substitute each `%s` with each string and each `%d` with each number I put in as an argument to the statement.

  > Check out `bash -c "help printf"` or `man printf` for info on either one.

### [ and test

- [x] There is a program called `/usr/bin/[` and I'm not sure what it does. Figure out what it does.

This tool is a synonym for the `test` program.  `test` is both a _builtin_ for **Zsh** and **Bash** but it's also a _standalone_ program provided by the `coreutils` package from **GNU**.
They all do just about the same thing.
For help, try `man [`, `/usr/bin/[ --help`.  In **Bash**, use `help "["`, in **Zsh** use `run-help [` and it will most likely bring up the `zshbuiltins` manpage.

### Let's take a break

So we've went thru a few shell builtins that exist as standalone programs in the **Unix**/**Linux** system.
I think this aspect is both intriguing and confusing, since each implementation has it's own set of rules, settings and options.

The great thing about this is that you can rely on having access to these functionalities no matter _which_ unix system you're on.  They're very much universal.  They don't call it **coreutils** for nothing!  They're in fact *core* to the system!

### env

`env` is a command that helps set the environment for a command.  If used with no arguments it prints _all_ the environment information available.
This command isn't a bash builtin, but it's definitely available on any **POSIX** OS.  To find the POSIX manual for `env`, use `man 1p env`.

### which

This is both a standalone program _and_ a **Zsh** builtin.  It is _not_ a **Bash** builtin!  
It is used to find where an executable is located.  Use `which -a <progname>` to list all occurances of the specific program.
In **Zsh**, it also lists aliases and functions.
When used from **Zsh**, it is actually a link to the `whence` builtin.
Using `run-help which` will bring up the help page for `whence`.
The `which` command in **Zsh** is equivalent to `whence -c`.  `-c` option just outputs in `csh` format, otherwise it's the same as `whence`.
The difference between the `which` standalone exe and the **Zsh** version is that it works for finding shell functions and aliases too.
Say you have an alias for `ls -alhF` with the name `l`, you can type `which l` and it will output all the information about that alias.
This is much more powerful than the standalone `which`, which can only locate executables in "$PATH".

#### which function for bash and csh

`which` can be made into a function which will allow it to operate very similarly to **Zsh's** `which`.  Here it is:

```bash
    which ()
    {
        (alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot $@
    }
    export -f which
```

### pwd

`pwd` is available as both a _builtin_ and _program_ from `/bin/pwd` as part of coreutils.  
`pwd` is available in **Powershell** as `Get-Location`.

### true and false

`true` is both a program (`/usr/bin/true`) and a builtin for `zsh` and `bash`.
It is part of _GNU coreutils_.  
The shell builtin version usually supercedes `/usr/bin/true`.

`false` exists in `/usr/bin/false` as well as in builtins.

### pushd and popd

`pushd` and `popd` are builtins in both `bash` and `zsh`.  
They don't exist as separate programs, but I felt it was necessary to include them in the list.
They allow you to add directories to the _dirstack_, which is a list of directories you can easily `cd` to.

### getopts and getopt

`getopts` is a shell builtin in both **Bash** and **Zsh**.  
`getopt` is an external program from the _util-linux_ utility bundle.  
_util-linux_ is found on most **Linux**-based OS's.

### times, time

`time` is both an external program and a **Bash** builtin.  It reports the time consumed by a pipeline's execution.  
  **Example**: `time [ <pipeline> ]`; runs the pipeline and prints a report of time spent executing the command.
  Variables TIMEFORMAT (bash) and TIMEFMT (zsh) alter the output of the report.
`time` is available as a **Zsh** command, but it's not reported as a _builtin_.
`times` is a **Bash** and **Zsh** builtin.  It displays process times for the system.

## Programs I thought were builtins

Here lies a list of unix programs that I thought were actually builtins, but they're part of _coreutils_.

### ls and dir

1. `ls`: lists the content of a directory.
  To get color output, you need to use `ls --color=auto`.
  > It is an alias of the **Powershell** builtin `Get-ChildItem`.  By default, `Get-ChildItem` acts like `ls -l`.  
  > If you want the traditional `ls` wide style, you have to use `Get-ChildItem | Format-Wide`.
  > To get color output, use `Get-ChildItemColor`, an installed module from the internet.
2. `dir`: does what `ls` does, but is usually aliased to something like `ls -lhF` for long-style output.
3. `vdir`: does what `ls -l` does.  Use `--color=auto` to get color output.
4. `dircolors`: this command allows you to setup color output on the `ls` and `dir` output.

These and the other _coreutils_ programs are documented in `info coreutils`.

> **Zsh** actually has a bunch of file-system utilities as part of it's `zsh/files` module.
> Check `man zshmodules` for more info.


## Definitions test

This is to test how definitions are rendered.
This technique only works when using `kramdown` to convert to html.
The other tools `cmark-gfm`, `markdown`, `markdown-it`, `cmark-py3` don't process definition syntax like `kramdown` does.

> `kramdown` is referenced as a _superset_ of the **Markdown** language.

First Term
: This is the definition of the first term.

Second Term
: This is one definition of the second term.
: This is another definition of the second term.
