FROM debian:bookworm
LABEL description="Framework for maintaining and compiling native community packages for Synology devices"
LABEL maintainer="SynoCommunity <https://github.com/SynoCommunity/spksrc/graphs/contributors>"
LABEL url="https://synocommunity.com"
LABEL vcs-url="https://github.com/SynoCommunity/spksrc"

ENV LANG=C.UTF-8

# Specify required architectures, mostly needed for ARM64 environment
RUN dpkg --add-architecture amd64
RUN dpkg --add-architecture i386
RUN dpkg --add-architecture armel
RUN dpkg --add-architecture armhf

# Install required packages (in sync with README.rst instructions)
# ATTENTION: the total length of the following RUN command must not exceed 1024 characters
RUN apt update && apt install --no-install-recommends -y \
	autoconf-archive \
	autogen \
	automake \
	autopoint \
	bash \
	bash-completion \
	bc \
	bison \
	build-essential \
	check \
	cmake \
	curl \
	cython3 \
	debootstrap \
	ed \
	expect \
	fakeroot \
	flex \
	gh \
	gawk \
	gettext \
	git \
	gperf \
	imagemagick \
	intltool \
	jq \
	libtool-bin \
	libbz2-dev \
	libc6 \
	libstdc++6 \
	libcppunit-dev \
	libffi-dev \
	libgc-dev \
	libgmp3-dev \
	libltdl-dev \
	libmount-dev \
	libncurses-dev \
	libpcre3-dev \
	libssl-dev \
	libtool \
	libunistring-dev \
	lzip \
	man-db \
	manpages-dev \
	mlocate \
	moreutils \
	nasm \
	p7zip \
	patchelf \
	php \
	pkg-config \
	rename \
	ripgrep \
	rsync \
	ruby-mustache \
	scons \
	subversion \
	sudo \
	swig \
	texinfo \
	time \
	tree \
	unzip \
	xmlto \
	yasm \
	zip \
	zlib1g-dev

# Install prerequisites when executing on ARM64
RUN apt install --no-install-recommends -y \
	libc6-dev:amd64 \
	libicu72:amd64 \
	libssl-dev:amd64 \
	libstdc++6:amd64 \
	zlib1g-dev:amd64 \
	libc6:i386 \
 	libicu72:i386 \
 	libssl-dev:i386 \
 	libstdc++6:i386 \
 	zlib1g-dev:i386 

RUN apt install --no-install-recommends -y \
	libc6-dev:armel \
	libicu72:armel \
	libssl-dev:armel \
	libstdc++6:armel \
	zlib1g-dev:armel \
	libc6-dev:armhf \
	libicu72:armhf \
	libssl-dev:armhf \
	libstdc++6:armhf \
	zlib1g-dev:armhf

# Python based apps
RUN apt install --no-install-recommends -y \
	httpie \
	mercurial \
	meson \
	ninja-build \
	python3 \
	python3-distutils \
	python3-mako \
	python3-pip \
	python3-virtualenv \
	python3-yaml

# Clean-up apt db
RUN apt clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Update locate db
RUN updatedb

# Add user
RUN adduser --disabled-password --gecos '' user && \
	adduser user sudo && \
	echo "%user ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/users

# Volume pointing to spksrc sources
VOLUME /spksrc
WORKDIR /spksrc
