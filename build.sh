docker build -t ruby-hello .
docker run -ti -p 4567:4567 -v $(pwd):/home/$USER/dev -e USER=$USER -e USERID=$UID ruby-hello bash
