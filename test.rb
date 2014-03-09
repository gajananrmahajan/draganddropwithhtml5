require 'selenium-webdriver'
require 'rspec-expectations'

def setup
	$driver = Selenium::WebDriver.for :firefox
end

def teardown
	$driver.quit
end

def run
	setup
	yield
	teardown
end

run do
	#$driver.get 'http://the-internet.herokuapp.com/drag_and_drop'
	$driver.get 'http://www.w3schools.com/html/html5_draganddrop.asp'
	sleep 30
	dnd_javascript = File.read(Dir.pwd + "/dnd.js")

#	$driver.execute_script(dnd_javascript + "$('#column-a').simulateDragDrop({ dropTarget: 'column-b'});")
	#
	$driver.execute_script(dnd_javascript + "$('#div1').simulateDragDrop({ dropTarget: 'div2'});")
	sleep 5
end
