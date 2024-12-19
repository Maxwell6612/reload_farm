# reload_farm

Файлу необходимо добавить права на исполнение
`chmod +x internet_check.sh`

Желателельно добавить команду reboot для текущего пользователя в доступ без запроса пароля
`echo "$(whoami) ALL=NOPASSWD: /sbin/reboot" | sudo EDITOR='tee -a' visudo`

Для добавления задания в cron одной командой воспользоваться следующей конструкцией
`(crontab -l ; echo "*/30 * * * * /path/to/internet_check.sh") | crontab -`

### Разбор команды:
1. (crontab -l ; echo "...") — выводит текущий список заданий из crontab и добавляет новую строку с заданием.
2. "*/30 * * * * /path/to/internet_check.sh" — новая запись в crontab. Она означает выполнение скрипта каждые 30 минут.
3. | crontab - — перенаправляет результат вывода в crontab, обновляя расписание задач.

Убедитесь, что заменили /path/to/internet_check.sh на правильный путь к вашему скрипту.

После выполнения этой команды задание будет добавлено в crontab, и скрипт начнет выполняться каждые 30 минут.
