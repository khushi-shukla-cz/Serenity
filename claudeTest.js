import Anthropic from "@anthropic-ai/sdk";
import dotenv from "dotenv";
dotenv.config();

const client = new Anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY,
});

const run = async () => {
  const response = await client.messages.create({
    model: "claude-3-5-sonnet-20240229",
    max_tokens: 300,
    messages: [
      { role: "user", content: "Write a motivational quote about learning." },
    ],
  });
  console.log(response.content[0].text);
};

run();
