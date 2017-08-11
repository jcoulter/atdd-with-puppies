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
  element = @browser.links(text: caption)[0]
  element = @browser.buttons(text: caption)[0] unless element.exist?
  element.click
end

Then(/^I see the home page$/) do
  expect(@browser.url).to eq 'http://localhost:3000/'
end

When(/^I click on the puppy "([^"]*)"$/) do |name|
  @browser.div(text: name).parent.button.click
end

Then(/^I see the puppy "([^"]*)" is in my litter$/) do |name|
  expect(@browser.h2(text: "#{name}:").exist?).to be true
end

Given(/^I have added a puppy to my litter$/) do
  step 'I am on the home page'
  step 'I click on the first puppy'
  step 'I click on "Adopt Me!"'
end

When(/^I add a "([^"]*)" to my order$/) do |accessory|
  accessories = {"Collar & Leash"=> "collar", "Chew Toy" => "toy"}

  @browser.checkbox(id: accessories[accessory]).set(true)
end


And(/^I fill the form in with the following values:$/) do |table|
  table.hashes.each do |data|
    selector = {id: data["element"]}
    value = data["value"]

    if @browser.text_field(selector).exists?
      @browser.text_field(selector).set(value)
    elsif @browser.textarea(selector).exists?
      @browser.textarea(selector).set(value)
    else
      @browser.select_list(selector).select_value(value)
    end
  end
end