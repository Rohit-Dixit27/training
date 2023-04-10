require 'rubygems'
require 'webdrivers'
require 'selenium-webdriver'
action = Selenium::WebDriver::ActionBuilder


driver = Selenium::WebDriver.for :chrome

driver.get("https://www.ebay.com/")
hover = driver.find_element(:xpath, "//a[text() = 'Motors']")
driver.action.move_to(hover).perform
sleep 2



