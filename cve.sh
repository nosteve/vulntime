#!/bin/zsh
set +u
echo "CVE,"`head -1 $1`
while read -r line; do
  [[ $line =~ 'CVE-[0-9]+-[0-9]+' ]];
    echo "\"$MATCH\",$line"
    unset MATCH

done < <(tail -n +2 $1)
#done < <(tail -n +2 $1 |awk -F'"' -v OFS='' '{ for (i=4; i<=NF; i+=2) gsub(",", "", $i) } 1' |tr -d "\"" |tr -d '\000')
