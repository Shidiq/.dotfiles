local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = { "python", "javascript", "css", "html", "tsx", "json", "yaml", "scss" },
    sync_install = false,
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = false,
        disable = {},
    },
    rainbow = {
        enable = true,
        extend_mode = true,
        max_file_lines = nil,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer'
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer'
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer'
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer'
            }
        },
        swap = {
            enable = true,
            swap_next = {["<leader>xp"] = "@parameter.inner"},
            swap_previous = {["<leader>xP"] = "@parameter.inner"}
        },
        context_commentstring = {
            enable = true
        },
    }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
