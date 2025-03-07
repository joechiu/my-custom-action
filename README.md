# my-custom-action

## Tag
v1.0.6
## Misc
Creating a custom GitHub Action involves writing a set of instructions that automate a task you want to perform during your CI/CD workflows. You can create a GitHub Action using Docker, JavaScript, or directly using shell commands. Here's how you can build and publish a custom GitHub Action:
1. Set Up Your Repository

Start by creating a repository for your custom GitHub Action:

    Go to GitHub and create a new repository. You can name it anything you want, e.g., my-custom-action.
    Clone the repository to your local machine.

2. Create the Action Metadata File

The key part of every GitHub Action is the action.yml file. This file provides metadata about your action, such as its name, description, and input/output parameters.

    Inside your project, create a file called action.yml. This file describes your action and its inputs/outputs.

Example action.yml:

name: 'My Custom Action'
description: 'A simple custom GitHub Action'
author: 'Your Name'
inputs:
  my_input:
    description: 'A sample input'
    required: true
    default: 'default_value'
outputs:
  my_output:
    description: 'The output of the action'
runs:
  using: 'node12'
  main: 'dist/main.js'

    name: The name of your action.
    description: A short description of what the action does.
    inputs: A list of inputs that the action accepts.
    outputs: A list of outputs that the action will produce.
    runs: Defines how the action is executed (could be with Docker or JavaScript).

3. Write the Action Code

You can create the logic of your action in several different ways. Here are two popular methods:
Option 1: JavaScript Action

If you're building a JavaScript action, you need to create a script that will execute when your action is triggered.

    Create a src folder and add your code inside a JavaScript file, such as index.js.

Example index.js:

const core = require('@actions/core');

try {
  // Get input value
  const myInput = core.getInput('my_input');
  
  // Set output value
  core.setOutput("my_output", `Hello, ${myInput}!`);

} catch (error) {
  core.setFailed(error.message);
}

    The @actions/core package is the GitHub Actions SDK that provides utility functions for interacting with inputs, outputs, and error handling.

Option 2: Docker Action

If you prefer using Docker, you can run your action inside a Docker container. Here's how to create a Docker-based action:

    Create a Dockerfile in your repository:

Example Dockerfile:

FROM node:12-alpine

# Set working directory
WORKDIR /action

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the action's code
COPY . .

# Command to run the action
ENTRYPOINT ["node", "index.js"]

    In this case, you would write the logic in a Node.js script like index.js (same as the JavaScript option).

    Update your action.yml to specify that you’re using Docker:

name: 'My Docker Action'
description: 'A Docker-based GitHub Action'
inputs:
  my_input:
    description: 'A sample input'
    required: true
    default: 'default_value'
outputs:
  my_output:
    description: 'The output of the action'
runs:
  using: 'docker'
  image: 'Dockerfile'

4. Add Dependencies

If your action requires dependencies, such as external libraries, make sure to install them.

For JavaScript actions, you can add dependencies to package.json.

Example package.json:

{
  "name": "my-custom-action",
  "version": "1.0.0",
  "dependencies": {
    "@actions/core": "^1.8.0"
  }
}

Then, run npm install to install the required dependencies.
5. Test Your Action Locally (Optional)

GitHub provides a tool called Act that you can use to run and test GitHub Actions locally before publishing them.

    Install Act by following the instructions on the Act GitHub page.
    Once installed, run your action locally with the following command:

    act

This will run the GitHub Action in a local environment similar to how it would run on GitHub.
6. Publish Your Action

After you’ve tested your action and are happy with it, you can publish it to the GitHub Marketplace so others can use it.

    Push your action to GitHub:
        Commit your code to your GitHub repository.
        Push the repository to GitHub.

    Tag the Release:
        Go to the "Releases" tab of your repository on GitHub.
        Create a new release with a tag (e.g., v1.0.0).

    Publish to GitHub Marketplace:
        Go to your repository's settings.
        Under the "Actions" tab, there is an option to publish your action to the GitHub Marketplace.
        Provide the necessary details, such as action description and images, and follow the prompts.

7. Use Your Custom Action

Once your action is published, others can use it by referencing it in their workflows.

Example usage in a workflow:

name: Test Custom Action

on:
  push:
    branches:
      - main

jobs:
  custom-action-job:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Run my custom action
        uses: yourusername/my-custom-action@v1.0.0
        with:
          my_input: 'GitHub'

This will trigger your custom action whenever there is a push to the main branch.
8. Additional Notes

    Testing: You can also test your action in a private repository before making it public.
    Versioning: When you update your action, increment the version number (e.g., v1.1.0).
    Logging: Use core.debug(), core.info(), core.warning(), and core.error() to log information during the action execution.
    Outputs: Your action can set outputs using core.setOutput("name", "value").

Summary

Creating a custom GitHub Action involves defining an action.yml file, implementing your action logic (either in JavaScript, Docker, or shell), and then publishing it to the GitHub Marketplace. By using built-in GitHub Action SDKs like @actions/core, you can make your actions reusable and easily shareable with the community.

For more detailed documentation, check out GitHub's official guide on creating actions.
