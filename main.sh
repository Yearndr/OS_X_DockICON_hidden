#!/usr/bin/env bash

if [[ -n $1 ]] #判断是否至少传了一个参数
then 
  if [[ -d "/Applications/$1.app" ]]
  then
    if [[ $2>0 ]] #判断第二个参数是否小于0||是否传参 大于0为真
    then 
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
#END
