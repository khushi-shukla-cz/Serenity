const readline = require("readline");
const Anthropic = require("@anthropic-ai/sdk");
const dotenv = require("dotenv");
dotenv.config();

const client = new Anthropic({ apiKey: process.env.ANTHROPIC_API_KEY });

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.question("Enter your prompt for Claude: ", async (prompt) => {
  const response = await client.messages.create({
    model: "claude-3-opus-20240229",
    max_tokens: 1000,
    messages: [{ role: "user", content: prompt }],
  });

  console.log("\nClaude's response:\n", response.content[0].text);
  rl.close();
});
