local iron = require('iron')

iron.core.set_config {
    preferred = {
        python = "ipython"
    },
    repl_open_cmd = 'rightbelow 10 split'
}


