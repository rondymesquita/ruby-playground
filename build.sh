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
  build_if_not_exists
  echo "*** Running"
  docker run -ti -p 4567:4567 -v $(pwd):/home/$USER/dev -e USER=$USER -e USERID=$UID $IMAGE_NAME bash
}

clean(){
  echo "*** Removing image $IMAGE_NAME"
  docker rmi -f $IMAGE_NAME
}

destroy(){
  echo "*** This will remove all containers"
  ask_for_confirmation
  OPTION=$?
  if [ "$OPTION" = 1 ]; then
    docker rm -f $(docker ps -aq)
  fi
}

ask_for_confirmation(){
  read -p "Continue (y/n)?" CHOICE
  case "$CHOICE" in
    y|Y ) OPTION=1;;
    n|N ) OPTION=0;;
    * ) echo "Invalid option!";;
  esac

  return $OPTION
}

say_something(){
  return "yes"
}

for TASK in "$@"
do
 $TASK
done

if [ "$1" = "" ]; then
  build
fi

if [ "$1" = "ask" ]; then
  ask_for_confirmation
  OPTION=$?
  echo "$OPTION"
fi
