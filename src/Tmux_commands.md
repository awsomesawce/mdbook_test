# Tmux commands

Hello from tmux

`tmux` is an amazing _terminal multiplexer_.  This means that `tmux` can create multiple _sessions_ and _windows_ from one terminal window.
  If your terminal emulator (I use **Windows Terminal**) doesn't support multiple windows/tabs (mine does), you can use `tmux` to get that functionality from within the shell.

`byobu` is a `tmux` wrapper that adds some more functionality and keybindings to `tmux`.  It is written and maintained by a guy who works for the company that makes **Ubuntu**, the most popular Linux distribution.

`byobu` adds things like extra keybindings, extra features, more config options, easier config, and other things to `tmux`.

`byobu` also supports a program called `screen` which is a GNU project.  `screen` is a bit different from `tmux` but the premise is the same.  They both enable you to have multiple terminal windows/panes/sessions open at the same time.

`byobu` also adds more informative features like a info-bar on the bottom of the screen that gives information like:

- the current Linux distro you're using.
- The time and date.
- The speed of your processor.

## Other things Byobu adds

Easy config of the _prefix_ command for operation with your terminal multiplexer of choice.  
For instance, you can change the default prefix key from `Ctrl-B` (for tmux) to `Ctrl-A` (which is the screen prefix key).
This might be convenient for someone who doesn't use `C-a` on the cmdline.  Normally `C-a` brings your cursor to the beginning of the line.  But if you'd rather use, for instance, the `<HOME>` key, you can set `C-a` to be your prefix key and do things like `C-a n` to go to next tmux window or `C-a c` to create a new window.

`byobu` adds a bunch of scripts and programs to your bin.  They all begin with `byobu-`, so type that into your `bash` or `zsh` command line and type `<TAB>` to see all of your choices.

`byobu`'s documentation is extremely consise.  Every `byobu-*` tool has it's own **manpage**.  
You can type `man byobu-` and press `<TAB>` to see all the manpages available.

### List of some byobu-* manpages

- `byobu-config`: gives you an _ncurses_ menu for altering the configuration of `byobu`.
- `byobu-ctrl-a`: This convenient script allows you to easily modify your prefix key from `Ctrl-b` back to `Ctrl-a` and vise-versa.
- [ ] TODO `byobu-`
