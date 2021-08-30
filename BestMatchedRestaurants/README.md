Introduction
--------------
This is my java solution for the "Best matched restaurants" take home assessment. It communicates
with a MySQL server that needs to be running locally. I had a lot of fun writing this
project and am excited to hear any feedback.


How to run
-----------

Setting up MySQL
---------------
The first thing that must be done in order to run this project is to have a
MySQL server running in the background of the local machine where the project will
be tested. This server must have the schema and tables imported from the dump file I included in the 
"SQL Dump to Import" folder. This dump has a RESTAURANTS and a CUISINES table. These tables perfectly mirror the included
CSVs from the original problem on GitHub. I simply used MySQL Workbench's "Table data import wizard" after right clicking on the "bestmatchedrestaurantschema" database I created.
Alternatively, you can just import the original csvs into a new database like I did.
The program will attempt to connect to the following url to access the database:
"jdbc:mysql://localhost:3306/bestmatchedrestuarantsschema?" +
"user=root&password=password"
Eg. database name = bestmatchedrestuarantsschema
    host = localhost
    port = 3306
    user = root
    password = password


Running BestMatchedRestaurants program
--------------------------------------
I created this program in IntelliJ IDEA but If you use Eclipse, it'll be basically the same.
I included the necessary MySQL-connector JAR that the program utilizes to interface with the db. If this
project was imported into IntelliJ IDEA, nothing else needs to be done with the JAR, however,
if a new project was created in, say, Eclipse OR if running via a terminal, it is necessary to add
that JAR file to the classpath (https://wiki.eclipse.org/FAQ_How_do_I_add_an_extra_library_to_my_project%27s_classpath%3F for Eclipse)
(https://www.jetbrains.com/help/idea/working-with-module-dependencies.html for IntelliJ). Make sure to have this
JAR in the classpath of your environment or else the program will not be able to connect to the database.

Now there are two ways to run it:
1. Via IDE:
   1. Right click the main function in src/BestMatchedResults.java
   2. In IntelliJ, click on "Modify run configuration"
   3. In the "Program arguments" field, enter 1 to 5 of the user parameters as defined in the original problem
      1. if no parameters are passed to the program, it will error out
   4. Arguments need to be formatted like the following: name=deli price=30 rating=2 distance=30 cuisine=chi
      1. The parameter key needs to be all lower cased and spelt correctly
      2. The name and cuisine values are case insensitive so can have uppercase and/or lowercase letters
   5. Save the run configuration and run the main function
2. Via terminal
   1. In the src directory of the project run "javac BestMatchedRestaurants.java Restaurant.java"
   2. Then run the program like "java BestMatchedRestaurants name=deli price=30 rating=2 distance=30 cuisine=chi"
   3. Again, make sure the MySql driver is added to your machine's classpath
