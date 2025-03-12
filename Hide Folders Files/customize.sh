
sleep 2
ui_print " • Informações do módulo "
sleep 0.2
ui_print " • Nome            : Hide folders/files"
sleep 0.2
ui_print " • Desenvolvedor   : @NedTOP "
sleep 0.2
# Ocultar pastas e arquivos com `mount --bind`
ui_print ""
ui_print " • Iniciando o processo de ocultação..."

# Verificar e criar diretórios vazios para redirecionamento
mkdir -p /data/overlay/empty/system/addon.d
mkdir -p /data/overlay/empty/vendor/bin
mkdir -p /data/overlay/empty/system/etc/init/hw
sleep 2
# Redirecionar a pasta /system/addon.d
if [ -d /system/addon.d ]; then
    ui_print ""
    ui_print " • Ocultando a pasta /system/addon.d "
    mount --bind /data/overlay/empty/system/addon.d /system/addon.d
    sleep 0.2
    ui_print ""
    ui_print " • /system/addon.d "
    ui_print " • Ocultada com sucesso. "
else
    sleep 0.2
    ui_print ""
    ui_print " • /system/addon.d "
    ui_print " • Não encontrada, nada a ocultar. "
fi
sleep 2
# Redirecionar o arquivo /system/vendor/bin/install-recovery.sh
if [ -f /system/vendor/bin/install-recovery.sh ]; then
    ui_print ""
    ui_print " • Ocultando o arquivo: "
    ui_print " • /system/vendor/bin/install-recovery.sh "
    touch /data/overlay/empty/vendor/bin/install-recovery.sh
    mount --bind /data/overlay/empty/vendor/bin/install-recovery.sh /system/vendor/bin/install-recovery.sh
    sleep 0.2
    ui_print " • Ocultado com sucesso."
else
    sleep 0.2
    ui_print ""
    ui_print " • /system/vendor/bin/install-recovery.sh "
    ui_print " • Não encontrado, nada a ocultar. "
fi
sleep 2
# Redirecionar o arquivo /system/etc/init/hw/init.rc
if [ -f /system/etc/init/hw/init.rc ]; then
    ui_print ""
    ui_print " • Ocultando o arquivo: "
    ui_print " • /system/etc/init/hw/init.rc "
    touch /data/overlay/empty/system/etc/init/hw/init.rc
    mount --bind /data/overlay/empty/system/etc/init/hw/init.rc /system/etc/init/hw/init.rc
    sleep 0.2
    ui_print " • Ocultado com sucesso. "
else
    sleep 0.2
    ui_print ""
    ui_print " • /system/etc/init/hw/init.rc "
    ui_print " • Não encontrado, nada a ocultar."
fi
sleep 2
# Garantir persistência após reboot
ui_print ""
ui_print " • Configurando persistência... "
MAGISK_DIR="/data/adb/service.d"
mkdir -p "$MAGISK_DIR"
cat <<EOF >"$MAGISK_DIR/overlay_persist.sh"
#!/system/bin/sh

# Reaplicar montagens após reboot

# Ocultar /system/addon.d
mkdir -p /data/overlay/empty/system/addon.d
if [ -d /system/addon.d ]; then
    mount --bind /data/overlay/empty/system/addon.d /system/addon.d
fi

# Ocultar /system/vendor/bin/install-recovery.sh
mkdir -p /data/overlay/empty/vendor/bin
touch /data/overlay/empty/vendor/bin/install-recovery.sh
if [ -f /system/vendor/bin/install-recovery.sh ]; then
    mount --bind /data/overlay/empty/vendor/bin/install-recovery.sh /system/vendor/bin/install-recovery.sh
fi

# Ocultar /system/etc/init/hw/init.rc
mkdir -p /data/overlay/empty/system/etc/init/hw
touch /data/overlay/empty/system/etc/init/hw/init.rc
if [ -f /system/etc/init/hw/init.rc ]; then
    mount --bind /data/overlay/empty/system/etc/init/hw/init.rc /system/etc/init/hw/init.rc
fi
EOF
chmod +x "$MAGISK_DIR/overlay_persist.sh"

# Finalizar
sleep 2
ui_print " • Persistência configurada com sucesso. "
sleep 0.5
ui_print ""
ui_print " • Aplicando script de bloqueio de bootloader. "
ui_print " • Feito!! "