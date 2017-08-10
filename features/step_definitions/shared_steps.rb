Given(/^I am on the home page$/) do
  @browser.goto 'http://localhost:3000/'
end

When(/^I click on the first puppy$/) do
  @browser.buttons[0].click
end

Then(/^I see "([^"]*)"$/) do |expected_text|
  expect(@browser.html.include? expected_text).to be true
end

And(/^I click on "([^"]*)"$/) do |caption|
  @browser.link(text: caption).click
end

Then(/^I see the home page$/) do
  expect(@browser.url).to eq 'http://localhost:3000/'
end