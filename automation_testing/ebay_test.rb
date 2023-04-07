require 'rubygems'
require 'webdrivers'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get("https://www.ebay.com/")
driver.find_element(:id, "gh-ac").send_keys("JBL")
sleep 2
driver.find_element(:id, "gh-btn").click
sleep 2
puts "done navigation"
