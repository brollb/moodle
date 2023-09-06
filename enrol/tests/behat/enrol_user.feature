@enroll
Feature: User can be enrolled into a course
  In order to let them participate in course activities
  As an admin
  I must be able to enroll users

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email                |
      | student1 | Studie    | One      | student1@example.com |
    And the following "courses" exist:
      | fullname   | shortname |
      | Course 001 | C001      |
    And I log in as "admin"
    And I am on "Course 001" course homepage

  Scenario: User can be enrolled without javascript
    When I enroll "Studie One" user as "Student"
    And I am on the "Course 001" "Enrolled users" page
    Then I should see "Studie One"

  @javascript
  Scenario: User can be enrolled with javascript enroll element
    When I enroll "Studie One" user as "Student"
    And I am on the "Course 001" "Enrolled users" page
    Then I should see "Studie One"
