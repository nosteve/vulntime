To curl most recent known_exploitable_vulnerabilities.csv run ./kev.sh

Create SQLite database by running sqlite3 mydb.db

In database, run the following commands:
  1: .mode csv
  2: .headers on
  3: .import known_exploitable_vulnerabilities.csv kev
  4: .import [NESSUS_SCAN].csv client
  5: .import category.csv category
  6: .read report_nessus.sql

datasette serve mydb.db
