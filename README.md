# 💾 Astra Backup

Скрипт для автоматического резервного копирования важных директорий в Astra Linux с ротацией (удалением старых бэкапов).

---

## 📦 Что делает

- Архивирует директории: `/etc`, `/home`, `/var/log`
- Сохраняет бэкапы в `/backup` с именем `backup-YYYY-MM-DD_HH-MM-SS.tar.gz`
- Хранит только последние 7 дней (настраивается)
- Ведёт лог в `/var/log/backup.log`
- Может быть запущен по расписанию через cron

---

## 🚀 Установка и настройка

```bash
git clone https://github.com/IlyaTrihkin/astra-backup.git
cd astra-backup
chmod +x backup.sh
