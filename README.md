# Deadlock zsh theme

This work is based on the oh-my-zsh [bira](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes#bira) theme with some additional changes according to [dustmod](https://github.com/bmihaila/dustmod). Thanks for their work!


## Requirements
- Zsh - see [zsh.org](http://www.zsh.org/)
- Zsh framework like [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)


## Installation
Download the theme file to the right directory for you framework and add the following line to your `.zshrc` file depending on your zsh plugin manager:

- [oh-my-zsh - adding themes howto](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization#overriding-and-adding-themes)

    `ZSH_THEME="deadlock"`


## Tweaks and settings

The appearance can be modified by setting environment variables in your `.zshrc`:

- `DEADLOCK_GIT_STATUS_LONG_DESCRIPTION="true"` - show the git status verbose, e.g. `✶modified` or only using the symbols `✶`
- `DEADLOCK_USER_HOST_ALWAYS="true"` - show the `username@hostname` part always or hide it when on the local machine


## TODO
- Add screenshots
- add clock/timestamp
- different color and prompt for `root` user
- show if on `ssh` connection