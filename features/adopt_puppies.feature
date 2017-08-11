Feature: As a dog lover
  I want to adopt a puppy
  So that I have a loyal companion

  Scenario: Be able to view the details of a puppy
    Given I am on the home page
    When I click on the puppy "Brook"
    Then I see "Adopt Me!"

  Scenario: Be able to return to the view of all available puppies
    Given I am on the home page
    When I click on the puppy "Brook"
    And I click on "Return to List"
    Then I see the home page

  Scenario: Be able to add the puppy to adopt later
    Given I am on the home page
    When I click on the puppy "Brook"
    And I click on "Adopt Me!"
    Then I see the puppy "Brook" is in my litter

  Scenario: Be able to change my mind about adopting a puppy
    Given I have added a puppy to my litter
    When I click on "Change your mind"
    Then I see the home page

  Scenario: Be able to add another puppy to my litter
    Given I have added a puppy to my litter
    When I click on "Adopt Another Puppy"
    And I click on the puppy "Hanna"
    And I click on "Adopt Me!"
    Then I see the puppy "Hanna" is in my litter

  Scenario: Be able to change my mind removes all puppies from my litter
    Given I have added a puppy to my litter
    And I click on "Adopt Another Puppy"
    And I click on the puppy "Hanna"
    And I click on "Adopt Me!"
    When I click on "Change your mind"
    Then I see the home page
    And I see "Your cart is currently empty"

  Scenario: Add accessories to a puppy and the price change is reflected
    Given I have added a puppy to my litter
    When I add a "Collar & Leash" to my order
    And I add a "Chew Toy" to my order
    Then I see "$92.91"

  Scenario: Be able to fill in adoption info
    Given I have added a puppy to my litter
    When I click on "Complete the Adoption"
    Then I see "Please Enter Your Details"

  Scenario: Complete an adoption
    Given I have added a puppy to my litter
    When I click on "Complete the Adoption"
    And I fill the form in with the following values:
      | element        | value           |
      | order_name     | Joe Sixpack     |
      | order_address  | 123 Main St.    |
      | order_email    | joe@sixpack.com |
      | order_pay_type | Check           |
    And I click on "Place Order"
    Then I see "Thank you for adopting a puppy!"

  Scenario Outline: All fields are required to complete an adoption
    Given I have added a puppy to my litter
    When I click on "Complete the Adoption"
    And everything is filled in
    And I leave <element> blank
    And I click on "Place Order"
    Then I see "<error>"

    Examples:
      | element        | error                   |
      | order_name     | Name can't be blank     |
      | order_address  | Address can't be blank  |
      | order_email    | Email can't be blank    |
      | order_pay_type | Pay type can't be blank |


