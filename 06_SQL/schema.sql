-- TaskFlow database schema (portfolio version)
-- Purpose: demonstrate QA SQL checks on typical entities.

CREATE TABLE users (
  id            INT PRIMARY KEY,
  email         VARCHAR(255) NOT NULL UNIQUE,
  created_at    TIMESTAMP NOT NULL
);

CREATE TABLE boards (
  id            INT PRIMARY KEY,
  owner_id      INT NOT NULL,
  title         VARCHAR(255) NOT NULL,
  created_at    TIMESTAMP NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE columns (
  id            INT PRIMARY KEY,
  board_id      INT NOT NULL,
  title         VARCHAR(255) NOT NULL,
  position      INT NOT NULL,
  created_at    TIMESTAMP NOT NULL,
  FOREIGN KEY (board_id) REFERENCES boards(id)
);

CREATE TABLE cards (
  id            INT PRIMARY KEY,
  column_id     INT NOT NULL,
  title         VARCHAR(255) NOT NULL,
  description   TEXT,
  status        VARCHAR(32) NOT NULL, -- e.g. "todo", "in_progress", "done"
  priority      INT NOT NULL,         -- 1..5
  assignee_id   INT NULL,
  created_at    TIMESTAMP NOT NULL,
  updated_at    TIMESTAMP NULL,
  FOREIGN KEY (column_id) REFERENCES columns(id),
  FOREIGN KEY (assignee_id) REFERENCES users(id)
);
