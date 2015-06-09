FROM sjackman/linuxbrew-core
MAINTAINER Shaun Jackman <sjackman@gmail.com>

USER root
RUN ln -s /usr/lib/x86_64-linux-gnu /usr/lib64
USER linuxbrew

RUN mkdir $HOME/.linuxbrew/lib \
	&& ln -s lib $HOME/.linuxbrew/lib64

RUN brew install glibc

RUN brew unlink glibc
RUN brew install https://raw.githubusercontent.com/Homebrew/homebrew-dupes/master/zlib.rb
RUN brew reinstall binutils
RUN brew link glibc

RUN brew install patchelf
RUN brew install gcc --with-glibc --only-dependencies
RUN brew install gcc --with-glibc

# Install tcl for git
RUN brew install https://raw.githubusercontent.com/Homebrew/homebrew-dupes/master/tcl-tk.rb --without-tk

RUN brew install bzip2 curl git
RUN brew tap homebrew/dupes
RUN brew install coreutils findutils gawk gnu-sed gnu-which grep make
RUN brew install ruby

RUN brew doctor
