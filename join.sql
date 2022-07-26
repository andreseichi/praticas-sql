-- exercicio 1
SELECT users.id,
  users.name,
  cities.name AS city
FROM users
  JOIN cities ON users."cityId" = cities.id
WHERE cities.name = 'Rio de Janeiro'
ORDER BY users.id ASC;
--
-- exercicio 2
--
SELECT testimonials.id,
  u1.name AS writer,
  u2.name AS recipient,
  testimonials.message
FROM testimonials
  JOIN users u1 ON u1.id = testimonials."writerId"
  JOIN users u2 ON u2.id = testimonials."recipientId"
ORDER BY testimonials.id ASC;
--
-- exercicio 3
--
SELECT users.id,
  users.name,
  courses.name as course,
  schools.name as school,
  educations."endDate"
FROM educations
  JOIN schools ON schools.id = educations."schoolId"
  JOIN courses ON courses.id = educations."courseId"
  JOIN users ON educations."userId" = users.id
WHERE users.id = 30
  AND educations.status = 'finished'
ORDER BY users.id ASC;
--
-- exercicio 4
--
SELECT users.id,
  users.name,
  roles.name AS role,
  companies.name AS company,
  experiences."startDate"
FROM users
  JOIN experiences ON users.id = experiences."userId"
  JOIN companies ON experiences."companyId" = companies.id
  JOIN roles ON experiences."roleId" = roles.id
WHERE users.id = 50
  AND experiences."endDate" IS NULL
ORDER BY users.id ASC;
--
-- bonus
--
SELECT DISTINCT ON (schools.name) schools.id,
  schools.name AS school,
  courses.name AS course,
  companies.name AS company,
  roles.name AS role
FROM users
  JOIN applicants ON users.id = applicants."userId"
  JOIN jobs ON applicants."jobId" = jobs.id
  JOIN companies ON jobs."companyId" = companies.id
  JOIN roles ON jobs."roleId" = roles.id
  JOIN educations ON users.id = educations."userId"
  JOIN schools ON educations."schoolId" = schools.id
  JOIN courses ON educations."courseId" = courses.id
WHERE companies.id = 10
  AND roles.name = 'Software Engineer'
  AND jobs.active = true