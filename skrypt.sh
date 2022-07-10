#!/bin/bash

data() {
	echo $(date)
}

logs() {
	mkdir logs
	cd logs
	for i in {1..5}
	do
		echo "log$i.txt" >> log$i.txt
		echo "$(basename $BASH_SOURCE)" >> log$i.txt
		echo $(date) >> log$i.txt
	done
}

logsNumber() {
	mkdir logs
	cd logs
	for i in $(seq 1 $1)
	do
		echo "log$i.txt" >> log$i.txt
		echo "$(basename $BASH_SOURCE)" >> log$i.txt
		echo $(date) >> log$i.txt
	done
}

case $1 in
	--date)
		data
		;;
	--logs)
		if [ -n $2 ]
		then
			logsNumber $2
		else
			logs
		fi
		;;
	*)
		echo "Podaj odpowiedni argument"
		;;
esac