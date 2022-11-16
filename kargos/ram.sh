MemTotal="$(cat /proc/meminfo | grep MemTotal: | awk '{print $2}')"
#MemTotalDec="$(echo "scale=2; $MemTotal / 1048576" | bc -l)"
MemTotalDec="$(echo "scale=2; $MemTotal / 1000000" | bc -l)"
MemAvailable="$(cat /proc/meminfo | grep MemAvailable: | awk '{print $2}')"
MemUsage="$(( $MemTotal - $MemAvailable ))"
MemUsageDec="$(echo "scale=2; $MemUsage / 1048576" | bc -l)"

echo "💾 $MemUsageDec GiB"
#echo "💾 $MemUsageDec GB / $MemTotalDec GB "
