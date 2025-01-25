PKG_NAME = nodejs
# https://github.com/nodejs/release#release-schedule
# v18 is Maintenance Version "Hydrogen" since 2023-10-18 with EOL at 2025-04-30
# v20 is Maintenance Version "Iron" since 2024-10-22 with EOL at 2026-04-30
# v22 is LTS Version "Jod" from 2024-10-29 to 2025-10-21 with EOL at 2027-04-30
PKG_VERS = 22.13.1
PKG_EXT = tar.xz
PKG_DIST_NAME = node-v$(PKG_VERS)-linux-$(PKG_DIST_ARCH).$(PKG_EXT)
PKG_DIST_SITE = https://nodejs.org/dist/v$(PKG_VERS)
PKG_DIR = node-v$(PKG_VERS)-linux-$(PKG_DIST_ARCH)

HOMEPAGE = https://nodejs.org/
COMMENT  = JavaScript runtime built on Chrome's V8 JavaScript engine.
LICENSE  = https://github.com/nodejs/node/blob/master/LICENSE

# get native CPU arch
EXECUTING_ARCH = $(shell uname -m)
SUPPORTED_x64 = x86_64
SUPPORTED_ARM64 = aarch64 arm64

ifeq ($(findstring $(EXECUTING_ARCH), $(SUPPORTED_x64)),$(EXECUTING_ARCH))
PKG_DIST_ARCH = x64
else ifeq ($(findstring $(EXECUTING_ARCH), $(SUPPORTED_ARM64)),$(EXECUTING_ARCH))
PKG_DIST_ARCH = arm64
else
$(error unsupported executing architecture [$(EXECUTING_ARCH)])
endif

INSTALL_TARGET = nodejs-install

include ../../mk/spksrc.native-install.mk

.PHONY: nodejs-install
nodejs-install:
	@mv -f $(WORK_DIR)/$(PKG_DIR)/ $(WORK_DIR)/node/
