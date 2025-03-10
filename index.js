// npm install #002
// var path = "/opt/acttoolcache/node/18.20.7/x64/lib/node_modules";
// const core = require(path + "/@actions/core");

try {
  // Get input value
  const myInput = core.getInput('my_input');
  
  // Set output value
  core.setOutput("my_output", `Hello, ${myInput}!`);

} catch (error) {
  core.setFailed("Hello - " + error.message);
}

