USE QuanLySinhVien;

SELECT *
FROM Subject
WHERE Credit = (
    SELECT MAX(Credit)
    FROM Subject
);

SELECT S.*, M.Mark
FROM Subject S
JOIN Mark M ON S.SubID = M.SubID
WHERE M.Mark = (
    SELECT MAX(Mark)
    FROM Mark
);

SELECT 
    S.StudentID,
    S.StudentName,
    ROUND(AVG(M.Mark), 2) AS DiemTrungBinh
FROM Student S
LEFT JOIN Mark M ON S.StudentID = M.StudentID
GROUP BY S.StudentID, S.StudentName
ORDER BY DiemTrungBinh DESC;