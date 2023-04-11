require 'rubygems'
require 'webdrivers'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

# throw exception after 10 seconds
driver.manage.timeouts.implicit_wait = 10
driver.get("http://127.0.0.1:5500/index.html")
driver.manage.window.maximize
elements = Array.new()
elements = driver.find_elements(:id, 't')
puts elements.size
i=0

while(i<elements.size)
  puts elements[i].text
  i+=1
end