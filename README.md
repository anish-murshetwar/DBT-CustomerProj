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
