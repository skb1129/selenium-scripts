const puppeteer = require("puppeteer");

const headless = false;

async function login(page) {
  await page.goto(
    "https://auth.udacity.com/sign-in?next=https%3A%2F%2Fmentor-dashboard.udacity.com%2Fqueue%2Foverview",
    { waitUntil: "networkidle0" }
  );
  await page.evaluate(() => {
    document.querySelector('input[type="email"]').value = "xxEMAILxx";
    document.querySelector('input[type="password"]').value = "xxPASSWORDxx";
    document.querySelectorAll('button[type="button"]')[4].click();
  });
  await page.waitForNavigation({ waitUntil: "networkidle0" });
}

async function queue(page) {
  const toContinue = await page.evaluate(() => {
    const button = document.querySelectorAll('button[type="button"]')[0];
    if (button.innerText === "UPDATE OPTIONS") {
      document.querySelectorAll('button[type="button"]')[1].click();
      return Promise.resolve(false);
    }
    button.click();
    return Promise.resolve(true);
  });
  await page.waitFor(1000);
  if (!toContinue) return;
  await page.evaluate(() => {
    document.querySelectorAll("label")[2].click();
    document.querySelectorAll('button[type="button"]')[7].click();
  });
  await page.waitFor(1000);
}

(async () => {
  const browser = await puppeteer.launch({ headless });
  const page = await browser.newPage();
  await login(page);
  await queue(page);
  await browser.close();
})();
