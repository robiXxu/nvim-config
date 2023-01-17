local dap = require("dap")

dap.set_log_level('WARN')

vim.keymap.set("n", "<F6>", dap.step_over)
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F7>", dap.step_into)
vim.keymap.set("n", "<F8>", dap.step_out)
vim.keymap.set("n", "<F10>", dap.terminate)
vim.keymap.set("n", "<LEADER>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<LEADER>B", function() dap.set_breakpoint(vim.fn.input('breakpoint condition: ')) end)
vim.keymap.set("n", "<LEADER>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input('log point message: ')) end)
vim.keymap.set("n", "<LEADER>dr", dap.repl.open)
vim.keymap.set("n", "<LEADER>dl", dap.run_last)



-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go 
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  } 
}

-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ruby
dap.adapters.ruby = function(callback, config)
  callback {
    type = "server",
    host = "127.0.0.1",
    port = "7000",
    --port = "${port}",
    executable = {
      command = "bundle",
      args = { "exec", "rdbg", "-n", "--open", "--port", "${port}",
        "-c", "--", "bundle", "exec", config.command, config.script,
      },
    },
  }
end

dap.configurations.ruby = {
  {
    type = "ruby",
    name = "debug current file",
    request = "attach",
    localfs = true,
    command = "ruby",
    host = "127.0.0.1",
    port = "7000",
    cwd = vim.fn.getcwd(),
    script = "${file}",
  },
  {
    type = "ruby",
    name = "run current spec file",
    request = "attach",
    localfs = true,
    command = "rspec",
    script = "${file}",
  },
}

-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript-firefox
dap.adapters.firefox = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/root/other/vscode-firefox-debug/dist/adapter.bundle.js'},
}

dap.configurations.typescript = {
  {
    name = 'Debug with Firefox',
    type = 'firefox',
    request = 'launch',
    reAttach = true,
    url = 'https://localdev.habitat.sketchup.com:4201',
    webRoot = '${workspaceFolder}',
    firefoxExecutable = '/Applications/Firefox.app/Contents/MacOS/firefox'
  },
  -- {
  --   name = "Attach to Firefix",
  --   type = "firefox",
  --   request = "attach",
  --   reAttach = true,
  --   program = "${file}",
  --   cwd = vim.fn.getcwd(),
  --   sourceMaps = true,
  --   protocol = "inspector",
  --   port = 6000,
  --   url = 'https://localdev.habitat.sketchup.com:4201',
  --   webRoot = "${workspaceFolder}"
  -- }
  -- {
  --   name = 'Attach to Firefox',
  --   type = 'firefox',
  --   request = 'attach',
  --   reAttach = true,
  --   url = 'https://localdev.habitat.sketchup.com:4201',
  --   firefoxExecutable = '/Applications/Firefox.app/Contents/MacOS/firefox-bin'
  -- }
}


-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/root/other/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}


-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript-chrome
dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/root/other/vscode-chrome-debug/out/src/chromeDebug.js"} -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}
dap.configurations.typescriptreact = { -- change to typescript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}
