include $(TOPDIR)/rules.mk

PKG_NAME:=kmod-fs-virtiofs
PKG_VERSION:=1.0
PKG_RELEASE:=1
FS_MENU:=Filesystems

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_CONFIG_DEPENDS := CONFIG_VIRTIO_FS

include $(INCLUDE_DIR)/kernel.mk

define KernelPackage/fs-virtiofs
  SUBMENU:=$(FS_MENU)
  TITLE:=Kernel support for Virtio-FS
  DEPENDS:=+kmod-fuse
  FILES:=$(LINUX_DIR)/fs/fuse/virtiofs.ko
  AUTOLOAD:=$(call AutoLoad,30,virtiofs)
  KCONFIG:=CONFIG_VIRTIO_FS
endef

define KernelPackage/fs-virtiofs/description
  Kernel module for Virtiofs filesystem support
endef

define Build/Prepare
    mkdir -p $(PKG_BUILD_DIR)
    $(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
    $(MAKE) -C "$(LINUX_DIR)" \
        ARCH="$(LINUX_KARCH)" \
        CROSS_COMPILE="$(TARGET_CROSS)" \
        SUBDIRS="$(PKG_BUILD_DIR)" \
        modules
endef

$(eval $(call KernelPackage,fs-virtiofs))
