FROM google/dart

WORKDIR /app

ADD pubspec.* /app/
RUN pub get --no-precompile

add . /app/
RUN pub get --offline --no-precompile

EXPOSE 80

ENTRYPOINT ["pub", "run", "aqueduct:aqueduct", "serve", "--port", "80"]