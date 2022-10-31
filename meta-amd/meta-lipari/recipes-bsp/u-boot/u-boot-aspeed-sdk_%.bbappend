FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# asper aspeed openbmc SRCREV = "ed55c4e7c3c4abacecaadda149656129f8b22965"
SRCREV = "754cbe66efcd7ddc5fc75b8ee69a579c3f960efa"

SRC_URI_append_uboot-flash-65536 += "file://u-boot_flash_64M.cfg \
                     file://lipari_uboot_dts.patch \
                     "
