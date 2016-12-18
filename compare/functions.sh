
#makes find work with spaces in paths
ORG_IFS=$IFS

kmotiondir=~/'git/KMotionX'
includedir="$kmotiondir/DSP_KFLOP"
#TODO test if includedir exists

includeoption="-I $includedir"
linklib=$includedir/DSPKFLOP.out
debug_flag="-g"
text_address="8005000"

function compileOld {
    local source_file="$1"
    local out_file="$2"
    local params="-text $text_address $debug_flag -static -nostdinc"
#   echo compiling $source_file
    $kmotiondir/bin/tcc67 $params $includeoption -o "$out_file" "$source_file" $linklib > /dev/null 2>&1
#   mv TCC67_out.txt TCC67_out916.txt
}

function compileNew {

    local source_file="$1"
    local out_file="$2"
    local params="$debug_flag -Wl,-Ttext,$text_address -Wl,--oformat,coff -fcommon -static -nostdlib -nostdinc"
#   echo compiling $source_file
    ~/git/tinycc-c67/c67-tcc $params $includeoption -o "$out_file" "$source_file" $linklib #> /dev/null 2>&1
#   mv TCC67_out.txt TCC67_out926.txt
}

function compare {
    if cmp -s "$2" "$3"; then
        echo Ok "$1"
    else
#diff -W160 -y <(xxd $2) <(xxd $3)
        echo Failure. File output differs for source file  "$1"
    #   exit
    fi
}

function init_out_file {
    local version="$1"
    local out_file="$2"
    rm $out_file
    echo Compile failed $version > $out_file
}

function test_source_file {

    local filename="$1"
    local outfileNew="/tmp/tccnew.out"
    local outfileOld="/tmp/tccold.out"
    init_out_file "0.9.26" "$outfileNew"
    init_out_file "0.9.16" "$outfileOld"

    compileOld "$filename" $outfileOld
    compileNew "$filename" $outfileNew
    compare "$filename" $outfileOld $outfileNew

}

function test_source_files {
    local sourcedir="$1"
    IFS=$'\n\t'

    local paths=`find "$sourcedir" -type d`
    for path in $paths
    do
        IFS=$ORG_IFS
        for filename in "$path"/*.c; do
            test_source_file "$filename"
        done
    done

}
