# Welcome to my MDBook test

_There be docs here!_

This `mdbook` is just a collection of notes and posts about subjects like _shell programming_ and other programming
with various languages.

- _Powershell_
- _Python_
- _Nodejs_

Mainly I've been concentrating on mostly _interpreted_ languages, **NodeJs** mostly.

## My Github Projects

Here be a list of my most active github projects as of 8/2021.

1. [Scripts-pwsh](https://github.com/awsomesawce/scripts-pwsh)
2. [my-dotfiles](https://github.com/awsomesawce/my-dotfiles): a collection of (_almost_) **all** dotfiles
  and config files I use for **Powershell**, **Bash**, and **Zsh**
3. [node_cli_package](https://github.com/awsomesawce/node_cli_package)

4. [node-school](https://github.com/awsomesawce/node-school)

## My Interests


### Choice of command shell

Because I'm on Windows, I use **Powershell** because it has the tightest integration with the operating system
compared to the **unix-like** choices.
There is a lot to admire about Powershell.  It is also very accessible due to the great help system Powershell provides.
I have switched to the new _cross-platform_ [Powershell Core version 7](https://github.com/Powershell/Powershell))

Powershell is not just a regular shell.  It is leaps and bounds better than the original Windows shell _cmd.exe_.
Quoting from the Powershell repo: "It is an automation/configuration tool/framework" that is
"optimized for dealing with structured data, REST APIs, and object models."

Powershell comes with batteries included, so to speak.  You don't have to use `jq` to parse JSON data...

Use `Convertfrom-Json` for parsing data requested from REST apis (using `Invoke-RestMethod` or `Invoke-webrequest`).
Assign the requested data to a hashtable variable.
Then when you're done using the data, you can convert it back to JSON, or convert it another
structured data filetype like `xml` or `csv`.  The flexibility is incredible.

Because Powershell is a part of the .NET framework, you can use it's types and methods as well.

Check out my post about _Type Literals_ [here](./TypeLiterals_Powershell.md).

I am still a huge fan of **Bash** and **Zsh**.  Zsh's completion system is more advanced than Bash, so I
normally recommend using `zsh` if there is a choice.  Zsh's popularity is huge, so there is a lot of
support out there, including full plugin systems like [oh-my-zsh]() or [zplug]().
There are also a _ton_ of zsh themes and integrations with _all sorts_ of tools.
It is definitely a strong choice.

The caveat for using unix-like shells in a Windows environment is this:  You're inevitably going to run into some
problem with interop and compatibility.
Unix shells can't handle **CRLF** line endings that well, so you're gonna need a tool like `dos2unix` to
change the line endings to **LF**.
Or you can use a tool like `awk` or `perl` to do it with a simple 1 liner.

With that being said, there are projects out there that are putting out some great work designing
and releasing full unix/linux-like environments that are meant to operate within Windows.

You have a few choices in that regard:

1. [MSYS2](https://www.msys2.org): This is my preference as of now.
2. [Cygwin](https://www.cygwin.com)
3. A [Windows Subsystem for Linux](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux) (wsl) distribution.
4. Virtualbox (a Virtual Machine provisioning platform)

MSYS2 uses the [pacman]() package manager to help keep everything up to date.  I enjoy using it.
I feel like it's one of the best pkg managers out there.  Better than Debian's `apt`/`dpkg` imho.

Cygwin's package manager is it's `setup.exe` program.  It is UI based, but it can be invoked from
the command line.

WSL distros use the same package manager as the distro you're using.  This is
the closest you can get to real linux without using a third-party virtual machine
software.
Official WSL distros are tested and managed by Microsoft and meant to be easy to use.

### WSL caveat

If you're planning on using the new WSL version _2_, be prepared to deal with _super-high_
memory usage.
My computer only has 8GBs of RAM and with all my testing/tweaking I haven't been able to lower
the memory usage of WSL2.  There have been [many](https://github.com/microsoft/WSL/issues/4166) complaints
about this and for now I'm sticking with WSL1.

Right now I'm using a combination of a custom **MSYS2** environment and **Ubuntu** using WSL1.
Both of them are fast enough, but MSYS2's `pacman` installs are much faster.

## MSYS2 pros

MSYS2 provides 3 choices for environment instanciation.
The `msys` shell is a _unix-emulation_ shell designed to work with unix/linux programming.
The `mingw32` and `mingw64` shells are designed to be used for cross-platform development.

The package manager provides different repositories for each environment.

Packages installed with the `mingw_w64` prefix are already compiled to be run natively
on win32.

The amount of development tooling available on the MSYS2 platform is second-to-none.
When people release software, a large percentage of them post their software to the
MSYS2 repositories.

Common development tooling is available on all 3 of these platforms.  It's your choice
which one you want to use.

If I were to suggest a platform, I would say MSYS2 for windows/python/ruby/perl development,
and WSL for linux testing.

## Other WSL uses

Since WSL is more or less a full Linux distro, you can do some cross-platform testing to
make sure your scripts run on both Windows and Linux.

I have **Powershell Core version 7** installed on Windows (of course) and Ubuntu WSL as well.

This allows me to cross test the scripts and modules I write to make sure things work
smoothly on both OS's.

The version of Powershell that is built for Linux is tweaked to better adhere to the Linux environment.

It's tab-completion on Linux works just like bash's default tab completion!  That makes
it easier for someone who's familiar with Bash to jump in and start using Powershell.
