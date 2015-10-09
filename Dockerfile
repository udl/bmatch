FROM skatsuta/docker-ruby-golang

ADD . /root/bmatch
WORKDIR /root/bmatch
RUN bundle install
RUN cd ext && ./build.sh
CMD bundle exec rspec
