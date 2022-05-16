# Laundry-Booking-DB
Description:  
The SQL scripts to create the database for the laundry booking system application. The laundry database is created with PostgreSQL management system, which can be found under this [link](https://www.postgresql.org/). The recommended application(Graphical User Interface) to interact with the database is pgAdmin.  
Repository files information:  
laundrydb_schema.sql: Script to create the database only with the schema.  
  
Useful commands using the PostgresSQL CLI tools:  
Before using the commands, it is necessary to browse the path with the tools (pg_dump, psql).  
The Windows system: Browsing to the default path is "C:\Program Files\PostgreSQL\(Current Version installed)\bin"  
The Linux system: Switching to the Postgres user with the command "sudo -i -u postgres". The tools are ready to be used.  
  
Import a database  
psql -U username -d dbname -h host < Path/filename.sql  
  
Export the schema of a database  
pg_dump -W -F p --schema-only -U username -d dbname -h host > Path/filename.sql  
  
Export the whole database including data  
pg_dump -W -F p -U username -d dbname -h host > Path/filename.sql  
