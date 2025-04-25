ui_print " • Informações do módulo "
sleep 0.2
ui_print " • Nome            : Hide folders/files"
sleep 0.2
ui_print " • Desenvolvedor   : @NedTOP "
sleep 0.2
ui_print " • Canal           : @Papacu_GSIs_MODs "
sleep 0.2
ui_print ""
ui_print " • Iniciando o processo de ocultação..."

# Criar diretórios e arquivos falsos para ocultação
mkdir -p /data/overlay/empty/system/addon.d
mkdir -p /data/overlay/empty/vendor/bin

# Lista de arquivos a serem ocultados
FILES_LIST="
/system/addon.d
/system/vendor/bin/install-recovery.sh
"

# Ocultar arquivos com mount --bind
for FILE in $FILES_LIST; do
    EMPTY_FILE="/data/overlay/empty${FILE}"
    DIR_PATH=$(dirname "$EMPTY_FILE")
    mkdir -p "$DIR_PATH"
    touch "$EMPTY_FILE"
    if [ -e "$FILE" ]; then
        mount --bind "$EMPTY_FILE" "$FILE"
        ui_print " • Ocultado: $FILE"
    else
        ui_print " • Não encontrado: $FILE"
    fi
    sleep 0.2
    ui_print ""
done

# Configurar persistência
ui_print " • Configurando persistência... "
MAGISK_DIR="/data/adb/service.d"
mkdir -p "$MAGISK_DIR"
cat <<EOF >"$MAGISK_DIR/overlay_persist.sh"
#!/system/bin/sh

# Reaplicar montagens após reboot
FILES_LIST="
/system/addon.d
/system/vendor/bin/install-recovery.sh
"

for FILE in \$FILES_LIST; do
    EMPTY_FILE="/data/overlay/empty\${FILE}"
    DIR_PATH=\$(dirname "\$EMPTY_FILE")
    mkdir -p "\$DIR_PATH"
    touch "\$EMPTY_FILE"
    if [ -e "\$FILE" ]; then
        mount --bind "\$EMPTY_FILE" "\$FILE"
    fi
done
EOF
chmod +x "$MAGISK_DIR/overlay_persist.sh"

sleep 2
ui_print " • Persistência configurada com sucesso."
ui_print " • Aplicando script de bloqueio de bootloader. "
ui_print " • Feito!! "
