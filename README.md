# formatter-astyle
An Atom Formatter provider built for Artistic Style (astyle).

by default will look for a .astylerc configuration file in the project root folder.

If any configuration is set the default load of the file is disabled and a file can be loaded in the 'options file' section.

## Installation
Before installing anything for Atom, install [Artistic Style](http://astyle.sourceforge.net/).

In your terminal:
```
apm install formatter
apm install formatter-astyle
```

In Atom, install `formatter` and `formatter-astyle` from your settings view.

## IMPORTANT

Depends on astyle 2.04, there is a bug in text pipe in earlier versions


This package is a fork of [formatter-clang-format](https://github.com/keplersj/formatter-clang-format),
all credits to him, I just wanted to run astyle. ;-)
