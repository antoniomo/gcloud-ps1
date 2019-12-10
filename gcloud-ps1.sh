#!/usr/bin/env bash

# Inspired in https://github.com/jonmosco/kube-ps1

GCLOUD_BIN="${GCLOUD_BIN:-gcloud}"
GCLOUD_PS1_ENABLE="${GCLOUD_PS1_ENABLE:-true}"
GCLOUD_PS1_SYMBOL_ENABLE="${GCLOUD_PS1_SYMBOL_ENABLE:-true}"
GCLOUD_PS1_SYMBOL="${GCLOUD_PS1_SYMBOL:-☁ }"

if [ "${ZSH_VERSION-}" ]; then
	GCLOUD_PS1_SHELL="zsh"
elif [ "${BASH_VERSION-}" ]; then
	GCLOUD_PS1_SHELL="bash"
fi

gcloudon() {
	GCLOUD_PS1_ENABLE=true
}

gcloudoff() {
	GCLOUD_PS1_ENABLE=false
}

gcloud_ps1() {
	# Terminal colors
	local reset='\033[0m'
	local blue='\033[1m\033[34m'
	local green='\033[1m\033[32m'

	GCLOUD_PS1=""
	if [[ ${GCLOUD_PS1_ENABLE} == true ]]; then
		GCLOUD_PS1+='('
		if [[ ${GCLOUD_PS1_SYMBOL_ENABLE} == true ]]; then
			GCLOUD_PS1+="${blue}${GCLOUD_PS1_SYMBOL} "
		fi
		ACTIVE_CONF=$(${GCLOUD_BIN} config configurations list --format='value(name)' --filter='IS_ACTIVE=true' 2> /dev/null)
		GCLOUD_PS1+="${green}$ACTIVE_CONF${reset})"
	fi

	echo "${GCLOUD_PS1}"
}
