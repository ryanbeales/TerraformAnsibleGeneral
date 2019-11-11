DICT=/usr/share/dict/words
RANGE=$(wc -l ${DICT} | cut -d\  -f1)
while true; do
sleep 5
number=$(awk 'BEGIN{srand();print int(rand()*'${RANGE}')}') # or shuf, or jot, but awk is everywhere
let "number %= $RANGE"
sed ${number}'!d' $DICT
done
