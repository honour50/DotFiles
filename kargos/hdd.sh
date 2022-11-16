hdd=$(df -h / | awk '/\// {print $(NF-1)}')
#hdd=$("df")
echo "HDD $hdd"
