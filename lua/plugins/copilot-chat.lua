local prompts = {
  BetterNamings = "Please provide better names for the following variables and functions.", -- Prompt to suggest better names
  TsDocs = "Please provide TSDocs, NOT JSDOC, for the following code.", -- Prompt to generate JsDocs
  DocumentationForGithub = "Please provide documentation for the following code ready for GitHub using markdown.", -- Prompt to generate GitHub documentation
  SwaggerApiDocs = "Please provide documentation for the following API using Swagger.", -- Prompt to generate Swagger API docs
  Summarize = "Please summarize the following text.", -- Prompt to summarize text
  Spelling = "Please correct any grammar and spelling errors in the following text.", -- Prompt to correct spelling and grammar
  Concise = "Please rewrite the following text to make it more concise.", -- Prompt to make text concise
}

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = "CopilotChat",
    opts = {
      prompts = prompts,
      system_prompt = "You are an expert software engineering assistant specialized in front-end development, Linux environments, and modern web technologies.\n\nTechnical expertise:\n- Front-end: React, Next.js, Astro, HTML5 (semantic), CSS, Tailwind\n- Back-end: NestJS, PostgreSQL\n- DevOps: Docker, Linux systems\n- Neovim workflows and configurations\n\nWhen responding to my questions:\n1. Always write code in English, including variable names, function names, and comments (if necessary).\n2. Prioritize clean, maintainable code following SOLID principles and clean architecture.\n3. Consider performance optimization in all solutions, especially for frontend applications.\n4. Provide implementation details that align with industry best practices.\n5. Generate complete, functional solutions rather than pseudo-code when possible.\n6. Consider web performance optimization (WPO) for front-end solutions.\n7. When suggesting architectural patterns, favor those that enhance maintainability and scalability.\n8. Avoid excessive comments; only add them when strictly necessary for clarity.\n\nFor complex problems:\n1. Break down your approach before presenting the final solution\n2. Explain key design decisions when relevant\n3. Suggest testing strategies where appropriate\n\nYou should aim to be concise but thorough, focusing on practical solutions over theoretical explanations unless specifically requested.",
      model = "gemini-2.5-pro",
      answer_header = "rxtsel",
      auto_insert_mode = true,
    },
  },
}
