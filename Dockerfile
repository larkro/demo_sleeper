FROM ruby:3.1.2

RUN mkdir /app                          \ 
    && apt-get update && apt-get clean  \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN gem install async:2.0.1
COPY demo_sleeper.rb .

CMD ["./demo_sleeper.rb"]
