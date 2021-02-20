const functions = require("firebase-functions");

const udacity = require("./udacity");

const options = { headless: true, args: ["--no-sandbox"] };

exports.startUdacityQueue = functions
  .runWith({ timeoutSeconds: 120, memory: "1GB" })
  .pubsub.schedule("0 8 * * *")
  .timeZone("Asia/Kolkata")
  .onRun(() => {
    return udacity(
      { email: "xxEMAILxx", password: "xxPASSWORDxx" },
      options
    );
  });

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
