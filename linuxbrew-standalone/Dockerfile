FROM sjackman/linuxbrew-core
MAINTAINER Shaun Jackman <sjackman@gmail.com>

USER root
RUN ln -s /usr/lib/x86_64-linux-gnu /usr/lib64
USER linuxbrew

RUN mkdir ~/.linuxbrew/lib \
	&& ln -s lib ~/.linuxbrew/lib64 \
	&& ln -s /usr/lib64/libstdc++.so.6 /lib64/libgcc_s.so.1 ~/.linuxbrew/lib/

RUN brew install glibc \
	&& brew unlink glibc

RUN brew install https://raw.githubusercontent.com/Homebrew/homebrew-dupes/master/zlib.rb
RUN brew reinstall binutils

RUN brew link glibc
RUN brew install gcc --with-glibc --only-dependencies
RUN brew install gcc --with-glibc -v
RUN rm -f ~/.linuxbrew/lib/{libstdc++.so.6,libgcc_s.so.1}
RUN brew link gcc

RUN brew install curl expat git
RUN brew tap homebrew/dupes
RUN brew install bzip2 coreutils findutils gawk gnu-sed gnu-which grep libpng libxml2 libxslt make ncurses readline

RUN ln -s ncursesw/curses.h ~/.linuxbrew/include/ \
	&& ln -s libncursesw.so ~/.linuxbrew/lib/libncurses.so \
	&& ln -s libncursesw.so ~/.linuxbrew/lib/libcurses.so

RUN brew install ruby

ENV PATH ~/.linuxbrew/bin:~/.linuxbrew/sbin
RUN brew doctor
