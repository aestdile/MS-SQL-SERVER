
-- Xodimlarning to�liq ro�yxatini chiqarish
SELECT * FROM EMPLOYEES;

-- Fakultetlarning to�liq ro�yxatini chiqarish
SELECT * FROM FACULTIES;

-- Kafedralarning to�liq ro�yxatini chiqarish
SELECT * FROM CAFEDRAS;

-- Lavozimlar ro�yxatini chiqarish
SELECT * FROM POSITIONS;

-- Xodimlar va ularning lavozimlari haqida ma�lumot chiqarish
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, p.POSITION_NAME, p.SALARY
FROM EMPLOYEES e
JOIN POSITIONS p ON e.POSITION_ID = p.POSITION_ID;

-- Xodimlar, ularning lavozimlari va kafedralari haqida ma�lumot chiqarish
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, p.POSITION_NAME, c.CAFEDRA_NAME, f.FACULTY_NAME
FROM EMPLOYEES e
JOIN POSITIONS p ON e.POSITION_ID = p.POSITION_ID
JOIN CAFEDRAS c ON e.CAFEDRA_ID = c.CAFEDRA_ID
JOIN FACULTIES f ON c.FACULTY_ID = f.FACULTY_ID;

-- Har bir fakultetda nechta kafedra borligini chiqarish
SELECT f.FACULTY_NAME, COUNT(c.CAFEDRA_ID) AS CAFE_COUNT
FROM FACULTIES f
LEFT JOIN CAFEDRAS c ON f.FACULTY_ID = c.FACULTY_ID
GROUP BY f.FACULTY_NAME;

-- Har bir kafedrada nechta xodim borligini chiqarish
SELECT c.CAFEDRA_NAME, COUNT(e.EMPLOYEE_ID) AS EMP_COUNT
FROM CAFEDRAS c
LEFT JOIN EMPLOYEES e ON c.CAFEDRA_ID = e.CAFEDRA_ID
GROUP BY c.CAFEDRA_NAME;

-- Har bir lavozim bo�yicha xodimlar sonini chiqarish
SELECT p.POSITION_NAME, COUNT(e.EMPLOYEE_ID) AS EMP_COUNT
FROM POSITIONS p
LEFT JOIN EMPLOYEES e ON p.POSITION_ID = e.POSITION_ID
GROUP BY p.POSITION_NAME;

-- Eng ko�p maosh oladigan xodimlarni chiqarish
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, p.POSITION_NAME, p.SALARY
FROM EMPLOYEES e
JOIN POSITIONS p ON e.POSITION_ID = p.POSITION_ID
ORDER BY p.SALARY DESC;

-- Xodimlarning vazifalari ro�yxatini chiqarish
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, m.MISSION_NAME, m.MISSION_DESCRIPTION, m.PRIORITY
FROM EMPLOYEES e
JOIN MISSIONS m ON e.EMPLOYEE_ID = m.EMPLOYEE_ID;

-- Muayyan kafedrada ishlovchi xodimlarni chiqarish (masalan, "SOFTWARE ENGINEERING")
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, p.POSITION_NAME
FROM EMPLOYEES e
JOIN POSITIONS p ON e.POSITION_ID = p.POSITION_ID
JOIN CAFEDRAS c ON e.CAFEDRA_ID = c.CAFEDRA_ID
WHERE c.CAFEDRA_NAME = 'SOFTWARE ENGINEERING';

-- Fakultetga tegishli barcha xodimlarni chiqarish (masalan, "ELECTRONICS AND AUTOMATICS")
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, p.POSITION_NAME, c.CAFEDRA_NAME
FROM EMPLOYEES e
JOIN POSITIONS p ON e.POSITION_ID = p.POSITION_ID
JOIN CAFEDRAS c ON e.CAFEDRA_ID = c.CAFEDRA_ID
JOIN FACULTIES f ON c.FACULTY_ID = f.FACULTY_ID
WHERE f.FACULTY_NAME = 'ELECTRONICS AND AUTOMATICS';

-- Tajribasi 10 yildan oshgan xodimlarni chiqarish
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EXPERIENCE
FROM EMPLOYEES
WHERE EXPERIENCE > 10;

-- Tug�ilgan yili 1980-yillarga to�g�ri keladigan xodimlarni chiqarish
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, BIRTH_DATE
FROM EMPLOYEES
WHERE BIRTH_DATE BETWEEN '1980-01-01' AND '1989-12-31';

-- Kelajakdagi yuqori ustuvorlikdagi vazifalarni chiqarish
SELECT MISSION_NAME, MISSION_DESCRIPTION, PRIORITY, MISSION_DATE
FROM MISSIONS
WHERE PRIORITY = 'HIGH' AND MISSION_DATE > CAST(GETDATE() AS DATE);;

-- Xodimlarning email manzillarini chiqarish
SELECT FIRST_NAME, LAST_NAME, EMAIL FROM EMPLOYEES WHERE EMAIL IS NOT NULL;



















