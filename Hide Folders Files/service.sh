#!/system/bin/sh

# Falsifica status do bootloader
resetprop ro.boot.flash.locked 1
resetprop ro.boot.verifiedbootstate green
resetprop ro.boot.vbmeta.device_state locked
resetprop ro.vbmeta.device_state locked
resetprop ro.boot.secureboot 1
resetprop ro.boot.veritymode enforcing
resetprop ro.boot.warranty_bit 0
resetprop ro.warranty_bit 0

# SafetyNet e compatibilidade com apps bancários
resetprop sys.oem_unlock_allowed 0
resetprop ro.oem_unlock_supported 0
resetprop net.tethering.noprovisioning true

# Ajuste do Init.rc para evitar detecção de recovery modificado
resetprop init.svc.flash_recovery stopped

# Falsifica status de criptografia
resetprop ro.crypto.state encrypted

# Configurações de segurança
resetprop ro.secure 1
resetprop ro.secureboot.devicelock 1
resetprop ro.secureboot.lockstate locked

# Desativa debugging e ADB over network
resetprop ro.force.debuggable 0
resetprop ro.debuggable 0
resetprop ro.adb.secure 1

resetprop ro.build.type user
resetprop ro.build.tags release-keys

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