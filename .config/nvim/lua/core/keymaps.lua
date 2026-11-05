vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- general.lua: save, quit, clear search highlight
map("n", "<leader>w", "<cmd>write<CR>")
map("n", "<leader>q", "<cmd>quit<CR>")
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- lsp.lua: keymaps active only when an LSP server is attached to the buffer
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }

		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "<leader>k", vim.lsp.buf.hover, opts)
		map("n", "<leader>rn", vim.lsp.buf.rename, opts)
		map("n", "<leader>c", function()
			vim.diagnostic.enable(not vim.diagnostic.is_enabled())
		end, opts)
	end,
})

-- telescope.lua: find files
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")

-- blink.lua: autocompletion, insert mode only
local blink = function()
	return require("blink.cmp")
end

-- blink.lua: show or hide the completion menu
map("i", "<C-Space>", function()
	blink().show()
end)
map("i", "<C-e>", function()
	blink().hide()
end)

-- blink.lua: Enter accepts the completion if the menu is open, otherwise normal Enter
map("i", "<CR>", function()
    if blink().is_visible() and blink().accept() then
        return ""
    end

    return "<CR>"
end, { expr = true, replace_keycodes = true })

-- blink.lua: Down and Up move through the menu, otherwise normal movement
map("i", "<Down>", function()
	if blink().is_visible() then
		blink().select_next()
	else
		vim.api.nvim_feedkeys(vim.keycode("<Down>"), "n", false)
	end
end)

map("i", "<Up>", function()
	if blink().is_visible() then
		blink().select_prev()
	else
		vim.api.nvim_feedkeys(vim.keycode("<Up>"), "n", false)
	end
end)

-- blink.lua: Tab and Shift+Tab move through the menu, otherwise normal Tab
map("i", "<Tab>", function()
	if blink().is_visible() then
		blink().select_next()
	else
		vim.api.nvim_feedkeys(vim.keycode("<Tab>"), "n", false)
	end
end)

map("i", "<S-Tab>", function()
	if blink().is_visible() then
		blink().select_prev()
	else
		vim.api.nvim_feedkeys(vim.keycode("<S-Tab>"), "n", false)
	end
end)

-- bufferline.lua: cycle and close tabs
map("n", "<S-j>", "<cmd>BufferLineCyclePrev<CR>")
map("n", "<S-k>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<leader>d", "<cmd>bdelete<CR>")

-- neo-tree.lua: open or bring the explorer into focus
map("n", "<leader>e", "<cmd>Neotree focus right<CR>")
