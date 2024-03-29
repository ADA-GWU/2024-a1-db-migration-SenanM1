-- Step 1: Recreate the original INTERESTS table
CREATE TABLE ORIGINAL_INTERESTS (
    STUDENT_ID INTEGER REFERENCES STUDENTS(STUDENT_ID),
    INTEREST VARCHAR(20)
);

-- Step 2: Unpack the interests array into the original format
INSERT INTO ORIGINAL_INTERESTS (STUDENT_ID, INTEREST)
SELECT STUDENT_ID, UNNEST(INTERESTS) 
FROM INTERESTS;

-- Step 3: Drop the migrated INTERESTS table and rename ORIGINAL_INTERESTS back to INTERESTS
DROP TABLE INTERESTS;
ALTER TABLE ORIGINAL_INTERESTS RENAME TO INTERESTS;

-- Step 4: Revert the changes to the STUDENTS table
ALTER TABLE STUDENTS RENAME COLUMN STUDENT_ID TO ST_ID;
ALTER TABLE STUDENTS ALTER COLUMN ST_NAME TYPE VARCHAR(20);
ALTER TABLE STUDENTS ALTER COLUMN ST_LAST TYPE VARCHAR(20);
