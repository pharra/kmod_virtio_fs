obj-m += virtio_fs.ko

all:
	$(MAKE) -C $(LINUX_DIR) \
        ARCH="$(LINUX_KARCH)" \
        CROSS_COMPILE="$(TARGET_CROSS)" \
        SUBDIRS="$(PWD)" \
        M=fs/virtiofs

clean:
	$(MAKE) -C $(LINUX_DIR) \
        ARCH="$(LINUX_KARCH)" \
        CROSS_COMPILE="$(TARGET_CROSS)" \
        SUBDIRS="$(PWD)" \
        clean
