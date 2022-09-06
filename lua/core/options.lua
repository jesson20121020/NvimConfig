local api = require("utils.api")

local options = {}

options.transparency_background = true
options.python_interpreter_path = "/usr/local/bin/python3"
options.code_snippet_directory = api.path.join(vim.fn.stdpath("config"), "snippets")
options.nvim_lint_dir = api.path.join(vim.fn.stdpath("config"), "lint")
options.icons = "kind"

return options
