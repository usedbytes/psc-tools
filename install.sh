#!/bin/sh

function install_sbin() {
	cp -v $1 /usr/local/sbin
}

function install_service() {
	cp -v $1 /etc/systemd/system/
}

install_sbin setup-psc
install_sbin teardown-psc
install_sbin start-psc
install_sbin stop-psc
install_service psc-setup\@.service
install_service psc-app\@.service
