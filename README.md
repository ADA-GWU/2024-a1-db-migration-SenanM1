<h1>Database Migration and Rollback README</h1>

<h2>Overview</h2>
<p>This document outlines the steps required to execute a database schema migration and subsequent rollback for a PostgreSQL database. The migration involves renaming columns, extending column lengths, and changing a column to an array type. The rollback process reverts all changes to the original state.</p>

<h2>Requirements</h2>
<li>PostgreSQL Database with version 9.1 or higher.</li>
<li>Appropriate database credentials with privileges to modify the database schema.</li>
<li>Access to a PostgreSQL command-line tool or a GUI-based tool like pgAdmin.</li>

<h2>Migration Process</h2>

<p>The Migration-Script.sql script performs the following operations:</p>
<ol>
  <li>Renames the ST_ID column to STUDENT_ID in the STUDENTS table.</li>
  <li>Changes the length of ST_NAME and ST_LAST columns from VARCHAR(20) to VARCHAR(30).</li>
  <li>Transforms INTEREST column in the INTERESTS table to an array of strings and populates it with the existing interests.</li>
</ol>

<h2>Steps to Perform Migration</h2>
<ol>
  <li>Backup your database. This is a critical step before performing any migration.</li>
  <li>Open your PostgreSQL command-line tool or GUI and connect to your database using your credentials.</li>
  <li>Run the Migration-Script.sql script by either opening it in the GUI and executing it or by using the command-line tool with the following command:</li>
  <p> 
    
  ```console
psql -U username -d databasename -a -f Migration-Script.sql
```
Replace username with your PostgreSQL username and databasename with the name of your database.
  </p>
  <li>Verify the changes by running select queries on the STUDENTS and INTERESTS tables to ensure the migration is successful.</li>
</ol>

<h2>Rollback Process</h2>
<p>If you need to revert the migration, the rollback.sql script will restore the original database schema.</p>

<h3>Steps to Perform Rollback</h3>
<ol>
  <li>Open your PostgreSQL command-line tool or GUI and connect to your database.</li>
  <li>Run the rollback.sql script similarly to the migration script:</li>
  <p>

```console
psql -U username -d databasename -a -f Rollback-Script.sql
```
    
  </p>
  <li>Confirm that the original schema is restored by executing select queries on the affected tables.</li>
</ol>
