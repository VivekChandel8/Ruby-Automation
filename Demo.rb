require 'selenium-webdriver'
class Demo

  def initialize(url)
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.delete_all_cookies
    @driver.manage.window.maximize
    @driver.navigate.to url
  end
    
  #Search icon to switch search type
  def click_icon()
    return @driver.find_element(:xpath => '//*[@id="layout"]/up-header-visitor-primary-nav/nav/div/div[2]/div[1]/up-header-search/up-c-on-click-outside/form/div/div/button[2]')
  end
  
  #Search option
  def select_job_option()
    return @driver.find_element(:xpath => '//*[@id="layout"]/up-header-visitor-primary-nav/nav/div/div[2]/div[1]/up-header-search/up-c-on-click-outside/form/div/div/up-header-search-menu/ul/li[2]/a')
  end

  #Search Input
  def feed_search()
    return @driver.find_element(:xpath => '//*[@id="layout"]/up-header-visitor-primary-nav/nav/div/div[2]/div[1]/up-header-search/up-c-on-click-outside/form/div/input[2]')
  end

  #Search Icon
  def submit_button()
    return @driver.find_element(:xpath =>'//*[@id="layout"]/up-header-visitor-primary-nav/nav/div/div[2]/div[1]/up-header-search/up-c-on-click-outside/form/div/div/button[1]')
  end
   
  #Filter Button 
  def filter()
    return @driver.find_element(:xpath => '//*[@id="layout"]/div[2]/div[2]/header-responsive/div/header/div[1]/div/div/div[2]/span/button')
  end
  
  #Category Dropdown
  def category()
    return @driver.find_element(:xpath => '//*[@id="layout"]/div[2]/div[2]/header-responsive/div/header/filter-tray-responsive/div/div/div/div[1]/div/form/div/up-c-dropdown-search/div/up-c-on-media-change/up-c-on-click-outside/up-c-transition/div/button')
  end 
  
  #Category Option
  def selection_category_option()
    return @driver.find_element(:xpath => '//*[@id="layout"]/div[2]/div[2]/header-responsive/div/header/filter-tray-responsive/div/div/div/div[1]/div/form/div/up-c-dropdown-search/div/up-c-on-media-change/up-c-on-click-outside/up-c-transition/div/ul/li[3]/a')
  end

  #Job type checkbox
  def job_type()
    return @driver.find_element(:xpath =>'//*[@id="layout"]/div[2]/div[2]/header-responsive/div/header/filter-tray-responsive/div/div/div/div[2]/div/form/div/div[2]/label/span[2]')
  end

  #Job length checkbox
  def project_length()
    return @driver.find_element(:xpath => '//*[@id="layout"]/div[2]/div[2]/header-responsive/div/header/filter-tray-responsive/div/div/div/div[5]/div/form/div/div[2]/label/span[2]')
  end

  #Return titles of top 3 jobs
  def get_titles()
    $result = ''
    while $i < 3 do
      result+= @driver.find_element(:xpath => '//*[@id="layout"]/div[2]/div[2]/div/div/div/section['+ $i +']/job-tile-responsive/div[1]/div[1]/h4/a').text
    end
    return result
  end

    #Second job section
  def get_second_job_section()
    return @driver.find_element(:xpath => '//*[@id="layout"]/div[2]/div[2]/div/div/div/section[2]')
  end

    #Return second job descriptions
  def get_second_job_description()
      return @driver.find_element(:xpath => '//*[@id="job-details-slider"]/div/div/visitor-job-details/ng-transclude/div[1]/div/div/section[2]/div/div').text 
  end

  #Return job type
  def get_job_type()
    return @driver.find_element(:xpath => '//*[@id="job-details-slider"]/div/div/visitor-job-details/ng-transclude/div[1]/div/div/section[3]/ul/li[1]/small').text
  end

  #Return project length
  def get_project_length()
    return @driver.find_element(:xpath => '//*[@id="job-details-slider"]/div/div/visitor-job-details/ng-transclude/div[1]/div/div/section[3]/ul/li[2]/strong/span[1]').text
  end
 
  #Close browser
  def close_browser()
    @driver.quit
  end

end