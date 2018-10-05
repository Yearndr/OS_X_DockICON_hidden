#!/usr/bin/env bash
# if [[ $1 >= 1 ]]; then
#   echo "This #$1#";
# fi
# if [[ $1 <= 0 ]]; then
#   echo "This *$1*";
# fi
# echo "Thsi is $0";
# blue = $2;
# if [[ $1>0 ]]; then
#   #statements
#   echo "$blue $1 o"
# fi

# function getName() {
# 	found=0;
# 	for item in $@ ; do
# 		if [[ $found == 1 ]]; then
# 			echo $item;
# 			found=0;
# 			break;
# 		fi
#
# 		if [[ "$item" == "-name" ]]; then
# 			found=1;
# 		fi
# 	done
# }
# getName $@
# name=`getopt n:m:: "$@"`;
# mark=0;
# echo "$name";
# while getopts :n:h opt
# do
#     case $opt in
#         n)
#             echo "-n=$OPTARG"
#             ;;
#             name=$OPTARG;
#         :)
#             echo "-$OPTARG needs an argument"
#             ;;
#         h)
#             echo "-h is set"
#             ;;
#         *)
#             echo "-$opt not recognized"
#             ;;
#     esac
# done




if [[ -n $1 ]]
then #判断是否至少传了一个参数
  if [[ -d "/Applications/$1.app" ]]
  then
    if [[ $2>0 ]]
    then #判断第二个参数是否小于0||是否传参 大于0为真
      defaults write /Applications/$1.app/Contents/Info.plist LSUIElement 1 #设置为隐藏
      sudo codesign -f -s - /Applications/$1.app #感觉像是重新打包编译之类的功效
      echo "$1以设置为Dock隐藏"
    else
      defaults write /Applications/$1.app/Contents/Info.plist LSUIElement 0
      sudo codesign -f -s - /Applications/$1.app
      echo "$1以设置为Dock显示"
    fi
  else
    echo "指定的应用程序不存在!"
  fi
else
  echo "请指定需要设置的应用程序名称！"
fi


#defaults write /Applications/QQ.app/Contents/Info.plist LSUIElement 1
#sudo codesign -f -s - /Applications/QQ.app
