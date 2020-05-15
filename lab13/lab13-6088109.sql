-- Thanakorn Pasangthien 6088109 Section 1

CREATE TRIGGER addLogINS 
ON person
AFTER INSERT
AS
BEGIN
	DECLARE @logid int;
    SET @logid = (SELECT COALESCE(MAX(LogID), 0) + 1 FROM LogFileAudit)
	
	INSERT INTO LogFileAudit (LogID,Action,TableName) VALUES (@logid,'INSERT','person')
END

CREATE TRIGGER addLogDEL 
ON project
AFTER DELETE
AS
BEGIN
	DECLARE @logid int;
    SET @logid = (SELECT COALESCE(MAX(LogID), 0) + 1 FROM LogFileAudit)
    
    INSERT INTO LogFileAudit (LogID,Action,TableName) VALUES (@logid,'DELETE','project')
END



-- INSERT INTO person (pid, full_name, budget, proj_id) VALUES ('011','Ming Ming', 20000, 1)

-- DELETE FROM project WHERE proj_id = '5';