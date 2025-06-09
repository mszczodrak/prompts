Vertex AI Studio

- System Instructions (located at the top): a set of instructions that the model processes before it processes prompts. When a system instruction is set, it applies to the entire request. It works across multiple user and model turns when included in the prompt. We recommend that you use system instructions to tell the model how you want it to behave and respond to prompts.

- Configuration (located on the right): This section allows you to select models (including 3rd party models), configure parameters, use Tools (such as grounding), and set advanced options.

- Prompt (located at the bottom): Here, you can create a prompt that utilizes multimodal capabilities.

Temperature

Temperature controls randomness. Lower values (e.g., 0.0-0.2) make the output more focused and deterministic. Higher values (e.g., 0.7-1.0) encourage more diverse or creative responses.

Output Token Limit

This sets the maximum number of tokens (parts of words) the model can generate for its response.

Top-P

Top-P (nucleus sampling) also controls randomness. It considers only the most probable tokens whose combined probability mass exceeds the Top-P value. A value of 1.0 considers all tokens. Lowering Top-P (e.g., to 0.8) makes the output more focused, similar to lowering temperature.

Safety Filter Settings: These are active by default to help block harmful content.