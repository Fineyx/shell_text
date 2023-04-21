#!bin/bash

echo "        系统维护菜单"
echo "=========================="
echo "1) 显示系统日期"
echo "2) 修改系统日期"
echo "3) 显示已登录用户"
echo "4) 重启计算机"
echo "5) 关机"
echo "=========================="


while (true)
do
	echo "请选择操作：" # select option
	read choice
	case $choice in
	1)
		date # show date
		;;
	2)
		echo "请输入新日期（格式：YYYY-MM-DD）："
		read newdate
		date -s $newdate # date changed
		if [ $? -eq 0 ]; then
			echo "修改成功"
		else
			echo "修改失败"
		fi
		;;
	3)
		who -u # display user
		;;
	4)
		reboot # restart
		;;
	5)
		halt # shutdown
		;;
	6)
		echo "退出菜单" # exit
		break
		;;
	*)
		echo "无效操作"
		;;
	esac
done
