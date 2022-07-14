
This project is inspired by, and heavily borrows from, the hard work of [jonschipp](https://github.com/jonschipp/ISLET) ISLET project.

## Motivation

I needed a simple shell that would parse environmental variables being set by an SSH connection and create, resume, or destroy containerized environments. I wanted the SSH connections to drop a user into the environment specified by the passed variable(s) with no menu interaction required.

## Installation

The installation is very simple. First, grab the dependencies and then
install.

### Dependencies

* Linux, Bash, OpenSSH, Make, SQLite, and Docker Engine

Typically, all you need is Make, SQLite and Docker Engine (for Debian/Ubuntu):

```shell
apt-get install make sqlite
```
See Docker's documentation for installation instructions.

## Install

After installing the dependencies, run:
```shell
make install 
```

See the menu for more options, `make` 

## Updating

Updating an existing installation is very simple:

```shell
tar zcf labs_config.tgz /opt/lab_shell/labs # Backup configs
make update
tar zxf labs_config.tgz -C /       # Restore configs
```
