FILESEXTRAPATHS_prepend := "${THISDIR}/linux-aspeed:"

SRC_URI += "file://sp5.cfg \
            file://0001-ARM-dts-aspeed-Initial-device-tree-for-AMD-Onyx-Plat.patch \
            file://0002-ARM-dts-aspeed-Add-UART-changes-to-dts-for-SOL-enabl.patch \
            file://0003-ARM-dts-aspeed-Add-I2C-updates-to-dts-for-sensors.patch \
            file://0004-ARM-dts-aspeed-Add-kcs-ports-in-onyx.patch \
            file://0005-ARM-dts-aspeed-Add-device-tree-entry-for-SPI2.patch \
            file://0006-ARM-dts-aspeed-Add-device-tree-entry-for-GPIO0-bank.patch \
            file://0007-ARM-dts-aspeed-Add-device-tree-entry-for-JTAG.patch \
            file://0008-drivers-jtag-Add-Aspeed-SoC-24xx-25xx-26xx-families-.patch \
            file://0009-drivers-hwmon-pmbus-Adding-support-for-XDPE192xxx-an.patch \
            file://0010-ARM-dts-aspeed-Adding-device-tree-entries-for-Voltag.patch \
            file://0011-ARM-dts-aspeed-Add-device-tree-entries-to-enable-KVM.patch \
            file://0012-ARM-dts-aspeed-Add-Fan-controllers-to-dts.patch \
            file://0013-drivers-jtag-Fix-incorrect-TRST-implementation.patch \
            file://0014-drivers-i3c-Add-ast2600-i3c-patch.patch \
            file://0015-ARM-dts-aspeed-Add-I3C-controllers-to-dtsi-files-and.patch \
            file://0016-ARM-dts-aspeed-Add-I3C-entries-to-Onyx-dts-file.patch \
            file://0017-ARM-dts-aspeed-Correct-register-space-size-for-JTAG-.patch \
            file://0018-ARM-dts-aspeed-Quartz-initial-device-tree.patch \
            file://0019-ARM-dts-aspeed-Quartz-dts-fan-i2c-channels-add.patch \
            file://0020-ARM-dts-aspeed-Add-PSP-Soft-fuse-gpios.patch \
            file://0021-ARM-dts-aspeed-Adding-DIMM-SPD-slaves-to-the-device-.patch \
            file://0022-ARM-dts-aspeed-Adding-P0-P1-DIMM-SPD-slaves-to-the-Q.patch \
            file://0023-ARM-dts-aspeed-APML-over-I2C-device-tree-support-for.patch \
            file://0024-ARM-dts-aspeed-Add-Ruby-initial-device-tree.patch \
            file://0025-ARM-dts-aspeed-Add-Quartz-DTS-Temp-sensor.patch \
            file://0026-ARM-dts-aspeed-enable-espi-controller-in-onyx.patch \
            file://0027-ARM-dts-aspeed-enable-espi-controller-in-ruby.patch \
            file://0028-ARM-dts-aspeed-enable-espi-controller-in-quartz.patch \
            file://0029-drivers-soc-aspeed-espi-drv-addition.patch \
            file://0030-ARM-dts-aspeed-Add-led-definitions-for-fault-and-ide.patch \
            file://0031-hwmon-Add-support-for-SB-RMI-power-module.patch \
            file://0032-hwmon-sbrmi-Add-Documentation.patch \
            file://0033-dt-bindings-sbrmi-Add-SB-RMI-hwmon-driver-bindings.patch \
            file://0034-ARM-dts-aspeed-Add-dts-support-for-sbrmi-module-for-.patch \
            file://0035-ARM-dts-aspeed-Add-Titanite-initial-device-tree.patch \
            file://0038-recipes-kernel-linux-Adding-emc2301-driver-for-emc2305.patch \
            file://0039-ARM-dts-aspeed-Add-Onyx-and-Quartz-dts-fan-nodes.patch \
            file://0041-drivers-soc-aspeed-add-lpc-pcc-driver.patch \
            file://0042-ARM-dts-aspeed-Add-LPC-PCC-dts-for-sp5.patch \
            file://0043-ARM-dts-aspeed-enable-kcs-interface-for-SP5-platform.patch \
            file://0044-ARM-dts-aspeed-add-memory-region-to-LPC-PCC-for-sp5.patch \
            file://0045-ARM-dts-aspeed-add-board-eeproms-for-sp5-platforms.patch \
            file://0046-drivers-soc-aspeed-pcc-Enable-port-80h-83h-snooping.patch \
            file://0047-ARM-dts-aspeed-enable-pcc-record-mode-for-SP5-platfo.patch \
            file://0048-drivers-mtd-spi-nor-Add-support-for-Gigadevice-flash.patch \
            file://0049-linux-drivers-Update-JTAG-drivers-from-Aspeed.patch \
            file://0050-ARM-dts-aspeed-Add-Ruby-dts-fan-and-sb-tsi-nodes.patch \
            file://0051-linux-drivers-Add-fan-driver-for-titanite.patch \
            file://0052-ARM-dts-aspeed-Remove-board-SPD-for-sp5-platforms.patch\
            file://0053-linux-drivers-change-i2c-1-freq-to-50KHz-for-LCD.patch \
            file://0054-ARM-dts-aspeed-Remove-LCD-Mux-for-sp5.patch \
            "
