#!/bin/bash

# Функция для проверки наличия доступа к интернету
check_internet() {
    # Пробуем пинговать Google DNS сервер
    ping -c 1 8.8.8.8 &> /dev/null
    
    if [ $? -ne 0 ]; then
        echo "Нет доступа к интернету."
        return 1
    else
        echo "Доступ к интернету есть."
        return 0
    fi
}

# Проверяем наличие интернета
if ! check_internet; then
    echo "Перезагружаю систему..."
    reboot
else
    echo "Интернет доступен, ничего не делаем."
fi
