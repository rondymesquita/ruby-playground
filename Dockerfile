FROM ruby:2.4.1

# Basis
RUN apt update
RUN apt install build-essential \
				curl \
				wget -y

RUN gem install bundle

#Finish
WORKDIR /home
ENV PORT 4567
EXPOSE 4567
