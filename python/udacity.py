from selenium import webdriver
from time import sleep

## FOR SERVER ##
# chrome_options = webdriver.ChromeOptions()
# chrome_options.add_argument('--headless')
# chrome_options.add_argument('--no-sandbox')
# chrome_options.add_argument('--disable-dev-shm-usage')
# driver = webdriver.Chrome('/usr/bin/chromedriver', chrome_options=chrome_options)
## FOR SERVER ##

driver = webdriver.Chrome('./chromedriver')
def loginUdacity():
    driver.get('https://auth.udacity.com/sign-in?next=https%3A%2F%2Fclassroom.udacity.com%2Fauthenticated')
    sleep(5)
    email = driver.find_element_by_xpath("//input[@type='email']")
    email.send_keys('xxEMAILxx')
    password = driver.find_element_by_xpath("//input[@type='password']")
    password.send_keys('xxPASSWORDxx')
    signin = driver.find_elements_by_xpath("//button[@type='button']")[4]
    signin.click()
    print('Login Success!')

def startReviewsQueue():
    driver.get('https://mentor-dashboard.udacity.com/queue/overview')
    sleep(5)
    enterQueue = driver.find_elements_by_xpath("//button[@type='button']")[0]
    if enterQueue.text == "UPDATE OPTIONS":
        refreshQueue()
        return
    enterQueue.click()
    sleep(1)
    keepMyQueueFull = driver.find_elements_by_tag_name("label")[2]
    keepMyQueueFull.click()
    switches = driver.find_elements_by_xpath("//input[@role='switch']")
    for switch in switches:
        switch.click()
    queueNow = driver.find_elements_by_xpath("//button[@type='button']")[7]
    queueNow.click()
    print('Queue Started!')
    sleep(5)

def refreshQueue():
    refresh = driver.find_elements_by_xpath("//button[@type='button']")[1]
    refresh.click()
    print('Queue Refreshed!')

loginUdacity()
sleep(5)
startReviewsQueue()
sleep(5)
driver.quit()
