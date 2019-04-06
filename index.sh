#!/bin/bash
#vtuber whole live recorder

if [[ ! -n "$1" ]]; then
  echo "usage: $0 [name] [format] [loop|once] [interval] [savefolder]"
  exit 1
fi
if [ ! -d "./savevideo/$1" ]; then
  mkdir ./savevideo/$1
fi

FORMAT="${2:-best}"
INTERVAL="${4:-150}"
SAVEFOLDER=$(grep "Savefolder" "$1".txt|cut -c 12-)
YOUTUBE=$(grep "youtube.com" "$1".txt)
BIL=$(grep "bilibili.com" "$1".txt|egrep -o "[0-9]{2,}+")
TWITCH=$(grep "twitch.tv" "$1".txt|cut -c 23-)
TWITCAST=$(grep "twitcast" "$1".txt|cut -c 24-)
#OPENREC=$(grep "openrec" "$1".txt|grep -v https://www.openrec.tv/user/|cut -c 29-)

#youtube
[[ -n "$YOUTUBE" ]] && ./record_youtube.sh $YOUTUBE $FORMAT $3 $INTERVAL $SAVEFOLDER &

#bil    
[[ -n "$BIL" ]] && ./record_bil.sh $BIL $FORMAT $3 $INTERVAL $SAVEFOLDER&

#twitch twitch_id [format] [loop|once] [interval] [savefolder]
[[ -n "$TWITCH" ]] && ./record_twitch.sh $TWITCH $FORMAT $3 $INTERVAL $SAVEFOLDER&

#TWITCAST录制路径仍未解决
[[ -n "$TWITCAST" ]] && ./record_twitcast.sh $TWITCAST  $3 $INTERVAL $SAVEFOLDER&
#OPENREC
#./record_openrec.sh $OPENRCE $FORAMT $3 $INTERVAL $SAVEFOLDER&
wait


#record传入log参数 
#菜单支持
#echo "https://twitcasting.tv/merrysan_cas_?"|grep "twitcast" |cut -c 24-


#./index.sh mana best loop 150 /home/centos/Recorder/savevideo/test/
#./record_youtube.sh https://www.youtube.com/channel/UCHog7L3CzsDg2GH9aza1bPg/live best loop 150 /home/centos/Recorder/savevideo/test/
#./record_bil.sh 14917277 150 /home/centos/Recorder/savevideo/test/
#./record_twitch.sh https://www.twitch.tv/yulihong22  best loop 150 /home/centos/Recorder/savevideo/test/
#./record_twitcast.sh  i_akr0920 best loop 150 /home/centos/Recorder/savevideo/test/

#./livedl -tcas -tcas-retry = on "i_akr0920" "/home/centos/Recorder/savevideo/test/1.ts > "$FNAME.livedl.log" 2>&1
