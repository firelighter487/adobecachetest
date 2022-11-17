#!/bin/bash
#!/bin/bash
count="10"
while true; do
    output=$(curl -sL "https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-${count}&arch=x86_64&country=global" | grep -oP 'https?://\K[^/]*' | sort -u)
    echo "${output}" >>/tmp/fedora.txt
    if [ -z "${output}" ]; then
        echo "No more mirrors"
        break
    fi
    echo $count
    count=$((count + 1))
done

sort -u /tmp/fedora.txt >rhel.txt
