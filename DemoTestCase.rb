require_relative 'Demo.rb'
$search_keyword = "ruby"
#define new browser
browser = Demo.new("https://www.upwork.com/")

wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
wait.until { browser.click_icon }
#click on switch icon
browser.click_icon.click

wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
wait.until { browser.select_job_option }
#select job option
browser.select_job_option.click

wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
wait.until { browser.feed_search }
#input keyword i.e ruby
browser.feed_search.send_keys($search_keyword)

wait = Selenium::WebDriver::Wait.new(:timeout => 1) # seconds
wait.until { browser.submit_button }
#click on search icon
browser.submit_button.click

wait = Selenium::WebDriver::Wait.new(:timeout => 2) # seconds
wait.until { browser.filter }
#click on additional filter button
browser.filter.click

wait = Selenium::WebDriver::Wait.new(:timeout => 1) # seconds
wait.until { browser.category }
#click on job category dropdown
browser.category.click

wait = Selenium::WebDriver::Wait.new(:timeout => 2) # seconds
wait.until { browser.selection_category_option }
#click on category option
browser.selection_category_option.click

wait = Selenium::WebDriver::Wait.new(:timeout => 1) # seconds
wait.until { browser.job_type }
#click on job type checkbox
browser.job_type.click

wait = Selenium::WebDriver::Wait.new(:timeout => 1) # seconds
wait.until { browser.project_length }
#click on project length checkbox

browser.project_length.click
wait = Selenium::WebDriver::Wait.new(:timeout => 1) # seconds
wait.until { browser.get_titles }

#Assert (Verify that at least one of first 3 jobs has the keyword in their titles)
$result = browser.get_titles
assert($result.include?($search_keyword),"At least one of first 3 jobs has the keyword in their titles"+$search_keyword)

wait = Selenium::WebDriver::Wait.new(:timeout => 1) # seconds
wait.until { get_second_job_section }
#Click second job post
browser.get_second_job_section.click

wait = Selenium::WebDriver::Wait.new(:timeout => 3) # seconds
wait.until { browser.get_second_job_description }

#Assert (verify keyword is presented in job description)
$result = browser.get_second_job_description
assert($result.include?($search_keyword),"Verify that the keyword is presented in job description"+$search_keyword)

wait = Selenium::WebDriver::Wait.new(:timeout => 3) # seconds
wait.until { browser.get_job_type}

#Assert (Verify that job type match search criteria)
$result = browser.get_job_type
assert($result.include?('Hourly'),"Verify that Job type match search criteria, Hourly")

wait = Selenium::WebDriver::Wait.new(:timeout => 3) # seconds
wait.until { browser.get_project_length}

#Assert (Verify that job project length match search criteria)
$result = browser.get_project_length
assert($result.include?('Less than a month'),"Verify that Job type match search criteria, Less than a month")

#Close Browser
browser.close_browser