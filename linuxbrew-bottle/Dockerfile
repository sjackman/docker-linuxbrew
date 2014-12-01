FROM sjackman/linuxbrew-core
MAINTAINER Shaun Jackman <sjackman@gmail.com>

USER root
RUN ln -s /usr/lib/x86_64-linux-gnu /usr/lib64
USER linuxbrew

RUN mkdir $HOME/.linuxbrew/lib \
	&& ln -s lib $HOME/.linuxbrew/lib64

ENV HOMEBREW_BUILD_BOTTLE 1
ENV HOMEBREW_DEVELOPER 1

RUN brew install glibc
RUN brew postinstall glibc

RUN brew unlink glibc
RUN brew install https://raw.githubusercontent.com/Homebrew/homebrew-dupes/master/zlib.rb
RUN brew reinstall binutils
RUN brew link glibc

RUN brew install patchelf
RUN brew install gcc --with-glibc --only-dependencies
RUN brew install gcc --with-glibc
RUN brew bottle gcc
RUN brew postinstall gcc

RUN brew install curl expat git
RUN brew tap homebrew/dupes
RUN brew install bzip2 coreutils findutils gawk gnu-sed gnu-which grep \
	libpng libxml2 libxslt make ncurses readline

RUN ln -s ncursesw/curses.h $HOME/.linuxbrew/include/

RUN brew install ruby

RUN brew doctor

RUN mkdir bottles
WORKDIR bottles
ENV HOMEBREW_DEBUG 1
ENV HOMEBREW_VERBOSE 1
RUN brew list
RUN brew bottle --rb `brew list |egrep -vw 'gcc|glibc'`
RUN brew bottle --merge *.bottle.rb
