# dotfiles

## Quickstart

Execute the following command to setup the `dotfiles` script:

```bash
bash <(wget -o /dev/null -O - "https://raw.githubusercontent.com/mrkanister/dotfiles/master/bootstrap.sh")
```

## What does it do

- Use [Process Substitution](1) to avoid temporary files
- Make sure Git is installed
- Clone this repository to `$HOME/.config/dotfiles`
- Create a symlink to `dotfiles.sh` as `/usr/local/bin/dotfiles`

Subsequent calls to `dotfiles` will update the repository and also the
script itself. After that, it's mostly copying configurations to `$HOME`
and installing new software from the `software.list` file.

## Compatibility

I am currently using `dotfiles` on the following machines:

- Laptop: Kubuntu 17.04
- Desktop: Kubuntu 17.10

This means that some of the configurations (e.g. `dolphinrc`) will
probably only make sense on a system running KDE applications.

[1]: http://tldp.org/LDP/abs/html/process-sub.html
