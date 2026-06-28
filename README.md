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
```

---

## Запуск вручную

```bash
sudo ./backup.sh
```

---

## Настройка cron

```bash
crontab -e
# Добавить строку для ежедневного запуска в 2:00:
0 2 * * * /root/astra-backup/backup.sh
```

---

## ⚙️ Настройка

Переменные в начале скрипта:

| Переменная | Описание |
|----------|----------|
| `BACKUP_DIR` | Папка для хранения бэкапов |
| `SOURCE_DIRS` | Список директорий для архивации |
| `RETENTION_DAYS` | Сколько дней хранить бэкапы |
| `LOG_FILE` | Путь к лог-файлу |

---

## 👤 Автор

Илья Тришкин — специалист по информационной безопасности.

#### GitHub: 
https://github.com/IlyaTrihkin

#### TenChat: 
https://tenchat.ru/ilya_trishkin

#### Habr: 
https://habr.com/ru/users/ilya_trishkin

---

## 📄 Лицензия

Этот проект распространяется под лицензией MIT. Подробнее см. [LICENSE](LICENSE).
