/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

/*SELECT * FROM Contests
SELECT * FROM Colleges
SELECT * FROM Challenges
SELECT * FROM View_Stats
SELECT * FROM Submission_Stats

--contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id
845 579 Rose 2566 841 2447 869 
858 1053 Angela 1930 441 1464 511 
883 1055 Frank 2689 734 1794 593 



SELECT CT.contest_id, CT.hacker_id, CT.name, SUM(total_submissions), SUM(total_accepted_submissions), SUM(total_views), SUM(total_unique_views)
FROM
Contests CT (NOLOCK) INNER JOIN 
Colleges CL (NOLOCK) ON CT.contest_id = CL.contest_id INNER JOIN
Challenges CG (NOLOCK) ON CG.college_id = CL.college_id INNER JOIN 
Submission_Stats SS (NOLOCK) ON SS.challenge_id = CG.challenge_id INNER JOIN
View_Stats VS (NOLOCK) ON VS.challenge_id = CG.challenge_id
GROUP BY CT.contest_id, CT.hacker_id, CT.name
HAVING SUM(total_submissions)> 0 OR SUM(total_accepted_submissions)> 0 OR SUM(total_views)> 0 OR SUM(total_unique_views) > 0 
ORDER BY CT.contest_id*/


SELECT  CT.contest_id CID, CT.hacker_id HID, CT.name HName, SUM(SUM_Total_Subs),SUM(SUM_Total_acceptedSubs),SUM(SUM_Total_Views),SUM(SUM_Total_Unique_Views) FROM
Contests CT (NOLOCK) INNER JOIN 

(SELECT DISTINCT * FROM Colleges  (NOLOCK) )CL ON CT.contest_id = CL.contest_id INNER JOIN


Challenges CG (NOLOCK) ON CG.college_id = CL.college_id

LEFT OUTER JOIN 

(SELECT challenge_id, SUM(total_submissions) SUM_Total_Subs, SUM(total_accepted_submissions) SUM_Total_acceptedSubs FROM Submission_Stats GROUP BY challenge_id) 
SUBMISSIONSTATS ON SUBMISSIONSTATS.challenge_id = CG.challenge_id

LEFT OUTER JOIN

(SELECT challenge_id, SUM(total_views) SUM_Total_Views, SUM(total_unique_views) SUM_Total_Unique_Views FROM View_Stats
GROUP BY challenge_id) VIEWSTATS
ON CG.challenge_id = VIEWSTATS.challenge_id
GROUP BY CT.contest_id , CT.hacker_id , CT.name 
ORDER BY CID
