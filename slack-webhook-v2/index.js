const core = require("@actions/core");
const axios = require("axios");

async function run() {

  try {
    const webhookUrl = core.getInput("webhook_url", {required: true});
    const payload = core.getInput("payload");
    const message = core.getInput("message");

    let data;

    if (payload) {
      // make sure the payload is valid
      data = JSON.parse(payload);
    } else if (message) {
      data = {
        username: "GitHub Actions",
        text: message,
      };
    } else {
      throw new Error("either message or payload is required");
    }

    await axios.post(webhookUrl, data);

  } catch (e) {
    core.setFailed(e.message);
  }

}

run();
