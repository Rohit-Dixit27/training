require 'rubygems'
require 'webdrivers'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get("https://www.facebook.com/")
sleep 2
driver.find_element(:xpath, "//a[text() = 'Forgotten password?']").click
sleep 1
driver.navigate().to("https://www.w3schools.com/howto/howto_css_dropdown_navbar.asp")
driver.find_element(:id, "navbtn_tutorials").click
sleep 1
driver.find_element(:xpath, "//a[text() = 'Learn CSS']").click
sleep 1
driver.find_element(:xpath, "//a[text() = 'Start CSS Quiz!']").click
sleep 1
driver.navigate().to("https://www.w3schools.com/cssref/sel_hover.php")
sleep 1
driver.find_element(:xpath, "//a[text() = 'Try it Yourself »']").click
sleep 1
