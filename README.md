
## Usage

```bash
docker run -d \
  --name ubuntu \
  -p 2222:22 \
  -e SSH_USER=ubuntu \
  -e SSH_PASSWORD='ubuntu!23' \
  ghcr.io/linzziy/ubuntu:22
```

## 家目录初始化

> 1、权限设置

```sh
ls -l /home
sudo chown -R $USER:$USER /home/$USER
```

> 2、终端字体颜色美化、ls -l 命令别名设置等

```sh
curl -sk -o ~/.bashrc https://raw.githubusercontent.com/linzziy/ubuntu/refs/heads/main/.bashrc
curl -sk -o ~/.profile https://raw.githubusercontent.com/linzziy/ubuntu/refs/heads/main/.profile
```
