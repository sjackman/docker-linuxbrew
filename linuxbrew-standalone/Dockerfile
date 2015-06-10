FROM sjackman/linuxbrew-gcc
MAINTAINER Shaun Jackman <sjackman@gmail.com>

# Install tcl for git
RUN brew install https://raw.githubusercontent.com/Homebrew/homebrew-dupes/master/tcl-tk.rb --without-tk

RUN brew install bzip2 curl git
RUN brew tap homebrew/dupes
RUN brew install coreutils findutils gawk gnu-sed gnu-which grep make
RUN brew install ruby

RUN brew doctor
