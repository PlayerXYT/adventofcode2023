total=0

while read line; do
	plays=$(echo $line | sed -E "s/(Game .+?: )//g
	s/[;,] ?/;/g")
	playcount=$(echo $plays | sed -E "s/[^;]//g" | wc -c)

	red=0
	blue=0
	green=0

	for playnum in $(seq 1 $playcount); do
		play=$(echo $plays | cut -f $playnum -d ";")
		count=$(echo $play | cut -f 1 -d " ")
		color=$(echo $play | cut -f 2 -d " ")

		if test $color = "red" && test $count -gt $red; then
			red=$count
		elif test $color = "green" && test $count -gt $green; then
			green=$count
		elif test $color = "blue" && test $count -gt $blue; then
			blue=$count
		fi
	done
	total=$(($total + ($red*$blue*$green)))
done < 2i

echo $total
