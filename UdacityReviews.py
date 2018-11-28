from selenium import webdriver
from time import sleep

driver = webdriver.Chrome('./chromedriver')
driver.get('https://auth.udacity.com/sign-in?next=https%3A%2F%2Fclassroom.udacity.com%2Fauthenticated')
sleep(5)
email = driver.find_element_by_xpath("//input[@type='email']")
email.send_keys('skbansal.cse15@chitkara.edu.in')
password = driver.find_element_by_xpath("//input[@type='password']")
password.send_keys('deVil@d00r')
signin = driver.find_elements_by_xpath("//button[@type='button']")
# signin.click()
print(signin)
print('DONE!')
