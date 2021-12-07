cd subdomains;
mkdir $1;
cd $1;

curl -s "https://subdomainfinder.c99.nl/scans/$(date +"%Y-%m-%d")/$1" -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0)" | grep -Po '.*?//\K.*?(?=/)'  | awk -F "'" '{print $1}' | anew  | grep $1 >> 99;
subfinder -d $1 -silent -o subfinder;
amass enum -passive -d $1 -o amass
