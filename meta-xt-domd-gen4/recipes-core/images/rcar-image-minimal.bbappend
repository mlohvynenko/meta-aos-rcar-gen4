IMAGE_INSTALL += " \
    pciutils \
    devmem2 \
    iccom-support \
    optee-test \
"

IMAGE_INSTALL += "iproute2 tcpdump"

# Aos components
IMAGE_INSTALL += " \
    aos-communicationmanager \
    aos-iamanager \
    aos-servicemanager \
    aos-updatemanager \
    aos-vis \
"

# Aos related tasks

ROOTFS_POSTPROCESS_COMMAND_append += "set_board_model; set_rootfs_version;"

set_board_model() {
    install -d ${IMAGE_ROOTFS}/etc/aos

    echo "${BOARD_MODEL}" > ${IMAGE_ROOTFS}/etc/aos/board_model
}

set_rootfs_version() {
    install -d ${IMAGE_ROOTFS}/etc/aos

    echo "VERSION=\"${DOMD_IMAGE_VERSION}\"" > ${IMAGE_ROOTFS}/etc/aos/version
}
