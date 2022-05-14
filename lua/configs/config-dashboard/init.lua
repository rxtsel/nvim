-- Seleccionar telescope por defecto
vim.g.dashboard_default_executive = "telescope"

-- Opciones personalizadas
vim.g.dashboard_custom_section = {
	a = {
		description = { "  Find Files                  leader f  " },
		command = "Telescope find_files",
	},
	b = {
		description = { "  Find Word                   leader fg " },
		command = "Telescope live_grep",
	},
	c = {
		description = { "  Exit                        leader q  " },
		command = "exit",
	},
}
-- Comandos sólo en el dashboard
vim.cmd([[
augroup dashboard_au
autocmd! * <buffer>
autocmd User dashboardReady let &l:stl = 'Dashboard'
autocmd User dashboardReady nnoremap <buffer> <leader>q <cmd>exit<CR>
augroup END
]])

-- Footer personalizado
vim.g.dashboard_custom_footer = { "Cristhian Melo" }

-- Logo personalizado
vim.g.dashboard_custom_header = {
	[[                             ]],
	[[           ░░░░░░░           ]],
	[[      ░░░░░░░░░░░░░░░░░      ]],
	[[    │░░░░░░░░░░░░░░░░░░░│    ]],
	[[    │░░░░░░░░░░░░░░░░░░░│    ]],
	[[   ░└┐░░░░░░░░░░░░░░░░░┌┘░   ]],
	[[   ░░└┐░░░░░░░░░░░░░░░┌┘░░   ]],
	[[   ░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░   ]],
	[[    ░│██████▌░░░▐██████│░    ]],
	[[    ░│▐███▀▀░░▄░░▀▀███▌│░    ]],
	[[    ─┘░░░░░░░▐█▌░░░░░░░└─    ]],
	[[    ░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░    ]],
	[[      ─┘██▌░░░░░░░▐██└─      ]],
	[[      ░░▐█─┬┬┬┬┬┬┬─█▌░░      ]],
	[[      ░░░▀┬┼┼┼┼┼┼┼┬▀░░░      ]],
	[[       ░░░└┴┴┴┴┴┴┴┘░░░       ]],
	[[         ░░░░░░░░░░░         ]],
	[[                             ]],
	[[ ¸.-•~¹°”ˆ˜ rxtsel ˜ˆ”°¹~•-.¸]],
}
