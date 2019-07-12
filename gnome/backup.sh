#!/bin/sh

dconf dump / > "$(dirname "$0")/saved_settings.dconf"
