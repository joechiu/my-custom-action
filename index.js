console.log("Running custom Node.js GitHub Action...");

const args = process.argv.slice(2);
const message = args[0] || "Hello, GitHub Actions!";

console.log(`Message: ${message}`);
