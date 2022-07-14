.PHONY: default help install uninstall pull update

PROG 		= lab_shell
VERSION		= 1.0.0
INSTALL_DIR 	= /opt/rsh
BIN_DIR 	= $(INSTALL_DIR)/bin
LAB_DIR		= $(INSTALL_DIR)/lab
TMP_DIR		= $(INSTALL_DIR)/tmp
REPO		= $(shell grep url .git/config)
Q  		= @
bold   		= $(shell tput bold)
underline 	= $(shell tput smul)
normal 		= $(shell tput sgr0)
red		= $(shell tput setaf 1)
yellow	 	= $(shell tput setaf 3)

default: help

help:
	$(Q)echo "$(bold)$(PROG) (v$(VERSION)) installation targets:$(normal)"
	$(Q)echo " $(red)install$(normal)                  	- Install and configure on the host"
	$(Q)echo " $(red)uninstall$(normal) 	                - Uninstalls ($(yellow)Backup first!$(normal))"
	$(Q)echo " $(red)update$(normal)               		- Update code and reinstall islet"

install: install-files

install-files:
	$(Q)echo " $(yellow)Installing $(PROG)$(normal)"
	mkdir -m 755 -p $(BIN_DIR)
	mkdir -m 755 -p $(LAB_DIR)
	mkdir -m 1777 $(TMP_DIR)
	install -o 0 -g 0 -m 755 shell $(BIN_DIR)/

uninstall:
	$(Q)echo " $(yellow)Uninstalling $(PROG)$(normal)"
	rm -rf $(INSTALL_DIR)

pull:
	$(Q)echo " $(yellow)Pulling latest code from:$(normal) $(underline)$(REPO)$(normal)"
	$(Q)git checkout master 1>/dev/null 2>/dev/null
	$(Q)git pull

update: pull
	$(Q)echo " $(yellow)Installing latest code$(normal)"
	make install