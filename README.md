# Тестовое задание 
-----
Вот скрипт на Bash для мониторинга процесса test(test.sh), а также юнит systemd для его автоматического запуска при загрузке системы.
Теперь создадим юнит systemd, чтобы скрипт запускался при старте системы.
Создаём файл /etc/systemd/system/test-monitor.service и добавляем  в него следующее
После этого выполните команды:
sudo systemctl daemon-reload
sudo systemctl enable test-monitor
sudo systemctl start test-monitor
Теперь скрипт будет запускаться при загрузке системы и выполняться каждую минуту. 

Вот скрипт на Bash для мониторинга процесса test(test.sh), а также юнит systemd для его автоматического запуска при загрузке системы.
Теперь создадим юнит systemd, чтобы скрипт запускался при старте системы.
Создаём файл /etc/systemd/system/test-monitor.service и добавляем  в него следующее
После этого выполните команды:
- sudo systemctl daemon-reload
- sudo systemctl enable test-monitor
- sudo systemctl start test-monitor

Теперь скрипт будет запускаться при загрузке системы и выполняться каждую минуту. 
