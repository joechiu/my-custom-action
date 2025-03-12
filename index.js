const core = require("@actions/core");

try {
  // Get the input 'message' from the action
  const message = core.getInput("message");
  
  // Log the message
  core.info(`🚀 Message from action: ${message}`);
} catch (error) {
  core.setFailed(`Action failed: ${error.message}`);
}
