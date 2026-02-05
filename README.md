# QA Portfolio — TaskFlow (Manual + API + SQL)

Репозиторий содержит моё QA-портфолио: тестовая документация, баг-репорты, API тестирование (Postman) и SQL проверки для web-продукта **TaskFlow** (task management service).

**Ссылка на репозиторий:** https://github.com/Taccola-it/qa-portfolio-taskflow

---

## 📌 Что внутри (быстрый навигатор)

### 1) Test Plan
- [`01_Test_Plan/TestPlan.md`](01_Test_Plan/TestPlan.md) — цель, scope, подход, риски, критерии входа/выхода

### 2) Test Cases
- [`02_Test_Cases/TestCases.md`](02_Test_Cases/TestCases.md) — 40 тест-кейсов на ключевые сценарии

### 3) Checklists
- [`03_Checklists/Smoke_Checklist.md`](03_Checklists/Smoke_Checklist.md) — smoke проверки
- [`03_Checklists/Regression_Checklist.md`](03_Checklists/Regression_Checklist.md) — regression проверки

### 4) Bug Reports
- [`04_Bug_Reports/`](04_Bug_Reports/) — 15 оформленных баг-репортов + шаблон

### 5) API Testing (Postman)
- [`05_API_Testing/API_Testing.md`](05_API_Testing/API_Testing.md) — описание проверок
- [`05_API_Testing/postman_collection.json`](05_API_Testing/postman_collection.json) — коллекция Postman (CRUD + negative)

### 6) SQL Checks
- [`06_SQL/README.md`](06_SQL/README.md) — описание
- [`06_SQL/schema.sql`](06_SQL/schema.sql) — схема БД (упрощённая)
- [`06_SQL/sql_checks.sql`](06_SQL/sql_checks.sql) — проверки целостности/дубликатов/валидности

---

## ✅ Покрытые сценарии

### Auth
- регистрация, логин/логаут
- проверка доступа без авторизации
- поведение при Back после logout

### Core Features
- доски/колонки/карточки: CRUD
- перемещение карточек между колонками
- валидации (пустые поля, длины)
- сохранение данных посл

### API
- GET / POST / PUT / DELETE
- статус-коды + автопроверки
- негативный сценарий 404

### SQL (data integrity)
- поиск дублей
- orphans (карточки без колонок и т.п.)
- валидация статусов/приоритетов

---

## 🧰 Инструменты
- Manual QA: test plan, test cases, checklists, bug reports
- Postman: API requests + автопроверки (Scripts → Post-res)
- SQL: типовые проверки данных