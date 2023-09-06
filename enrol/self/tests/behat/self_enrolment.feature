@enroll @enrol_self
Feature: Users can auto-enroll themself in courses where self enrollment is allowed
  In order to participate in courses
  As a user
  I need to auto enroll me in courses

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email |
      | teacher1 | Teacher | 1 | teacher1@example.com |
      | student1 | Student | 1 | student1@example.com |
    And the following "courses" exist:
      | fullname | shortname | format |
      | Course 1 | C1 | topics |
    And the following "course enrolments" exist:
      | user | course | role |
      | teacher1 | C1 | editingteacher |

  # Note: Please keep the javascript tag on this Scenario to ensure that we
  # test use of the singleselect functionality.
  @javascript
  Scenario: Self-enrollment enabled as guest
    Given I log in as "teacher1"
    And I add "Self enrollment" enrollment method in "Course 1" with:
      | Custom instance name | Test student enrollment |
    And I log out
    When I am on "Course 1" course homepage
    And I press "Access as a guest"
    Then I should see "Guests cannot access this course. Please log in."
    And I press "Continue"
    And I should see "Log in"

  Scenario: Self-enrollment enabled
    Given I log in as "teacher1"
    When I add "Self enrollment" enrollment method in "Course 1" with:
      | Custom instance name | Test student enrollment |
    And I log out
    And I log in as "student1"
    And I am on "Course 1" course homepage
    And I press "Enrol me"
    Then I should see "Topic 1"
    And I should not see "Enrolment options"

  Scenario: Self-enrollment enabled requiring an enrollment key
    Given I log in as "teacher1"
    When I add "Self enrollment" enrollment method in "Course 1" with:
      | Custom instance name | Test student enrollment |
      | Enrolment key | moodle_rules |
    And I log out
    And I log in as "student1"
    And I am on "Course 1" course homepage
    And I set the following fields to these values:
      | Enrolment key | moodle_rules |
    And I press "Enrol me"
    Then I should see "Topic 1"
    And I should not see "Enrolment options"
    And I should not see "Enrol me in this course"

  Scenario: Self-enrollment disabled
    Given I log in as "student1"
    When I am on "Course 1" course homepage
    Then I should see "You cannot enroll yourself in this course"

  Scenario: Self-enrollment enabled requiring a group enrollment key
    Given I log in as "teacher1"
    When I add "Self enrollment" enrollment method in "Course 1" with:
      | Custom instance name | Test student enrollment |
      | Enrolment key | moodle_rules |
      | Use group enrollment keys | Yes |
    And I am on the "Course 1" "groups" page
    And I press "Create group"
    And I set the following fields to these values:
      | Group name | Group 1 |
      | Enrolment key | Test-groupenrolkey1 |
    And I press "Save changes"
    And I log out
    And I log in as "student1"
    And I am on "Course 1" course homepage
    And I set the following fields to these values:
      | Enrolment key | Test-groupenrolkey1 |
    And I press "Enrol me"
    Then I should see "Topic 1"
    And I should not see "Enrolment options"
    And I should not see "Enrol me in this course"

  @javascript
  Scenario: Edit a self-enrolled user's enrollment from the course participants page
    Given I log in as "teacher1"
    When I add "Self enrollment" enrollment method in "Course 1" with:
      | Custom instance name | Test student enrollment |
    And I log out
    And I log in as "student1"
    And I am on "Course 1" course homepage
    And I press "Enrol me"
    And I should see "You are enrolled in the course"
    And I log out
    And I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I navigate to course participants
    When I click on "//a[@data-action='editenrollment']" "xpath_element" in the "student1" "table_row"
    And I should see "Edit Student 1's enrollment"
    And I set the field "Status" to "Suspended"
    And I click on "Save changes" "button"
    Then I should see "Suspended" in the "student1" "table_row"

  @javascript
  Scenario: Unenroll a self-enrolled student from the course participants page
    Given I log in as "teacher1"
    When I add "Self enrollment" enrollment method in "Course 1" with:
      | Custom instance name | Test student enrollment |
    And I log out
    And I log in as "student1"
    And I am on "Course 1" course homepage
    And I press "Enrol me"
    And I should see "You are enrolled in the course"
    And I log out
    And I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I navigate to course participants
    When I click on "//a[@data-action='unenroll']" "xpath_element" in the "student1" "table_row"
    And I click on "Unenroll" "button" in the "Unenroll" "dialogue"
    Then I should not see "Student 1" in the "participants" "table"

  @javascript
  Scenario: Self unenroll as a self-enrolled student from the course
    Given the "multilang" filter is "on"
    And the "multilang" filter applies to "content and headings"
    And I am on the "C1" "Course" page logged in as "teacher1"
    When I add "Self enrollment" enrollment method in "Course 1" with:
      | Custom instance name | Test student enrollment |
    And I am on "Course 1" course homepage
    And I navigate to "Settings" in current page administration
    And I set the field "Course full name" in the "General" "fieldset" to "<span lang=\"en\" class=\"multilang\">Course</span><span lang=\"it\" class=\"multilang\">Corso</span> 1"
    And I press "Save and display"
    And I log out
    And I am on the "C1" "Course" page logged in as "student1"
    And I press "Enrol me"
    And I should see "You are enrolled in the course"
    And I am on the "C1" "course" page
    And I navigate to "Unenroll me from this course" in current page administration
    And I click on "Continue" "button" in the "Confirm" "dialogue"
    Then I should see "You are unenrolled from the course \"Course 1\""

  @javascript
  Scenario: Self-enrollment enabled with simultaneous guest access
    Given I log in as "teacher1"
    And I am on the "Course 1" "enrollment methods" page
    And I click on "Enable" "link" in the "Self enrollment (Student)" "table_row"
    And I click on "Edit" "link" in the "Guest access" "table_row"
    And I set the following fields to these values:
      | Allow guest access | Yes |
    And I press "Save changes"
    And I log out
    And I log in as "student1"
    And I am on "Course 1" course homepage
    And I navigate to "Enrol me in this course" in current page administration
    And I click on "Enrol me" "button"
    Then I should see "Topic 1"
