<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

# ssh-agent_fish
> A plugin for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

## About

ssh-agent automatic startup for fish

## Installation

### Using Oh My Fish (recommended)

1. Install Oh My Fish [https://github.com/oh-my-fish/oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)
2. Run:

```fish
    $ omf install https://github.com/imgrant/ssh-agent.fish
```

### Manually

Copy the `__ssh_agent__*.fish` files in the functions directory into your `.config/fish/functions/` directory.

Copy-paste the contents of the `init.fish` into your `.config/fish/config.fish` file.

## Usage

You can customize the functionality, identities, etc., via a few universal variables.

### Multiple identities

Unless otherwise configured, only the default identity (e.g. `id_rsa`) is loaded.

You can load specific, multiple identities with the `__ssh_agent__identities` variable, for example:

```fish
    $ set -U __ssh_agent__identities id_rsa id_ed25519
```

### Lifetime

Identities normally stay in memory forever.

You can adjust the maximum lifetime of the identities with the `__ssh_agent__lifetime` variable, for example:

```fish
    $ set -U __ssh_agent__lifetime 4h
```

### Alternative agent

By default, ssh-agent_fish uses `ssh-agent` as the actual SSH agent. To use a different command instead, set the `__ssh_agent__command` variable. To use [`ssh-agent-wsl`](https://github.com/rupor-github/ssh-agent-wsl), which is an excellent way to integrate `fish` inside the [Windows Subsytem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about) with an [SSH agent in Windows](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement), for example:

```fish
    $ set -U __ssh_agent__command "/c/Program Files/ssh-agent-wsl/ssh-agent-wsl"
```

### Nerd font glyphs

If you're using a font with extended glyphs, such as from the [Nerd Font](https://nerdfonts.com/) project, you can set the `__ssh_agent__use_nerd_font` variable to add some little icons to the information messages that are printed when the plugin initialises:

```fish
    $ set -U __ssh_agent__use_nerd_font yes
```

## Acknowledgements

* fisherman ssh-agent plugin
  * <https://github.com/virtualxdriver/ssh-agent.fish>
* oh-my-zsh ssh-agent plugin authors
  * <https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/ssh-agent/ssh-agent.plugin.zsh>
* Joseph M. Reagle
  * <http://www.cygwin.com/ml/cygwin/2001-06/msg00537.html>

## License

[MIT][mit] © [Ian Grant][author] et [al][contributors]

[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/imgrant
[contributors]:   https://github.com/imgrant/ssh-agent.fish/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
