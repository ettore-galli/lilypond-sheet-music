# LILYPOND

## Lilypond setup

```sh
docker build -t lilypond-runtime -f ci/Dockerfile .
```

## Basic usage

Enter the environment

```sh
./lilyenv.sh 
```

Compile the source file

```sh
lilypond -o /created /music/source/my-source-file.ly 
```
