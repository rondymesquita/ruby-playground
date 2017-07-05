#! /bin/bash
IMAGE_NAME="ruby-playground"

if [ "$1" = hello ]; then
  echo "*** $IMAGE_NAME"
fi

if [ "$1" = build ]; then
  echo "*** Building"
  docker build -t $IMAGE_NAME .
fi

if [ "$1" = run ]; then
  if [ "$(docker images -q $IMAGE_NAME 2> /dev/null)" = "" ]; then
    echo "*** Image does not exists. So, building"
  fi
  echo "*** Running"
  docker run -ti -p 4567:4567 -v $(pwd):/home/$USER/dev -e USER=$USER -e USERID=$UID $IMAGE_NAME bash
fi

if [ "$1" = clean ]; then
  docker rmi -f $IMAGE_NAME
fi

# if [ "$1" == destroy ]; then
#   docker rm -f $(docker ps -aq)
# fi
