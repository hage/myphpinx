DROP TABLE IF EXISTS test_table;
CREATE TABLE IF NOT EXISTS test_table {
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(20) NOT NULL,
       created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
       updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
} DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO test_table SET name='your name';
