return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()
        dap.adapters.cppdbg = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
        }
        local explorer_was_open = false
        local function close_explorer()
            local explorer = Snacks.picker.get({ source = "explorer" })[1]
            explorer_was_open = explorer ~= nil
            if explorer then
                explorer:close()
            end
        end
        local function restore_explorer()
            if explorer_was_open and not Snacks.picker.get({ source = "explorer" })[1] then
                Snacks.explorer({ enter = false })
            end
            explorer_was_open = false
        end

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
            close_explorer()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
            close_explorer()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
            restore_explorer()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
            restore_explorer()
        end

        local wk = require("which-key")
        wk.add({
            { "<leader>d", group = "[D]ebug" }
        })
        vim.keymap.set('n', '<F5>', dap.continue, {})
        vim.keymap.set('n', '<F10>', dap.step_over, {})
        vim.keymap.set('n', '<F11>', dap.step_into, {})
        vim.keymap.set('n', '<F12>', dap.step_out, {})
        vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, {})
        -- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint(), {})
        -- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')), {})
        -- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open(), {})
        -- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last(), {})
        vim.keymap.set({'n', 'v'}, '<Leader>dh', require('dap.ui.widgets').hover, {})
        vim.keymap.set({'n', 'v'}, '<Leader>dp', require('dap.ui.widgets').preview, {})
        -- vim.keymap.set('n', '<Leader>df', function()
        --     local widgets = require('dap.ui.widgets')
        --     widgets.centered_float(widgets.frames)
        --, {})
        -- vim.keymap.set('n', '<Leader>ds', function()
        --     local widgets = require('dap.ui.widgets')
        --     widgets.centered_float(widgets.scopes)
        --, {})
    end,
}
