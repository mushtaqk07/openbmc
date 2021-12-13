FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-meta-sp5-Modify-phosphor-network-to-set-host-name.patch \
            file://0002-recipes-phosphor-network-Prevent-DHCP-release-when-B.patch \
            file://0003-phosphor-network-board_id-added-for-hostname.patch \
            file://0004-phosphor-network-Modify-extended-hostname-setting.patch \
            file://0005-phosphor-network-Add-LCD-write-for-BMC-IP.patch \
            "
DEPENDS += "amd-lcd-lib"

TARGET_LDFLAGS += " -llcdlib32"

S = "${WORKDIR}/git"
