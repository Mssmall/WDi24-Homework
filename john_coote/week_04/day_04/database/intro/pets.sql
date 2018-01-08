CREATE TABLE pets (
  id INTEGER PRIMARY KEY,
  name TEXT,
  breed TEXT,
  age INTEGER,
  dead INTEGER -- dead = 1
);

-- seed data
INSERT INTO pets (id, name, breed, age, dead) VALUES (1, "Fluffy", "Unicorn", 1000, 0);
INSERT INTO pets VALUES (2, "Gigantor", "Robot", 1, 1);
