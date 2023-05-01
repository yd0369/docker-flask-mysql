CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

INSERT INTO items (name, description) VALUES
    ('Item 1', 'This is the first item.'),
    ('Item 2', 'This is the second item.'),
    ('Item 3', 'This is the third item.');
