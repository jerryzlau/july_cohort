CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(20),
  lname VARCHAR(20)
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(50),
  body TEXT,
  user_id INTEGER,
  FOREIGN KEY(user_id) REFERENCES users (id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (question_id) REFERENCES questions (id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  parent_reply_id INTEGER DEFAULT NULL,
  question_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions (id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);
