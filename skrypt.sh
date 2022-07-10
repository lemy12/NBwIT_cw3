#!/bin/bash

data() {
	echo $(date)
}

logs() {
	mkdir logs
	cd logs
	for i in {1..100}
	do
		mkdir log$i
		echo "log$i.txt" >> log$i/log$i.txt
		echo "$(basename $BASH_SOURCE)" >> log$i/log$i.txt
		echo $(date) >> log$i/log$i.txt
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

init() {
	git clone $(pwd)
	PATH=$PATH:$(pwd)
}

error() {
	mkdir errors
	cd errors
	for i in {1..100}
	do
		mkdir error$i
		echo "error$i.txt" >> error$i/error$i.txt
		echo "$(basename $BASH_SOURCE)" >> error$i/error$i.txt
		echo $(date) >> error$i/error$i.txt
	done
}

errorNumber() {
	mkdir errors
	cd errors
	for i in $(seq 1 $1)
	do
		mkdir error$i
		echo "error$i.txt" >> error$i/error$i.txt
		echo "$(basename $BASH_SOURCE)" >> error$i/error$i.txt
		echo $(date) >> error$i/error$i.txt
	done
}

pomoc() {
	echo "--date - wyświetla obecną datę"
	echo "--logs - tworzy katalog logs, a w nim 100 plików logów"
	echo "--logs (numer) - tworzy katalog logs, a w nim (numer) plików logów"
	echo "--help - dostępne komendy"
}


case $1 in
	--date | -d)
		data
		;;
	--logs | -l)
		if [ $# -eq 2 ]
		then
			logsNumber $2
		else
			logs
		fi
		;;
	--init)
		init
		;;
	--error)
		if [ $# -eq 2 ]
		then
			errorNumber $2
		else
			error
		fi
		;;
	--help | -h)
		pomoc
		;;
	*)
		echo "Podaj odpowiedni argument"
		;;
esac