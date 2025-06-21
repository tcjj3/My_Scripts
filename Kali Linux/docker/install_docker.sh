#!/bin/sh








# Update Date & Time to avoid "Release file for xxxxxx is not vaild yet (invaild for another xxxd xxh xxmin xxs)" error:
ntpdate time.windows.com








apt install -y curl
curl -fsSL get.docker.com -o get-docker.sh










cp get-docker.sh get-docker.bak.sh










#sed -Ei "s/8\|'Kali Linux 2'\)$/8|'Kali Linux 2')\n\t\t\t\t\t\tdist_version='jessie'\n\t\t\t\t\t;;\n\n\t\t\t\t\t'kali-rolling')/gi" get-docker.sh
sed -Ei "s/11\|'Kali Linux 2'\)$/11|'Kali Linux 2')\n\t\t\t\t\t\tdist_version='bullseye'\n\t\t\t\t\t;;\n\n\t\t\t\t\t'kali-rolling')/gi" get-docker.sh

sed -Ei "s/debian\|raspbian\)$/debian|raspbian|kali)/gi" get-docker.sh

sed -Ei "s/ubuntu\|debian\|raspbian\)$/ubuntu|debian|raspbian|kali)/gi" get-docker.sh

#sed -Ei "s/8\)$/8)\n\t\t\t\t\tdist_version='jessie'\n\t\t\t\t;;\n\n\t\t\t\t'kali-rolling')/gi" get-docker.sh
sed -Ei "s/11\)$/11)\n\t\t\t\t\tdist_version='bullseye'\n\t\t\t\t;;\n\n\t\t\t\t'kali-rolling')/gi" get-docker.sh

#sed -Ei "s/pre_reqs=\"apt-transport-https/pre_reqs_=\"\"\n\t\t\tpre_reqs=\"apt-transport-https/gi" get-docker.sh
sed -Ei "s/pre_reqs=\"apt-transport-https ca-certificates curl\"$/pre_reqs=\"apt-transport-https ca-certificates curl\"\n\t\t\tpre_reqs_=\"\"/gi" get-docker.sh

sed -i "s/if \[ \"\$lsb_dist\" = \"debian\" \]; then$/if [ \"\$lsb_dist\" = \"debian\" ] || [ \"\$lsb_dist\" = \"kali\" ]; then/gi" get-docker.sh

sed -i "s/pre_reqs=\"\$pre_reqs gnupg\"$/pre_reqs=\"\$pre_reqs gnupg\"\n\t\t\t\tpre_reqs_=\"\$pre_reqs_ gnupg\"/gi" get-docker.sh

sed -i "s#\$sh_c 'apt-get update -qq >/dev/null'#\$sh_c 'apt-get update -qq >/dev/null' || \$sh_c 'echo \"continue...\" >/dev/null'#gi" get-docker.sh

sed -i "s#\$sh_c \"DEBIAN_FRONTEND=noninteractive apt-get install -y -qq \$pre_reqs >/dev/null\"#\$sh_c \"DEBIAN_FRONTEND=noninteractive apt-get install -y -qq \$pre_reqs >/dev/null\" || \$sh_c \"DEBIAN_FRONTEND=noninteractive apt-get install -y -qq \$pre_reqs_ >/dev/null\"#gi" get-docker.sh












chmod +x get-docker.sh
chmod +x get-docker.bak.sh

sh get-docker.sh || apt-get install -y -qq --no-install-recommends docker-ce containerd.io >/dev/null || (cgroupfs-mount > /dev/null 2>&1 && ip link add name docker0 type bridge > /dev/null 2>&1 && ip addr add dev docker0 172.17.0.1/16 > /dev/null 2>&1 && ifconfig docker0 up > /dev/null 2>&1 && apt-get install -y -qq --no-install-recommends docker-ce containerd.io >/dev/null)




groupadd docker

usermod -aG docker $USER

systemctl enable docker && systemctl start docker
















