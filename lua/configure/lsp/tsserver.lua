-- https://github.com/theia-ide/typescript-language-server

return {
    cmd = {"typescript-language-server", "--stdio"},
    init_options = {
        hostInfo = "neovim"
    },
    root_dir = function()
        return vim.fn.getcwd()
    end
}
