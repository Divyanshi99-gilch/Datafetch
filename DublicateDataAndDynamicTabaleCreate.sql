-------------------Dublicate Data Search 
SELECT 
    
      Column1
      ,Column2
      ,Column3
  ,count(*) con
      
 FROM tableName group by 

     Column1
      ,Column2
      ,Column3
      
       Having 
	   count(*)>1

	   -----------------------------------Data Dublicate remove
	    SELECT * FROM [tbl_Copy_Uplodeing]

;WITH CTE AS(
   SELECT  [PaperName]
      ,[RollNo]
      ,[RegNum],
       RN = ROW_NUMBER()OVER(PARTITION BY  [CenterName],
       [PaperName]
      ,[RollNo]
      ,[RegNum] ORDER BY RollNo)
   FROM [tbl_Copy_Uplodeing]
)
DELETE FROM CTE WHERE RN > 1

--------------------------------------------Dynamic tabel 
 SELECT EmpName, [Monday],[Tuesday],[Wednesday],[Thursday],[Friday],[Saturday],[Sunday ] FROM   
(SELECT EmpName,ProgramDate, DATENAME(weekday, ProgramDate) as [Day]  
FROM [Assignment_System].[dbo].[Job_Allotement] )Tab1  
PIVOT  
(  
MAX(ProgramDate) FOR [Day] IN ([Monday],[Tuesday],[Wednesday],[Thursday],[Friday],[Saturday],[Sunday ])) AS Tab2  
ORDER BY Tab2.EmpName 

-----------------------------------------------Dynamic table year wise
 SELECT Name, [2010],[2011],[2012] FROM   
(SELECT Name, [Year] , Sales FROM Employee )Tab1  
PIVOT  
(  
SUM(Sales) FOR [Year] IN ([2010],[2011],[2012])) AS Tab2  
ORDER BY Tab2.Name  