# dotfiles

Get started by runnig the following comand which uses [Process Substitution](http://tldp.org/LDP/abs/html/process-sub.html) to avoid temporary files:

```bash
bash <(wget -o /dev/null -O - "https://raw.githubusercontent.com/mrkanister/dotfiles/master/bootstrap.sh")
```

This will
 - install `git`
 - clone (or update) the repository
 - create a symlink to `dotfiles.sh` script as `/usr/local/bin/dotfiles`
