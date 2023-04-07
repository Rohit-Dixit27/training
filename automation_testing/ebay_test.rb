require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.navigate().to("https://www.ebay.com/")
puts "done navigation"