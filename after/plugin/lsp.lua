local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
local map = vim.keymap.set

lsp.preset('recommended')

lsp.ensure_installed({
  "tsserver",
  "eslint",
  "clangd",
  "rust_analyzer",
  "gopls",
  "html",
  "cssls",
  "yamlls",
  "ruby_ls",
  "marksman",
  "jsonls",
  "sqlls",
  "solargraph",
})


-- lspconfig.clangd.setup {
--   cmd = {
--     "/usr/bin/clangd"
--   },
--   filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
-- }

lspconfig.arduino_language_server.setup {
  cmd = {
    "arduino-language-server",
    "-clangd",
    "/Users/robixxu/.local/share/nvim/mason/packages/clangd/clangd_16.0.2/bin/clangd",
    "-cli",
    "/opt/homebrew/bin/arduino-cli",
    "-cli-config",
    "/Users/robixxu/Library/Arduino15/arduino-cli.yaml",
    "-fqbn",
    "arduino:avr:nano"
  },
  filetypes = { "arduino", "ino" },
  capabilities = {
    general = {
      positionEncodings = { "utf-16" }
    },
    textDocument = {
      callHierarchy = {
        dynamicRegistration = false
      },
      codeAction = {
        codeActionLiteralSupport = {
          codeActionKind = {
            valueSet = { "", "quickfix", "refactor", "refactor.extract", "refactor.inline", "refactor.rewrite", "source", "source.organizeImports" }
          }
        },
        dataSupport = true,
        dynamicRegistration = true,
        isPreferredSupport = true,
        resolveSupport = {
          properties = { "edit" }
        }
      },
      completion = {
        completionItem = {
          commitCharactersSupport = false,
          deprecatedSupport = false,
          documentationFormat = { "markdown", "plaintext" },
          preselectSupport = false,
          snippetSupport = false
        },
        completionItemKind = {
          valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 }
        },
        contextSupport = false,
        dynamicRegistration = false
      },
      declaration = {
        linkSupport = true
      },
      definition = {
        dynamicRegistration = true,
        linkSupport = true
      },
      documentHighlight = {
        dynamicRegistration = false
      },
      documentSymbol = {
        dynamicRegistration = false,
        hierarchicalDocumentSymbolSupport = true,
        symbolKind = {
          valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 }
        }
      },
      formatting = {
        dynamicRegistration = true
      },
      hover = {
        contentFormat = { "markdown", "plaintext" },
        dynamicRegistration = true
      },
      implementation = {
        linkSupport = true
      },
      inlayHint = {
        dynamicRegistration = true,
        resolveSupport = {
          properties = {}
        }
      },
      publishDiagnostics = {
        relatedInformation = true,
        tagSupport = {
          valueSet = { 1, 2 }
        }
      },
      rangeFormatting = {
        dynamicRegistration = true
      },
      references = {
        dynamicRegistration = false
      },
      rename = {
        dynamicRegistration = true,
        prepareSupport = true
      },
      semanticTokens = vim.NIL,
      signatureHelp = {
        dynamicRegistration = true,
        signatureInformation = {
          activeParameterSupport = false,
          documentationFormat = { "markdown", "plaintext" },
          parameterInformation = {
            labelOffsetSupport = true
          }
        }
      },
      synchronization = {
        didSave = true,
        dynamicRegistration = false,
        willSave = true,
        willSaveWaitUntil = true
      },
      typeDefinition = {
        linkSupport = true
      }
    },
    window = {
      showDocument = {
        support = true
      },
      showMessage = {
        messageActionItem = {
          additionalPropertiesSupport = false
        }
      },
      workDoneProgress = true
    },
    workspace = {
      applyEdit = true,
      configuration = true,
      didChangeWatchedFiles = {
        dynamicRegistration = true,
        relativePatternSupport = true
      },
      inlayHint = {
        refreshSupport = true
      },
      semanticTokens = vim.NIL,
      symbol = {
        dynamicRegistration = false,
        hierarchicalWorkspaceSymbolSupport = true,
        symbolKind = {
          valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 }
        }
      },
      workspaceEdit = {
        resourceOperations = { "rename", "create", "delete" }
      },
      workspaceFolders = true
    }
  }
}

local on_attach = function(client, bufnr)
  local opts = {
    buffer = bufnr,
    remap = false
  }


	map("n", "gD", vim.lsp.buf.declaration, opts)
	map("n", "gd", vim.lsp.buf.definition, opts)
	map("n", "gh", vim.lsp.buf.hover, opts)
	map("n", "gi", vim.lsp.buf.implementation, opts)
	map("n", "gr", vim.lsp.buf.references, opts)
	map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	-- map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	-- map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	map("n", "<leader>r", vim.lsp.buf.rename, opts)
	map("n", "<leader>c", vim.lsp.buf.code_action, opts)
	-- map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
	map("n", "<leader>e", vim.diagnostic.open_float, opts)
	map("n", "[g", vim.diagnostic.goto_prev, opts)
	map("n", "]g", vim.diagnostic.goto_next, opts)

	-- map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
	map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)

  --lsp.buffer_autoformat()
end

lsp.on_attach(on_attach)
lsp.nvim_workspace()
lsp.setup({
  flags = {
    debounce_text_changes = 5,
  }
})

-- vim.diagnostic.config({
--   virtual_text = true,
--   signs = true,
--   update_in_insert = false,
--   underline = true,
--   severity_sort = false,
--   float = true,
-- })
