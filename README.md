## University Course Management Application
The university student course registration system is unable to cope with the high volume manual process of recording, retrieving and updating each record at registration time. During peak transaction times for each new semester, registration lines are getting longer as well as each student’s waiting and processing time.


So an online student course registration system needs to be developed.


In the case of a university course registration process, students will be able to register their courses online. The available courses will be chosen by the students under a user authentication process. Registered courses should be listed under a specific semester for each student.


There should be search activity by Semester Name so that we can see the registered courses under that semester.

Admin can create a semester and mark the semester as the current semester.


Lastly Admin will update the each semester result and result will be published calculating the CGPA of each subject and result will be emailed to students.


Each student will be able to see their own result through his registered email id.


### Project Setup
- Clone the project:

        git clone git@github.com:TahirAhmad01/CourseManagementAplication-ROR.git
        cd CourseManagementAplication-ROR
        cp .env.sample .env

- Open .env file and fill up the required information. For running in localhost, you may fill up like this:

        DB_HOST='localhost'
        DB_NAME='course_management_test_db'
        DB_USER='root'
        DB_PASS='123456'
  where, `root` and `123456` is your MySQL username and password respectively.
    
- Install dependencies:

        bundle install
        yarn install
        rake db:create
        rake db:migrate
        rake db:seed
        
- Run the Rails server:

        rails s
