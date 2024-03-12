local builtin = require('telescope.builtin')

vim.keymap.set('n', 'FF', builtin.find_files, {})

vim.keymap.set('n', 'FG',
		function ()
			builtin.grep_string(
				{ search = vim.fn.input("grep ") }
				)
		end)

vim.keymap.set('n', 'FS', builtin.live_grep, {})

vim.keymap.set('n', 'FR', builtin.oldfiles, {})

vim.keymap.set('n', 'FB', builtin.buffers, {})

vim.keymap.set('n', 'FP', builtin.registers, {})

vim.keymap.set('n', 'F/', function()
      builtin.current_buffer_fuzzy_find()
    end, {})
