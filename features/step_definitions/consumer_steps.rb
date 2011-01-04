Given /^the following consumers:$/ do |consumers|
  Consumer.create!(consumers.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) consumer$/ do |pos|
  visit consumers_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following consumers:$/ do |expected_consumers_table|
  expected_consumers_table.diff!(tableish('table tr', 'td,th'))
end
