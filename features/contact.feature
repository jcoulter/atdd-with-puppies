Feature: As a user of the site
  I want to be able to contact the agency
  So that I can ask pertinent questions

  Scenario: Get to the contact form
    Given I am on the home page
    When I click on the email icon
    Then I see "Contact"

  Scenario: Submit a question
    Given I am on the home page
    When I click on the email icon
    And I fill the form in with the following values:
      | element               | value                                              |
      | contact_message_name  | Joe Sixpack                                        |
      | contact_message_email | joe@sixpack.com                                    |
      | contact_message_body  | I am having trouble adopting a puppy. Please help! |
    Then I see "Thank you for contacting us. We will respond as soon as we can"
