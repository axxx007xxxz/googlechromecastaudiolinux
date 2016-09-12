#!/bin/bash
# Copyright 2016 axxx007xxxz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
echo "$(tput bold)Installing pulseaudio-dlna$(tput sgr0)"
if [[ "$1" = "-h" || "$1" = "--help" ]]
		then
			echo "Options list:"
			echo "-q or --quiet -> clean output (default)"
			echo "-v or --verbose -> verbose output"
			exit
	elif [[ -z "$1" || "$1" = "-q" || "$1" = "--quiet" ]]
		then
			sudo add-apt-repository -y ppa:qos/pulseaudio-dlna > /dev/null
			sudo apt-get -y update > /dev/null
			sudo apt-get install -y pulseaudio-dlna > /dev/null
	elif [[ "$1" = "-v" || "$1" = "--verbose" ]]
		then
			sudo add-apt-repository -y ppa:qos/pulseaudio-dlna
			sudo apt-get -y update
			sudo apt-get install -y pulseaudio-dlna
	else
			echo "Error!"
			echo "Run with -h or --help for options list."
			exit
fi
echo "$(tput bold)Enable pulseaudio-dlna at boot$(tput sgr0)"
if [[ -z "$1" || "$1" = "-q" || "$1" = "--quiet" ]]
		then
			sudo sed -i.bak '$ipulseaudio-dlna --codec wav --encoder-backend ffmpeg -b 256' /etc/rc.local > /dev/null
	elif [[ "$1" = "-v" || "$1" = "--verbose" ]]
		then
			sudo sed -i.bak '$ipulseaudio-dlna --codec wav --encoder-backend ffmpeg -b 256' /etc/rc.local
fi
