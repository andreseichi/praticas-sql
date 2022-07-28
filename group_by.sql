-- exercicio 1
SELECT COUNT(experiences."endDate") AS "currentExperiences"
FROM experiences;
--
-- exercicio 2
--
SELECT e."userId" AS id,
  COUNT(e."userId") AS educations
FROM educations e
GROUP BY e."userId";
--
-- exercicio 3
--
SELECT users.name AS writer,
  COUNT(testimonials.id) AS "testimonialCount"
FROM testimonials
  JOIN users ON users.id = testimonials."writerId"
WHERE testimonials."writerId" = 435
GROUP BY users.name;
--
-- exercicio 4
--
SELECT MAX(jobs.salary) AS "maximumSalary",
  roles.name AS role
FROM jobs
  JOIN roles ON jobs."roleId" = roles.id
WHERE jobs.active = true
GROUP BY roles.name
ORDER BY "maximumSalary" ASC;
--
-- bonus
--
SELECT schools.name AS school,
  courses.name AS course,
  count(educations."userId") AS "studentsCount",
  educations.status AS role
FROM educations
  JOIN schools ON schools.id = educations."schoolId"
  JOIN courses ON courses.id = educations."courseId"
WHERE educations.status = 'ongoing'
  OR educations.status = 'finished'
GROUP BY schools.name,
  courses.name,
  educations.status
ORDER BY "studentsCount" DESC
LIMIT 3;