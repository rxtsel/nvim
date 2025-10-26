return {
	"yetone/avante.nvim",
	opts = {
		providers = {
			copilot = {
				model = "claude-sonnet-4",
			},
		},
		-- system_prompt as function ensures LLM always has latest MCP server state
		-- This is evaluated for every message, even in existing chats
		system_prompt = function()
			local hub = require("mcphub").get_hub_instance()
			return hub and hub:get_active_servers_prompt() or ""
		end,
		-- Using function prevents requiring mcphub before it's loaded
		custom_tools = function()
			return {
				require("mcphub.extensions.avante").mcp_tool(),
			}
		end,
	},
}
