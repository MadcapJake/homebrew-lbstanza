# L.B. Stanza Tap

[L.B. Stanza](http://lbstanza.org) is an optionally-typed, general-purpose langauge.  I've only tested the linux version so please submit issues if you have any problems with the Mac version.


### Linux
```sh
brew install MadcapJake/lbstanza/stanza-linux
```

### Mac
```sh
brew install MadcapJake/lbstanza/stanza-mac
```

### Caveats

Be sure to set the `STANZA_CONFIG` variable as shown after installing.

### Tips


[`stz`], a fish shell function, provides a simple wrapper for executing one-liners and running scripts.

```sh
brew install fisher
fisher i stz
stz -e 'print(1)'
stz -r some-stanza-file.stanza
```

[`stz`]: https://github.com/fisherman/stz
