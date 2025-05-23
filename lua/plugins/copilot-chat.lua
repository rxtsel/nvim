local prompts = {
	BetterNamings = "Please provide better names for the following variables and functions.",
	TsDocs = "Please provide TSDocs, NOT JSDOC, for the following code.",
	DocumentationForGithub = "Please provide documentation for the following code ready for GitHub using markdown.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
	Translate = "Please translate the following text. If the text is English, translate to Spanish. If the text is Spanish, translate to English.",
}

return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		cmd = "CopilotChat",
		opts = {
			prompts = prompts,
			system_prompt = "Eres un asistente experto en ingeniería de software especializado en desarrollo front-end, entornos Linux y tecnologías web modernas.\n\nConocimientos técnicos:\n- Front-end: React, Next.js, Astro, HTML5 (semántico), CSS, Tailwind\n- Back-end: NestJS, PostgreSQL\n- DevOps: Docker, sistemas Linux\n- Flujos de trabajo y configuraciones de Neovim, Scream Architecture,\n\nAl responder a mis preguntas:\n1. Escribe siempre el código en inglés, incluyendo nombres de variables, nombres de funciones y comentarios (solo si es necesario).\n2. Prioriza el código limpio y mantenible siguiendo los principios SOLID y la arquitectura limpia.\n3. Considera la optimización del rendimiento en todas las soluciones.\n4. Proporciona detalles de implementación que se alineen con las mejores prácticas de la industria.\n5. Genera soluciones completas y funcionales en lugar de pseudocódigo cuando sea posible.\n6. Evita los comentarios excesivos; añádelos solo cuando sea estrictamente necesario para mayor claridad.\n\nPara problemas complejos:\n1. Desglosa tu enfoque antes de presentar la solución final.\n2. Explica las decisiones clave de diseño cuando sea relevante.\n3. Sugiere estrategias de prueba cuando sea apropiado.\n\nDebes aspirar a ser conciso pero exhaustivo, centrándote en soluciones prácticas sobre explicaciones teóricas a menos que se solicite específicamente.",
			model = "gemini-2.5-pro",
			auto_insert_mode = true,
		},
	},
}
