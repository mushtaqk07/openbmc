FILESEXTRAPATHS_prepend := "${THISDIR}/linux-aspeed:${THISDIR}/linux-aspeed/aspeed-g6:"

KBRANCH = "dev-5.15"
LINUX_VERSION = "5.15.30"

#SRCREV="45c6dc0de963bfdd8b468dceeea24f56a8e51424"
SRCREV="191d5d420258a7c849d61e21f780124641caca0a"

SRC_URI += "file://defconfig \
	    file://0001-lipari-dts-changes.patch \
	    "
