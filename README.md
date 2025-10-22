Welcome to your new dbt project!

### Using the starter project
Before starting, ensure you have the following installed:
  - Dbt core,Dbt PostGres
  - Python 3.8+
  - Git
  - PostgreSQL database (version 9.3 or higher)
  - Power BI Desktop (for downstream reporting)
  - A Python Virtual Environment (you are using dbt_venv)

All the Processes and connecting of DBT to PostGres are given in below link (For Reference)
  - https://youtu.be/ALuYdar1vCc?si=e_7x0rWIcV4iwwNP

💾 Database Setup (PostgreSQL)

To ensure this dbt project runs correctly, you must first create the necessary source tables using our provided schema dump.

### 1. Create the Database

Start by creating an empty database in your local PostgreSQL instance (e.g., named `dbt_source_db`).

    psql -U your_admin_user -c "CREATE DATABASE dbt_source_db;


### 2. Load the Schema

 Use the provided schema-only dump file to create the table structures.
      
       Update 'your_user' and 'dbt_source_db' as needed
    psql -U your_user -d dbt_source_db -f setup/schema_only.sql

### 3. Refrence to  My Postgres Database

  The below link provides you a overview of my database, What schemas I have used and how i have referenced my schemas to one another. 
* **Click to View/Download:** **[DBT_Cusproj.sql](PostGresFile/DBT_Cusproj.sql)**

### 4. PowerBi DashBoard
  
   This project integrates Between dbt,PostGres and Power BI. The repository houses the dbt models that structure the data as well as stored in Database and the final `.pbix` report, providing **dynamic visualization of [key metric, e.g., customer acquisition trends].**
   
This is Preview Images Describing the Reports
   
##1.
   <img width="1344" height="743" alt="Screenshot 2025-10-22 184417" src="https://github.com/user-attachments/assets/dcf9d295-f910-48ac-88fd-57dbc35941cb" />
  
 
##2.
   <img width="1324" height="732" alt="Screenshot 2025-10-22 184431" src="https://github.com/user-attachments/assets/62298c89-d34f-4671-85e9-8bc8e2a51ac9" />


   If you want the source file so here it is 
       **Click to View/Download:** **[DBT_CusProj.pbix](Power_Bi_DashBoard)**

      


   
AFTER INSTALLATION:-
Try running the following commands:
1. dbt init- To initilize the DBT.
2. dbt debug- After configuring profiles.yml,To test the connection of DBT.
3. dbt run- This command executes all .sql files in your models/ directory.
4. dbt test- This command executes all tests defined in your schema.yml files or any other .yml files.
5. dbt deps- It is necessary to download and install the packages defined in your packages.yml file
6. dbt snapshot- This command executes your snapshots to capture historical changes in your source data.




### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
