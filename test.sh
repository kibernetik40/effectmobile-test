#!/bin/bash

PROCESS_NAME="test"
LOG_FILE="/var/log/monitoring.log"
URL="https://test.com/monitoring/test/api"
PREV_PID_FILE="/tmp/test_process_monitor.pid"

while true; do
    # Получаем PID процесса
    CURRENT_PID=$(pgrep -x "$PROCESS_NAME")
    PREV_PID=$(cat "$PREV_PID_FILE" 2>/dev/null)
    
    if [[ -n "$CURRENT_PID" ]]; then
        if [[ "$CURRENT_PID" != "$PREV_PID" ]]; then
            echo "$(date) - Process $PROCESS_NAME restarted (PID: $CURRENT_PID)" >> "$LOG_FILE"
            echo "$CURRENT_PID" > "$PREV_PID_FILE"
        fi
        
        # Проверка доступности сервера мониторинга
        if curl -s --head --request GET "$URL" | grep "200 OK" > /dev/null; then
            curl -s -X POST "$URL" -d "{"status":"running"}" -H "Content-Type: application/json" >/dev/null
        else
            echo "$(date) - Monitoring server is unavailable" >> "$LOG_FILE"
        fi
    fi
    
    sleep 60
done
