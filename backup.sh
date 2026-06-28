#!/bin/bash
# ============================================
# Astra Backup with Rotation
# Ежедневное резервное копирование с ротацией
# ============================================

set -e

# --- Конфигурация ---
BACKUP_DIR="/backup"
SOURCE_DIRS=("/etc" "/home" "/var/log")
RETENTION_DAYS=7
LOG_FILE="/var/log/backup.log"
DATE=$(date "+%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup-$DATE.tar.gz"

# --- Функция логирования ---
log() {
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] $1" | tee -a $LOG_FILE
}

# --- Создание папки для бэкапов ---
mkdir -p $BACKUP_DIR

# --- Архивация ---
log "Начинаю резервное копирование..."
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "${SOURCE_DIRS[@]}" 2>> $LOG_FILE
if [ $? -eq 0 ]; then
    log "Бэкап создан: $BACKUP_DIR/$BACKUP_NAME"
else
    log "ОШИБКА при создании бэкапа!"
    exit 1
fi

# --- Ротация (удаление старых бэкапов) ---
log "Удаляю бэкапы старше $RETENTION_DAYS дней..."
find $BACKUP_DIR -name "backup-*.tar.gz" -mtime +$RETENTION_DAYS -delete -print | while read file; do
    log "Удалён: $file"
done

log "Резервное копирование завершено."
