select student_progress.student_id, student_progress.total_percent_correct, student_questions.question_id  from student_progress inner join student_questions on student_progress.student_id = student_questions.student_id;

UPDATE student_questions set response = "correct" where student_id = 1 AND question_id = 1;

select student_progress.student_id, student_questions.response, student_questions.question_id  from student_progress
inner join student_questions on student_progress.student_id = student_questions.student_id;


SELECT COUNT(RESPONSE) FROM STUDENT_QUESTIONS WHERE response = "correct";
select count(*) from student_questions;


UPDATE STUDENT_PROGRESS SET CORRECT_ANSWERS = 0, INCORRECT_ANSWERS = 0, TOTAL_ANSWERS = 10, TOTAL_PERCENT_CORRECT = 0, CURRENT
_QUESTION = 1 WHERE STUDENT_ID = 1;


-- trigger

DROP TRIGGER IF EXISTS studentCountDecrement;
delimiter //
CREATE TRIGGER studentCountDecrement BEFORE DELETE ON student_profile
  FOR EACH ROW
  BEGIN
    ALTER TABLE student_profile AUTO_INCREMENT =-1;
  END;
//
delimiter ;


select * from question inner join question_set where question_set.question_set_id = question.question_set_id;
