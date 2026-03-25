# steboo/dotfiles

These are my dotfiles, primarily focused around providing myself a good vim
experience. My vimrc is intended to be used on all the machines and
containers that I regularly edit files on. Specifically, these are the goals
of my vimrc:

* Use the same vimrc everywhere regardless of OS or vim version (as long as
vim is newer than 7.0, which was released in 2006).
* Gracefully degrade if a feature, plugin, or colorscheme is missing.
* Embrace native vim features and keystrokes over plugins.

## How to Install

**Option 1:** Copy the .vim directory to your home directory.

**Option 2:** Copy the .vim/vimrc file to a .vimrc in your home directory.

I usually use my vimrc with the railscasts colorscheme with in a terminal
emulator with 256 colors. My vimrc is designed to gracefully degrade if the
colorscheme is missing or if the terminal does not support 256 colors.

True color support is not enabled by default in my vimrc because it does not
gracefully degrade when a terminal does not support true color.

## How to Troubleshoot Color Issues

The key understanding you will need to troubleshoot color issues (or mouse
issues) is that the `$TERM` environment variable determines which capabilities
your terminal will have by looking up the definition in terminfo. You can
check the value of `$TERM` by running `echo $TERM`. You can see what terminfo
found by using infocmp, e.g., `infocmp xterm-256color`. If an error is
returned like "couldn't open terminfo file", then you likely either have an
outdated terminfo, or you have a typo in your `$TERM` variable value.

Of course, if you use a terminal that doesn't support 256 colors, then no
combination of `$TERM` or terminfo can do anything about it. Same for 24-bit
color (also known as true color).

It is easiest to troubleshoot color problems in ther terminal in a pragmatic
manner, starting with your outermost terminal emulator, and progressing
through any layers of SSH and terminal multiplexers, and ending with an
application, like vim. You will minimize unnecessary configuration this way,
as most recent versions of tools have reasonable defaults.

1. Check the local value of `$TERM` which should be based on the attributes
of your local terminal emulator. Some emulators, like iTerm2, default to
`xterm-256color` which is probably what you want. Others, like PuTTY, might
default to `xterm` and you should change it to `xterm-256color`.

2. If you are using SSH, check the remote value of `$TERM`. Usually `$TERM` is
passed as-is from a local to remote host, but sometimes it is changed by an
SSH or shell configuration (which is usually incorrect.)

3. If you are using a modern version of tmux in a terminal that is already
supporting 256 colors and 24-bit colors, then tmux will start with a
reasonable term value and 24-bit colors enabled. You won't need to create a
.tmux.conf file to get colors. However, older versions of tmux will require
configuration. On systems with outdated terminfo databases, tmux can work with
term set to screen-256color.

4. If you are using a modern version of GNU Screen, it too will start with a
reasonable term value that supports 256 colors. Old versions will need to be
configured to start with `term screen-256color` or similar. Very old versions
of screen (including 4.0.3 that macOS ships with in 2025) were not compiled
with 256 color support. You will have to upgrade or recompile screen in this
case. screen 5.0+ supports 24-bit/true color, but it needs to be enabled in
your .screenrc with `truecolor on`.

5. If you've set everything up correctly to this point, vim 8.0+ should support
256 colors (and SGR mouse) out of the box, if it's been compiled with the
`syntax` (and `mouse` and `mouse_sgr`) features. You would just put your
favorite vim color scheme in `~/.vim/colors` or `%HOME\vimfiles\colors`,
specify `syntax on` and your colorscheme in .vimrc, and it would work. To
enable 24-bit color support, you would need to `set termguicolors`. Old guides
described setting things like `t_Co`, `t_8f`, or `t_8b`, but this is no longer
needed nor recommended in 2026 with vim 8.0+, modern terminfo databases, and
updated terminal emulators and multiplexers.
