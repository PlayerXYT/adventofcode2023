total=0

while read line; do
	game=$(echo $line | cut -f 2 -d " " | cut -f 1 -d ":")
	plays=$(echo $line | sed -E "s/(Game .+?: )//g
	s/[;,] ?/;/g")
	playcount=$(echo $plays | sed -E "s/[^;]//g" | wc -c)

	for playnum in $(seq 1 $playcount); do
		play=$(echo $plays | cut -f $playnum -d ";")
		count=$(echo $play | cut -f 1 -d " ")
		color=$(echo $play | cut -f 2 -d " ")

		if (test $color = "red" && test $count -gt 12) ||\
			(test $color = "green" && test $count -gt 13) ||\
			(test $color = "blue" && test $count -gt 14); then
			continue 2
		fi
	done
	total=$(($total + $game))
done < 2i

echo $total
