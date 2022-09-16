#this shell should run in the sel4test directory 
echo "start pull sel4-test dev repo..."

if [ ! -d "projects" ];then
	echo "please run at sel4test directory! shell failed!"
	exit
else
	printf "now at path: "
	pwd
fi

echo "start pull kernel repo..."
cd kernel
echo "pull from la-seL4"
git pull
cd ..

echo "start pull sel4-tools repo..."
cd tools
cd seL4
echo "pull from sel4-tools"
git pull
cd ..

cd ../projects
echo "start pull musllibc repo..."
cd musllibc
echo "pull from musllibc"
git pull
cd ..

echo "start pull sel4runtime repo..."
cd sel4runtime
echo "pull from sel4runtime"
git pull
cd ..

echo "start pull sel4test repo..."
cd sel4test
echo "pull from sel4test"
git pull
cd ..

echo "start pull util_libs repo..."
cd util_libs
echo "pull from util_libs"
git pull
cd ..

echo "start pull seL4_libs repo..."
cd seL4_libs
echo "pull from seL4_libs"
git pull
cd ..

cd ..
echo "sel4-test dev repo has been pulled"
