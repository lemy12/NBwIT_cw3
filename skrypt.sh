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

pomoc() {
	echo "--date - wyświetla obecną datę"
	echo "--date -d - ???"
	echo "--logs - tworzy katalog logs, a w nim 100 plików logów"
	echo "--logs (numer) - tworzy katalog logs, a w nim (numer) plików logów"
	echo "--logs -l - ???"
	echo "--help - dostępne komendy"
	echo "--help -h - ???"
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
	--help)
		pomoc
		;;
	*)
		echo "Podaj odpowiedni argument"
		;;
esac