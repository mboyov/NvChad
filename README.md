<div align="center">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

</div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/mboyov/NvChad">
    <img src="images/logo.svg" alt="Logo" width="30%" height="auto">
  </a>

<h3 align="center">Neovim Configuration with NvChad</h3>

  <p align="center">
    Customized Neovim Configuration Based on NvChad
  </p>
</div>

## Features

This project provides a custom Neovim configuration based on [NvChad 2.5 by ProgrammingRainbow](https://github.com/ProgrammingRainbow/NvChad-2.5), designed to optimize the development workflow for developers who appreciate a lightweight and highly configurable editor.

- **Modern Neovim setup**: Built on top of the powerful and modular NvChad framework, this configuration provides an efficient and modern environment for developers.
- **Optimized for Full-stack Development**: Tailored with support for JavaScript, React, Python3, and other modern technologies.
- **Lightweight and Fast**: This configuration makes use of lazy-loading plugins to keep the startup time minimal, while still offering a wide range of features.
- **Highly Customizable**: With easily modifiable keybindings and plugin options, it allows developers to personalize the editor to fit their workflow.

## Why use this configuration?

- **Productivity Boost**: With built-in support for LSP (Language Server Protocol), syntax highlighting, auto-completion, Git integration, and more, this configuration enhances coding productivity.
- **Flexibility**: Neovim’s customization allows users to modify the setup to suit their preferences without sacrificing performance.
- **Seamless Integration with Modern Tools**: It includes powerful tooling for web development (JavaScript, React), Python development, and Git-based version control.

## Installation

To use this Neovim configuration, follow these steps:

1. Prerequisite

```bash
brew install luarocks
brew install fzf
git clone https://github.com/junegunn/fzf-git.sh.git ~/.
```

2. Uninstall

```bash
# Linux / MacOS (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```
3. Clone the repository:

```bash
git clone https://github.com/mboyov/NvChad.git ~/.config/nvim && nvim
````
**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo  [NvChad/NvChad](https://github.com/NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

## Contributing
Feel free to open issues or pull requests if you have suggestions for improvements.

## License
This project is unlicensed

## Credits
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) A starting point for Neovim
- [NvChad](https://nvchad.com) Blazing fast Neovim config providing solid defaults and a beautiful UI
- [Lazyvim starter](https://github.com/LazyVim/starter) as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

[contributors-shield]: https://img.shields.io/github/contributors/mboyov/NvChad.svg?style=for-the-badge
[contributors-url]: https://github.com/mboyov/NvChad/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/mboyov/NvChad.svg?style=for-the-badge
[forks-url]: https://github.com/mboyov/NvChad/network/members
[stars-shield]: https://img.shields.io/github/stars/mboyov/NvChad.svg?style=for-the-badge
[stars-url]: https://github.com/mboyov/NvChad/stargazers
[issues-shield]: https://img.shields.io/github/issues/mboyov/NvChad.svg?style=for-the-badge
[issues-url]: https://github.com/mboyov/NvChad/issues
[license-shield]: https://img.shields.io/github/license/mboyov/NvChad.svg?style=for-the-badge
[license-url]: https://github.com/mboyov/NvChad/blob/main/LICENSE.txt
