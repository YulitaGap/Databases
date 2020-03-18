CREATE DATABASE university;
-- \c university


CREATE TABLE student (
  sid integer NOT NULL UNIQUE,
  fname VARCHAR(45),
  lname VARCHAR(45),
  IQ INT,
  birth_date DATE,
  phone CHAR(13)
  -- One to many relation:
  -- , PRIMARY KEY (sid)
  );


CREATE TABLE university (
    uid INT NOT NULL UNIQUE,
    name VARCHAR(45),
    founded_in DATE,
    rating INT
  	-- One to many relation:
  	-- , PRIMARY KEY (uid)
);


CREATE TABLE migration (
    mid INT NOT NULL UNIQUE,
    who INT,
    from_ INT,
    to_ INT,
    when_ DATE,
    student_sid INT,
    univercity_cid INT
  	-- One to many relation:
    -- , FOREIGN KEY (student_sid) REFERENCES student(sid) ON DELETE CASCADE
    -- FOREIGN KEY (univercity_cid) REFERENCES university(uid) ON DELETE CASCADE
);


ALTER TABLE university ADD about  VARCHAR(1000);
ALTER TABLE student ADD gender BOOLEAN;

INSERT INTO university(uid,name,founded_in,rating, about) VALUES
	(7712, 'Carnegie Mellon', '1902-12-16', 65, 'CMU is a global research university known for its world-class, interdisciplinary programs'),
	(208, 'MIT', '1913-01-07', 5, 'The mission of MIT Technology Review is to bring about better-informed and more conscious decisions about technology'),
    (7683, 'Yale University', '1701-08-04', 4,'Since its founding in 1701, Yale University has been dedicated to expanding and sharing knowledge, inspiring innovation'),
    (6007, 'MIT', '1913-01-07', 5,'The mission of MIT Technology Review is to bring about better-informed and more conscious decisions about technology'),
    (7158, 'Johns Hopkins University', '1921-06-14', 37,'Americas first research university and home to nine world-class academic divisions working together as one university.'),
    (7834, 'University of Chicago', '1924-02-22', 9,'Private, nondenominational, culturally rich and ethnically diverse coeducational research university located in Hyde Park'),
    (748, 'Columbia University', '1935-05-01', 6,'Columbia University is a private Ivy League research university in New York City'),
    (6924, 'Princeton University', '1937-10-29', 3,'Princeton University is a private Ivy League research university in Princeton, New Jersey.'),
    (1237, 'Columbia University', '1935-05-01', 6,'Columbia University is a private Ivy League research university in New York City'),
    (4143, 'Carnegie Mellon', '1902-12-16', 65,'CMU is a global research university known for its world-class, interdisciplinary programs'),
    (5687, 'Cornell University', '1960-10-20', 12,'Cornell University is a private research university that provides an exceptional education for undergraduates and graduate and professional students.'),
    (1877, 'Yale University', '1701-08-04', 4,'Since its founding in 1701, Yale University has been dedicated to expanding and sharing knowledge, inspiring innovation'),
    (4079, 'Johns Hopkins University', '1921-06-14', 37,'Americas first research university and home to nine world-class academic divisions working together as one university.'),
    (5334, 'Princeton University', '1937-10-29', 3,'Princeton University is a private Ivy League research university in Princeton, New Jersey.'),
    (8923, 'Imperial College London', '1968-12-02', 112,'Imperial College London is a world-class university with a mission to benefit society through excellence in science, engineering, medicine and business.');
    

INSERT INTO student (sid, fname, lname, phone, iq, birth_date, gender ) VALUES 
		(2001, 'Alice', 'Anger', '7664315966409', 127, '1998-12-08',TRUE),
	   (3002, 'Andrew', 'Archer', '2856825253387', 130, '1999-01-19', FALSE),
	   (5003, 'Bob', 'Berne', '5084747328673', 131, '1999-03-05', FALSE),
	   (7004, 'Betty', 'Booper', '3301701890621', 129, '1999-05-07', TRUE),
	   (3405, 'Chris', 'Crown', '6949053278767', 107, '1999-05-11',FALSE),
	   (1006, 'Chloe', 'Couan', '4064390505915', 119, '2001-01-04', TRUE),
	   (2007, 'Den', 'Domer', '3904988002368', 150, '2001-08-02',FALSE),
	   (9008, 'Diana', 'Decker', '5466748283638', 143, '2001-06-26',TRUE),
	   (3009, 'Emily', 'Elephant', '8422599169895', 138, '2001-02-27',TRUE),
	   (6010, 'Evan', 'Enster', '4625061983025', 126, '2001-01-06',FALSE),
	   (7011, 'Fiona', 'Ferber', '3301518846709', 115, '2000-08-07',TRUE),
	   (8012, 'Fenster', 'Fooper', '1496622122147', 131, '2000-02-01', FALSE),
	   (9101, 'George', 'Gush', '3065804164832', 105,'2001-01-23',FALSE),
	   (5102, 'Greyson', 'Ginn', '6876360363665', 114, '2001-06-26',TRUE),
	   (4103, 'Hiram', 'Hoocker', '7199353194232', 123, '2001-02-26', FALSE);

INSERT INTO migration(mid, who, from_, to_, when_, student_sid, univercity_cid) VALUES
	(4433, 9645, 8586, 5979, '2018-12-16', 7011, 7712),
    (517, 8384, 8164, 4426, '2020-01-07', 2007, 208),
    (1793, 7851, 7048, 2134, '2019-08-04', 4103, 7683),
    (1891, 9566, 5224, 8689, '2020-01-25', 9101, 6007),
    (6079, 5972, 7697, 1815, '2019-06-14', 2001, 7158),
    (2162, 3467, 2429, 3551, '2019-02-22', 8012, 7834),
    (5482, 2984, 8012, 9602, '2018-05-01', 6010, 748),
    (9964, 2736, 2975, 5198, '2018-10-29', 7004, 6924),
    (7470, 5942, 7722, 5466, '2018-08-19', 5003, 1237),
    (1945, 7387, 6218, 3453, '2019-11-16', 9008, 4143),
    (7902, 6310, 3906, 6532, '2017-10-20', 3002, 5687),
    (3003, 2021, 5593, 6394, '2019-04-24', 3009, 1877),
    (6494, 7381, 6315, 4141, '2019-12-07', 1006, 4079),
    (4258, 3903, 2950, 1354, '2018-02-12', 5102, 5334),
    (5339, 3056, 9596, 3874, '2019-12-02', 3405, 8923);



UPDATE student SET phone = '1004315966409' WHERE lname = 'Anger';
UPDATE student SET phone = '1004988002368' WHERE lname = 'Domer';
UPDATE student SET phone = '1006622122147' WHERE lname = 'Enster';

SELECT * FROM student WHERE gender = TRUE;

SELECT * FROM student WHERE birth_date < '2002-02-25';

SELECT * FROM student ORDER BY fname, lname LIMIT 10;

DELETE FROM student;
DELETE FROM university;
DELETE FROM migration;
DROP TABLE student, migration, university;
DROP DATABASE university;