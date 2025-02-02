PKG_NAME = go
PKG_VERS = 1.23.5
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)$(PKG_VERS).linux-$(PKG_DIST_ARCH).$(PKG_EXT)
PKG_DIST_SITE = https://dl.google.com/go
PKG_DIR = $(PKG_NAME)

HOMEPAGE = https://golang.org/
COMMENT  = Go is an open source programming language that makes it easy to build simple, reliable, and efficient software.
LICENSE  = BSD-style

# get native CPU arch
EXECUTING_ARCH = $(shell uname -m)
SUPPORTED_x64 = x86_64
SUPPORTED_ARM64 = aarch64 arm64

ifeq ($(findstring $(EXECUTING_ARCH), $(SUPPORTED_x64)),$(EXECUTING_ARCH))
PKG_DIST_ARCH = amd64
else ifeq ($(findstring $(EXECUTING_ARCH), $(SUPPORTED_ARM64)),$(EXECUTING_ARCH))
PKG_DIST_ARCH = arm64
else
$(error unsupported executing architecture [$(EXECUTING_ARCH)])
endif

# extract only to $(WORK_DIR)
INSTALL_TARGET = nop

include ../../mk/spksrc.native-install.mk

https://dl.google.com/go/go1.23.5.linux-amd64.tar.gz