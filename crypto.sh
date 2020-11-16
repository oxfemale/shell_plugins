#!/bin/bash
# Nicholas Farrow 2020
crypto_rate () {
	if [ "$1" == "BTC" ]; then ln=2; else ln=1; fi
	echo "$(curl -s rate.sx | grep $1 | sed -n ${ln}p | grep -Eo "[0-9]*\.[0-9]*" | head -1)"
}

BTC=$(crypto_rate "BTC")
ETH=$(crypto_rate "ETH")
RATIO=$(bc <<< "scale=4;$ETH/$BTC")

printf "BTC:%0.0f " $BTC
printf "ETH:%0.0f " $ETH
printf "E/B:%0.3f\n" $RATIO
#echo -e "BTC:$BTC ETH:$ETH ETH/BTC:0$RATIO"
