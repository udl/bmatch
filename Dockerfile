FROM skatsuta/docker-ruby-golang

RUN apt-get update
RUN apt-get install -y apport
ADD . /root/bmatch
WORKDIR /root/bmatch
RUN bundle install
RUN cd ext && ./build.sh
CMD bundle exec rspec
