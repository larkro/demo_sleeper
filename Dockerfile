FROM ruby:3.0.2

RUN mkdir /app                          \ 
    && apt-get update && apt-get clean  \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN gem install async:1.30.1
COPY demo_sleeper.rb .

CMD ["./demo_sleeper.rb"]
