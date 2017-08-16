-- INSERT INTO users ('fname', 'lname')
-- VALUES ('Jerry', 'Lau');
--
-- INSERT INTO users ('fname', 'lname')
-- VALUES ('Nate', 'Festinger');
--
-- INSERT INTO users ('fname', 'lname')
-- VALUES ('Kush', 'Patel');
--
-- INSERT INTO questions ('title', 'body', 'user_id')
-- VALUES ('Food?', 'What''s the yummiest food?', 1);
--
-- INSERT INTO questions ('title', 'body', 'user_id')
-- VALUES ('Weather', 'What''s up with the crappy weather?', 2);
--
-- INSERT INTO questions ('title', 'body', 'user_id')
-- VALUES ('Tuition', 'Is 28K enough?', 3);
--
-- INSERT INTO questions ('title', 'body', 'user_id')
-- VALUES ('Tuition', 'How does doing percentage make it an unfair market?', 1);

-- INSERT INTO replies ('user_id', 'question_id')
-- VALUES (1, 3);
--
-- INSERT INTO replies ('user_id', 'question_id', 'parent_reply_id')
-- VALUES (2, 3, 1);
--
-- INSERT INTO replies ('user_id', 'question_id', 'parent_reply_id')
-- VALUES (1, 3, 2);

INSERT INTO question_follows ('user_id', 'question_id')
VALUES (1, 3);

INSERT INTO question_follows ('user_id', 'question_id')
VALUES (2, 3);

INSERT INTO question_follows ('user_id', 'question_id')
VALUES (3, 1);
