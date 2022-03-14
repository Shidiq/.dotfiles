local formatter = require('formatter')

formatter.setup {
    logging = true,
    filetype = {
        python = {
            -- configuration for black
            function ()
                return {
                    exe = '/opt/homebrew/Caskroom/miniforge/base/bin/black',
                    args = {"-"},
                    stdin = true,
                }
            end,
            function ()
                return {
                    exe = '/opt/homebrew/Caskroom/miniforge/base/bin/isort',
                    args = {"-"},
                    stdin = true,
                }
            end
        }

    }

}
