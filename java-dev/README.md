# java-dev

~~~ shell
export java_ver=21
docker build -t jianshao/java-dev:$java_ver . --build-arg JAVA_VER=$java_ver
docker push jianshao/java-dev:$java_ver
~~~
