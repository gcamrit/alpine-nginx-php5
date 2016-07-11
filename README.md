## Pull it from docker registry

To pull the docker image you can do it with:

```
docker pull amritgc/alpine-nginx-php5
```

## Usage

After pulling the image from docker registry, go into project directory
Then run the following commands to run php or composer:

```
docker run -v $(pwd):/var/www -p 80:80 amritgc/alpine-nginx-php5
```

## As base image

You can use it as a base image like below:

```
FROM geshan/amritgc/alpine-nginx-php5

```
