SELECT 
    `director`.`dirname` as 'Фамилия директора', `director`.`facult` as "Институт"
FROM
    `director`
WHERE
    `director`.`facult` = 'ИИГСО';
    
SELECT 
    `director`.`dirname` as 'Фамилия директора', `director`.`facult` as "Институт", `employee`.`employeename` as 'Фамилия преподавателя'
FROM
    `director`, `employee`
WHERE
    `employee`.`director_#dtable1` = `director`.`#dtable1` AND `director`.`facult` = 'ИФМИТО';
    
