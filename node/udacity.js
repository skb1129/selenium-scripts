const puppeteer = require("puppeteer");

const headless = false;

async function login(page, credentials) {
  await page.goto(
    "https://auth.udacity.com/sign-in?next=https%3A%2F%2Fmentor-dashboard.udacity.com%2Fqueue%2Foverview",
    { waitUntil: "networkidle0" }
  );
  await page.type("#email", credentials.email);
  await page.type("#revealable-password", credentials.password);
  await page.click("button.vds-button--primary");
  await page.waitForNavigation({ waitUntil: "networkidle0" });
}

async function queue(page) {
  const refresh = await page.evaluate(() => {
    const button = document.querySelector("button.vds-button--minimal");
    if (!button) return false;
    return button.innerText === "UPDATE OPTIONS";
  });
  if (refresh) {
    await page.evaluate(() => {
      document.querySelectorAll("button.vds-button--minimal")[1].click();
    });
  } else {
    await page.click("button.vds-button--primary");
    await page.waitForTimeout(2000);
    await page.click('label[for="queue-volume-max"]');
    await page.evaluate(() => {
      const switches = document.querySelectorAll('input[role="switch"]');
      for (let s of switches) s.click();
    });
    await page.click("footer > button");
  }
  await page.waitForTimeout(2000);
}

async function udacity(credentials) {
  const browser = await puppeteer.launch({ headless });
  const page = await browser.newPage();
  await login(page, credentials);
  await queue(page);
  await browser.close();
}

module.exports = udacity;
