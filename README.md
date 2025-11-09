# Ubuntu

This project provides a custom Docker image based on Ubuntu, designed to simulate a minimal VPS environment. It includes an SSH server enabled by default, allowing users to interact with the container just like a typical remote server. This setup is ideal for testing, development, or training purposes where a lightweight and easily reproducible virtual server is needed.

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