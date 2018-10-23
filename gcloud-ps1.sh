#!/usr/bin/env bash

# Inspired in https://github.com/jonmosco/kube-ps1

GCLOUD_BIN="${GCLOUD_BIN:-gcloud}"
GCLOUD_PS1_ENABLE="${GCLOUD_PS1_ENABLE:-true}"
GCLOUD_PS1_SYMBOL_ENABLE="${GCLOUD_PS1_SYMBOL_ENABLE:-true}"
GCLOUD_PS1_SYMBOL="${GCLOUD_PS1_SYMBOL:-$'\u2601'}"

# http://mywiki.wooledge.org/BashFAQ/037
reset="\\[$(tput sgr0)\\]"    # Text Reset
green="\\[$(tput setaf 2)\\]" # Green
blue="\\[$(tput setaf 4)\\]"  # Blue

gcloudon() {
	GCLOUD_PS1_ENABLE=true
}

gcloudoff() {
	GCLOUD_PS1_ENABLE=false
}

gcloud_ps1() {
	GCLOUD_PS1=""
	if [[ ${GCLOUD_PS1_ENABLE} == true ]]; then
		GCLOUD_PS1+='('
		if [[ ${GCLOUD_PS1_SYMBOL_ENABLE} == true ]]; then
			GCLOUD_PS1+="${blue}${GCLOUD_PS1_SYMBOL} "
		fi
		ACTIVE_CONF=$(${GCLOUD_BIN} config configurations list --format='value(name)' --filter='IS_ACTIVE=true' 2>/dev/null)
		GCLOUD_PS1+="${green}$ACTIVE_CONF${reset})"
	fi

	echo "${GCLOUD_PS1}"
}
