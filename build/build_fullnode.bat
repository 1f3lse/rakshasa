@echo off
cd ../

IF EXIST ./cert/private.go (
echo Start build fullnode
echo build windows
set GOOS=windows
go build -a -ldflags="-w -s" -trimpath -o ./bin/rakshasa_fullnode_amd64_win.exe main.go
echo build linux
set GOOS=linux
go build -a -ldflags="-w -s" -trimpath -o ./bin/rakshasa_fullnode_amd64_linux main.go
echo build darwin
set GOOS=darwin
go build -a -ldflags="-w -s" -trimpath -o ./bin/rakshasa_fullnode_amd64_darwin main.go
cd cert
del "private.go"
cd ../build
build_node.bat
) ELSE (
	echo �Ҳ���private.go,��ʹ�� go run build.go -full-node������
ping -n 3 127.0.0.1 > nul
) 
