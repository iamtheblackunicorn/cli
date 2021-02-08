build: ; cd .. && tar -cvzf cli.tgz cli && mv cli.tgz cli && ls
test: ; dart pub get && dart analyze && cd example && cd lib && dart main.dart --greet Alex
