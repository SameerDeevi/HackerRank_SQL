/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.


;WITH CTE (Submission_date, Hacker_id, name, CT_SUBS, RNK)AS
(
    
    SELECT Submission_date, Hacker_id, name, CT_SUBS,  DENSE_RANK() OVER ( PARTITION BY Submission_date ORDER BY Hacker_ID ASC, CT_SUBS DESC ) AS RNK
    FROM (
    SELECT Submission_date, HCK.Hacker_id, name, SUM(Submission_ID) CT_SUBS

    FROM Submissions SUB INNER JOIN  Hackers HCK ON HCK.Hacker_id = SUB.Hacker_id
    GROUP BY Submission_date, HCK.Hacker_id, name
    )S
)
SELECT CTE.Submission_date,UNIQ_HCK_ID,Hacker_id, name  FROM CTE
INNER JOIN

SELECT 
SUB.Submission_date, COUNT(DISTINCT SUB.Hacker_id) UNIQ_HCK_ID
*
FROM Submissions SUB 
AND NOT EXISTS (SELECT 1 Submissions SUB1 ON SUB1.Hacker_id = SUB.Hacker_id and SUB1.Submission_date <> SUB.Submission_date 
--GROUP BY SUB.Submission_date*/



    /* SELECT *
FROM (SELECT DISTINCT Submission_date, HACKER_ID FROM Submissions) SUB1 LEFT OUTER JOIN SUBMISSIONS  SUB ON SUB1.Hacker_id = SUB.Hacker_id and SUB.Submission_date <= SUB1.Submission_date AND DATEDIFF(DD, SUB1.Submission_date,SUB.Submission_date ) = 1
WHERE SUB1.HACKER_ID = 53342
ORDER BY SUB1.Submission_date */

--SELECT * FROM Submissions WHERE 

--SELECT Submission_date,


;with CTE (Submission_Date,Hacker_ID ,name,RNK)
    AS
    (
        SELECT Submission_Date, Hacker_ID, name, 
        ROW_NUMBER() OVER (PARTITION BY Submission_Date ORDER BY CT DESC,Hacker_ID ASC  ) RNK
        FROM
        (
        SELECT S2.Submission_Date, HCK.Hacker_ID, HCK.name,  COUNT(DISTINCT Submission_Id) CT
              
        FROM 
        Submissions s2 INNER JOIN
            Hackers HCK ON HCK.Hacker_id = s2.Hacker_id 
        GROUP BY S2.Submission_Date, HCK.Hacker_ID, HCK.name
         )Stp
    )
    SELECT Submission_Date,Hacker_ID ,name,RNK INTO #tblM_Hcks FROM CTE HCKS WHERE RNK = 1


 SELECT Subs.Submission_Date, UNQ_HCK, Hcks.Hacker_ID, Hcks.name
 FROM 
 

#tblM_Hcks Hcks
 
    
    INNER JOIN
    
     (SELECT S2.Submission_Date,COUNT(DISTINCT Hacker_ID) UNQ_HCK FROM 
 Submissions s2 INNER JOIN
(select distinct submission_date from submissions) s1 ON 
s2.submission_date = s1.submission_date AND    
((SELECT COUNT(distinct s3.submission_date) FROM      Submissions s3 WHERE s3.hacker_id = s2.hacker_id AND s3.submission_date < s1.submission_date) = dateDIFF(DD,  '2016-03-01',s1.submission_date ))
GROUP BY  S2.Submission_Date) Subs
    --ORDER BY COUNT(Distinct Submission) DESC, HCK.hacker_id ASC limit 1;


ON Subs.Submission_Date = Hcks.Submission_Date




