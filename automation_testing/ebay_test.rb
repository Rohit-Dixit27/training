require 'rubygems'
require 'webdrivers'
require 'selenium-webdriver'
action = Selenium::WebDriver::ActionBuilder


driver = Selenium::WebDriver.for :chrome

# driver.get("https://www.ebay.com/")
# hover = driver.find_element(:xpath, "//li//a[text() = 'Electronics']")
# driver.action.move_to(hover).perform
# sleep 2
# hover = driver.find_element(:xpath, "//a[text() = 'Motors']")
# driver.action.move_to(hover).perform
# sleep 2
# hover = driver.find_element(:xpath, "//li//a[text() = 'Fashion']")
# driver.action.move_to(hover).perform
# sleep 2
# hover = driver.find_element(:xpath, "//li//a[text() = 'Collectibles and Art']")
# driver.action.move_to(hover).perform
# sleep 2
# hover = driver.find_element(:xpath, "//li//a[text() = 'Sports']")
# driver.action.move_to(hover).perform
# sleep 2
# hover = driver.find_element(:xpath, "//li//a[text() = 'Health & Beauty']")
# driver.action.move_to(hover).perform
# sleep 2
# hover = driver.find_element(:xpath, "//li//a[text() = 'Industrial equipment']")
# driver.action.move_to(hover).perform
# sleep 2
# hover = driver.find_element(:xpath, "//li//a[text() = 'Home & Garden']")
# driver.action.move_to(hover).perform
# sleep 2
# hover = driver.find_element(:xpath, "//li//a[text() = 'Sell']")
# driver.action.move_to(hover).perform
# sleep 2


all_navbar_links = ['Electronics', 'Motors', 'Fashion', 'Collectibles and Art', 'Sports', 'Health & Beauty', 'Industrial equipment', 'Home & Garden', 'Sell']
driver.get("https://www.ebay.com/")
driver.manage.window.maximize
nav_links=0
while nav_links<9
  hover = driver.find_element(:xpath, "//li//a[text() = '#{all_navbar_links[nav_links]}']")
  driver.action.move_to(hover).perform
  sleep 2
  nav_links+=1
end



