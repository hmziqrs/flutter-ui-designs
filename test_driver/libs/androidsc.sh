if [ $# -eq 0 ]
then
name="screenshot.png"
else
name="$1"
fi
adb shell screencap -p > $name
curr_dir=pwd
echo "save to `pwd`/$name"