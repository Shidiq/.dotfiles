vim.opt.termguicolors = true
require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center"
      }
    },
    separator_style = "thin",
    always_show_bufferline = false,
  }
}

