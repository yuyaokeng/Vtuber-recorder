# Vtuber-recorder
VTB多平台全自动录制
-----------------------------------------------------

环境依赖:ffmpeg,streamlink,biliroku-lite,livedl,youget,youtube-dl

-----------------------------------------------------
使用方法
新建一个txt文件放入脚本目录的config文件夹,并填入某个vtb的所有直播平台连接和你希望保存的路径(路径请使用绝对路径),每行一个
文件夹下有示例文件

------------------------------------------------------------
启动指令

./index.sh [name]     [format] ~~[loop|once][interval]现在在文件内指定

./index.sh txt文件名 需求的录像质量 ~~是否循环 每次循环检查时间 

例如./index.sh yumeno_shiori format 

------------------------------------------------------------

录像存储位置为脚本目录的savevideo下

------------------------------------------------------------
现版本bug
~~1.tc台的录制不会产生在设定目录~~

~~2.脚本无法终止,要么全关了,要么全开着~~

~~3.如果txt内没有写入目录并不会报错~~

~~4.进程结束后pid仍然缓存在running.txt下一次重启后将无法使用manager关闭当前进程~~

5.重启之后running文件内的信息并未清空将会与新产生的pid冲突,解决办法是重启后手动删除文件

6.manager击杀单进程后无法单独启动,只能一次全部击杀单人所有进程

------------------------------------------------------------
愿景:
0.添加批量运行脚本(最优先完成)

1.添加菜单

2.添加iriam录制(梦里)

~~3.监测机制使用更低资源占用~~

~~4.添加b站独播判断省的每天都是双倍的占用(优先度高)~~b站刚才一波空推流把循环系统耗死在上面了,为了容错暂时搁置

~~5.添加清理脚本在上传前把日志传输到专用日志文件夹~~自动清理已经部署，需求新的监测脚本运行状况


------------------------------------------------------------

感谢https://github.com/printempw/live-stream-recorder 的基础脚本 
