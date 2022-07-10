#!/bin/bash

data() {
	echo $(date)
}

logs() {
	mkdir logs
	cd logs
	for i in {1..5}
	do
		touch log$i.txt
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
		logs
		;;
	*)
		echo "Podaj odpowiedni argument"
		;;
esac