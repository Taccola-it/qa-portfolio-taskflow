-- QA SQL checks for TaskFlow (portfolio version)
-- Goal: validate data integrity, duplicates, constraints, and common product bugs.

-- 1) Find duplicate users by email (should be 0 rows)
SELECT email, COUNT(*) AS cnt
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

-- 2) Boards with empty / whitespace titles (should be 0 rows)
SELECT id, title
FROM boards
WHERE TRIM(title) = '';

-- 3) Columns with duplicate position inside the same board (should be 0 rows)
SELECT board_id, position, COUNT(*) AS cnt
FROM columns
GROUP BY board_id, position
HAVING COUNT(*) > 1;

-- 4) Cards with empty titles (should be 0 rows)
SELECT id, title
FROM cards
WHERE TRIM(title) = '';

-- 5) Cards with invalid priority (should be 0 rows, expected 1..5)
SELECT id, priority
FROM cards
WHERE priority < 1 OR priority > 5;

-- 6) Cards with invalid status (should be 0 rows)
-- Allowed statuses: todo, in_progress, done
SELECT id, status
FROM cards
WHERE status NOT IN ('todo', 'in_progress', 'done');

-- 7) Orphan cards (column_id doesn't exist) — should be 0 rows
SELECT c.id, c.column_id
FROM cards c
LEFT JOIN columns col ON col.id = c.column_id
WHERE col.id IS NULL;

-- 8) Cards assigned to non-existing users — should be 0 rows
SELECT c.id, c.assignee_id
FROM cards c
LEFT JOIN users u ON u.id = c.assignee_id
WHERE c.assignee_id IS NOT NULL AND u.id IS NULL;

-- 9) Boards without an owner (should be 0 rows)
SELECT b.id, b.owner_id
FROM boards b
LEFT JOIN users u ON u.id = b.owner_id
WHERE u.id IS NULL;

-- 10) Potential "lost update" issue:
-- Cards updated earlier than created (should be 0 rows)
SELECT id, created_at, updated_at
FROM cards
WHERE updated_at IS NOT NULL AND updated_at < created_at;

-- 11) Count cards per status per board (report-style query)
SELECT b.id AS board_id, c.status, COUNT(*) AS cards_count
FROM boards b
JOIN columns col ON col.board_id = b.id
JOIN cards c ON c.column_id = col.id
GROUP BY b.id, c.status
ORDER BY b.id, c.status;

-- 12) Find columns with too many cards (example threshold > 200) - for UI/performance checks
SELECT col.id AS column_id, COUNT(*) AS cards_count
FROM columns col
JOIN cards c ON c.column_id = col.id
GROUP BY col.id
HAVING COUNT(*) > 200;
