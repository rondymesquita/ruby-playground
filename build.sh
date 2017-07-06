#! /bin/bash
IMAGE_NAME="ruby-playground"

hello(){
  echo "*** $IMAGE_NAME"
}

build(){
  echo "*** Building image $IMAGE_NAME"
  docker build -t $IMAGE_NAME .
}

build_if_not_exists(){
  if [ "$(docker images -q $IMAGE_NAME 2> /dev/null)" = "" ]; then
    echo "*** Image does not exists"
    build
  fi
}

run(){
  echo "*** Running"
  docker run -ti -p 4567:4567 -v $(pwd):/home/$USER/dev -e USER=$USER -e USERID=$UID $IMAGE_NAME bash
}

clean(){
  echo "*** Cleaning image $IMAGE_NAME"
  docker rmi -f $IMAGE_NAME
}

destroy(){
  echo "*** Destroy"
  docker rm -f $(docker ps -aq)
}

if [ "$1" = "hello" ]; then
  hello
fi

if [ "$1" = "" ]; then
  build
fi

if [ "$1" = "run" ]; then
  build_if_not_exists
  run
fi

if [ "$1" = "clean" ]; then
  clean
fi

if [ "$1" = "destroy" ]; then
  destroy
fi
