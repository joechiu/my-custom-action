import * as core from "@actions/core"

const core = require('@actions/core');

try {
  // Get input value
  const myInput = core.getInput('my_input');
  
  // Set output value
  core.setOutput("my_output", `Hello, ${myInput}!`);

} catch (error) {
  core.setFailed("Hello - " + error.message);
}

