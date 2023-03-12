# VimDoSU
VimDoSu is a plugin for (NEO) Vim that allows you to save files as root in one command.

It uses [dosu](https://github.com/hashelq/dosu) instead of sudo, so if you decide to use this package, you need to install dosu first.

There is only one command: DosuSave.

It takes one optional argument *Filename*, and works the same as *w*, but asks for password everytime you save files (if it is required).

### Caution
If you try to save a regular file with DosuSave, the file will be created as root.

I will fix it in future.
