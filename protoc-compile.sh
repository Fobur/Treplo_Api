if [[ $# -eq 0 ]] ;then 
    echo "No arguments provided. Should have version e.g. v1"
    exit 1
fi

if [ ! -d $1 ] ;then 
    echo "No such version $v1"
    exit 1
fi

for f in $(ls $1/proto); do
    if [ ! -d compiled/$1 ] ;then 
        mkdir compiled/$1/ -p
    fi
    protoc -I=$1/proto/ $1/proto/$f --csharp_out=compiled/$1/
done