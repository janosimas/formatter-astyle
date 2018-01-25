# formatter-astyle
An Atom Formatter provider built for Artistic Style (astyle).

by default will look for a .astylerc configuration file in the project root folder.

If any configuration is set the default load of the file is disabled and a file can be loaded in the 'options file' section.

## Installation
### Prerequisites
Before installing anything for Atom, install [Artistic Style](http://astyle.sourceforge.net/).

### Important to Windows users
In Windows, you should make sure that `astyle.exe` is visible to `formatter-astyle`, so that `formatter-astyle` can execute `astyle.exe` to actually format the code.

You have two ways to do that.
1. The first way: Set the path of `astyle` you downloaded in the Settings page of `formatter-astyle` in Atom.

   For example: 
   
   ![Example of set the path of astyle](https://user-images.githubusercontent.com/13597393/35378607-5828e332-01ab-11e8-957a-62b15750bdfd.png)

2. The second way: Copy `astyle.exe` into a folder that is included in the `Path` environment variable. 
   
   You may want to create a new folder and add it to the `Path` environment variable, then copy `astyle.exe` into it.
   [Click here for more infomation about how to add a folder to the `Path` enviroment variable](http://www.itprotoday.com/management-mobility/how-can-i-add-new-folder-my-system-path).

### Install formatter-astyle
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
