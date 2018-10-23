# gcloud-ps1: Gcloud prompt

A script that lets you show your active google cloud configuration on your
prompt. Inspired by https://github.com/jonmosco/kube-ps1

Not much configurability available, as I'm the only user of this. File an issue
or make a PR and I'll add stuff :)

## Installing

Bash:

```
source /path/to/gcloud-ps1.sh
PS1='$(gcloud_ps1)$ '
```

Zsh (untested, let me know if it works!):

```
source /path/to/gcloud-ps1.sh
PROMPT='$(gcloud_ps1)'$PROMPT
```

## Enabling / Disabling

If you don't want the prompt to be active by default, you can put this on your
`~/.bashrc`/`~/.zshrc`:

```
GCLOUD_PS1_ENABLE=false
```


You can then use `gcloudon` and `gcloudoff` to enable/disable the prompt.

## No-icon/customize the icon

You can override these two variables on your `~/.bashrc`/`~/.zshrc`:

```
GCLOUD_PS1_SYMBOL_ENABLE=false # I don't want the icon
GCLOUD_PS1_SYMBOL=$'\uxxxx'    # Use unicode xxxx as icon (default \u2601)
```
