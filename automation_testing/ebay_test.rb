require 'rubygems'
require 'webdrivers'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get("https://www.facebook.com/")
driver.find_element(:id, "email").send_keys("rohitdxt1999@gmail.com")
sleep 2
driver.find_element(:id, "pass").send_keys("password")
sleep 2
driver.find_element(:name, "login").click
sleep 10
puts "done navigation"
