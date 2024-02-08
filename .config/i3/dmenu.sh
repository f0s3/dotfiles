#!/bin/bash

CURRENT_LAYOUT=$(xkblayout-state print "%c")

xkblayout-state set 0

$(dmenu_run -sb '#8e1eff' -sf '#ffffff' -nb '#222d32' -nf '#ffffff'); xkblayout-state set $CURRENT_LAYOUT

