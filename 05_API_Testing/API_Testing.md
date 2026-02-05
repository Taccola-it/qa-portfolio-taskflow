# API Testing — TaskFlow (Postman)

В рамках портфолио выполнены проверки API CRUD операций в Postman.

## Проверки
- GET: статус 200 + структура ответа
- POST: статус 201 + наличие id + проверка полей
- PUT: статус 200 + проверка обновлённых значений
- DELETE: статус 200
- Negative: GET несуществующего ресурса → 404

## Инструменты
- Postman: Scripts → Post-res (автопроверки)

## API
Использован публичный учебный REST API:
https://jsonplaceholder.typicode.com/

## Файлы
- postman_collection.json — коллекция Postman v2.1
