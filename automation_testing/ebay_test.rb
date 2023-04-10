require 'rubygems'
require 'webdrivers'
require 'selenium-webdriver'
action = Selenium::WebDriver::ActionBuilder

driver = Selenium::WebDriver.for :chrome
driver.get("http://localhost:3000/")
driver.find_element(:id, 'age_child').click
driver.find_element(:id, 'age_adult').click
driver.find_element(:id, 'read_book').click
driver.find_element(:id, 'add_book').click
sleep 2



