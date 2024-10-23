# ollama-server

## Docker Environment

### Build
~~~ shell
export ollama_ver=0.3.12
./build-image.sh
~~~
### Test
~~~ shell
export nextchat_ver=2.15.5
# run a ollama server
docker run --name ollama-server -it --rm -p 11434:11434 \
           -v $HOME/.ollama:/home/devel/.ollama \
           jianshao/ollama-server:$ollama_ver

# run a codellama with cli
docker exec -it ollama-server ollama run codellama

# run a next chat to verify
docker run -it --rm -p 3000:3000 --add-host=doccker-host:host-gateway\
           -e BASE_URL=http://doccker-host:11434 \
           yidadaa/chatgpt-next-web:$nextchat_ver
~~~
