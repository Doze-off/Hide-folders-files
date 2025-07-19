#!/system/bin/sh

resetprop ro.boot.vbmeta.device_state locked
resetprop ro.boot.verifiedbootstate green
resetprop ro.boot.flash.locked 1
resetprop ro.boot.veritymode enforcing
resetprop ro.boot.warranty_bit 0
resetprop ro.warranty_bit 0
resetprop ro.debuggable 0
resetprop ro.secure 1
resetprop ro.build.type user
resetprop ro.build.tags release-keys
resetprop ro.vendor.boot.warranty_bit 0
resetprop ro.vendor.warranty_bit 0
resetprop vendor.boot.vbmeta.device_state locked
resetprop vendor.boot.verifiedbootstate green
resetprop sys.oem_unlock_allowed 0
resetprop init.svc.flash_recovery stopped
resetprop ro.force.debuggable 0
resetprop ro.adb.secure 1
resetprop ro.secureboot.devicelock 1
resetprop ro.secureboot.lockstate locked
resetprop ro.oem_unlock_supported 0
resetprop net.tethering.noprovisioning true
resetprop ro.boot.verifiedbootstate green
resetprop ro.vbmeta.device_state locked
resetprop ro.boot.secureboot 1
resetprop ro.bootmode recovery unknown
resetprop ro.boot.mode recovery unknown
resetprop vendor.bootmode recovery unknown
resetprop vendor.boot.mode recovery unknown
resetprop ro.boot.hwc CN GLOBAL
resetprop ro.boot.hwcountry China GLOBAL

resetprop --delete ro.build.selinux
resetprop --delete ro.lineage.build.version
resetprop --delete ro.lineage.build.version.plat.rev
resetprop --delete ro.lineage.build.version.plat.sdk
resetprop --delete ro.lineage.device
resetprop --delete ro.lineage.display.version
resetprop --delete ro.lineage.legal.url
resetprop --delete ro.lineage.releasetype
resetprop --delete ro.lineage.system.build.fingerprint
resetprop --delete ro.lineage.version

resetprop -v -n ro.product.first_api_level 32
