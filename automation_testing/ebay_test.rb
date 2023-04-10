require 'rubygems'
require 'webdrivers'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get("https://www.google.com/")
driver.manage.window.maximize
search = driver.find_element(:name, 'q')
search.send_keys("selenium")
sleep 2
search.submit()
driver.navigate.to("https://www.facebook.com/")
sleep 2
driver.navigate.back
driver.navigate.refresh
sleep 2
driver.navigate.forward
sleep 2

