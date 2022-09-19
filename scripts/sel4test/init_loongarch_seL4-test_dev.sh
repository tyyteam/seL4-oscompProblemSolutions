#this shell should run in the sel4test directory 
echo "start set sel4-test dev repo..."
if [ $# -lt 1 ]; then 
    echo "please input the protocol(http OR ssh) after the script"
    exit
fi

if [ ! -d "projects" ];then
	echo "please run at sel4test directory! shell failed!"
	exit
else
	printf "now at path: "
	pwd
fi

if [[ $1 != "ssh" ]] && [[ $1 != "http" ]]; then
	echo "wrong protocol type!"
elif [ $1 = "ssh" ]; then
	echo "select ssh protocol!"
	clone_url_prefix="git@github.com:tyyteam/la-"
else
	echo "select http protocol!"
	clone_url_prefix="https://github.com/tyyteam/la-"
fi

echo "start replace with loongarch repository..."

echo "start replace kernel..."
temp_repo=seL4.git
rm -rf kernel
git clone -b dev $clone_url_prefix$temp_repo kernel
if [ $? -eq 0 ]; then
	echo "git clone la-sel4 finished"
else
	echo "git clone la-sel4 failed"
	exit
fi


echo "start replace seL4 repo..."
cd tools

temp_repo=seL4_tools.git
rm -rf seL4
git clone -b dev $clone_url_prefix$temp_repo seL4
if [ $? -eq 0 ]; then
	echo "git clone la-sel4-tools finished"
else
	echo "git clone la-sel4-tools failed!"
	exit
fi


cd ../projects

echo "start replace musllibc repo..."
temp_repo=musllibc.git
rm -rf musllibc
git clone -b dev $clone_url_prefix$temp_repo musllibc
if [ $? -eq 0 ]; then
	echo "git clone musllibc finished"
else
	echo "git clone musllibc failed!"
	exit
fi



echo "start replace sel4runtime repo..."
temp_repo=sel4runtime.git
rm -rf sel4runtime
git clone -b dev $clone_url_prefix$temp_repo sel4runtime
if [ $? -eq 0 ]; then
	echo "git clone sel4runtime finished"
else
	echo "git clone sel4runtime failed!"
	exit
fi

echo "start replace sel4test repo..."
temp_repo=sel4test.git
rm -rf sel4test
git clone -b dev $clone_url_prefix$temp_repo sel4test
if [ $? -eq 0 ]; then
	echo "git clone sel4test finished"
else
	echo "git clone sel4test failed!"
	exit
fi

echo "start replace util_libs repo..."
temp_repo=util_libs.git
rm -rf util_libs
git clone -b dev $clone_url_prefix$temp_repo util_libs
if [ $? -eq 0 ]; then
	echo "git clone util_libs finished"
else
	echo "git clone util_libs failed!"
	exit
fi

echo "start replace seL4_libs repo..."
temp_repo=seL4_libs.git
rm -rf seL4_libs
git clone -b dev $clone_url_prefix$temp_repo seL4_libs
if [ $? -eq 0 ]; then
	echo "git clone seL4_libs finished"
else
	echo "git clone seL4_libs failed!"
	exit
fi

cd ..
echo "sel4-test dev repo has been set"
