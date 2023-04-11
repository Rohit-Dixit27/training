require 'rubygems'
require 'webdrivers'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get("http://localhost:3000/")
driver.manage.window.maximize
selected_result = driver.find_element(:id, 'read_book').selected? # check whether the checkbox is selected or not.
sleep 5
puts selected_result
displayed_result = driver.find_element(:id, 'read_book').displayed? # check for an element is displayed or not
puts displayed_result
