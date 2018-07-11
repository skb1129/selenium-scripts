from selenium import webdriver

driver = webdriver.Chrome()
driver.get('https://github.com/login')
username = driver.find_element_by_id('login_field')
username.send_keys('skb1129')
password = driver.find_element_by_id('password')
password.send_keys('29nov1997')
button = driver.find_element_by_name('commit')
button.click()
