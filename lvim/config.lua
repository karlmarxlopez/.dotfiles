--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
-- lvim.colorscheme = "night-owl"
-- lvim.colorscheme = "tokyonight-night"
lvim.colorscheme = "catppuccin"
-- Uncomment to see LSP debug logs
-- lvim.lsp.set_log_level("debug")
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.term_mode = { ["<C-l>"] = false }


-- Move current line / block with Alt-j/k ala vscode.
lvim.keys.insert_mode["∆"] = "<Esc>:m .+1<CR>==gi";
lvim.keys.insert_mode["˚"] = "<Esc>:m .-2<CR>==gi";
lvim.keys.normal_mode["∆"] = ":m .+1<CR>==";
lvim.keys.normal_mode["˚"] = ":m .-2<CR>==";
-- navigation
-- lvim.keys.normal_mode["<A-Up>"] = "<C-\\><C-N><C-w>k";
-- lvim.keys.normal_mode["<A-Down>"] = "<C-\\><C-N><C-w>j";
-- lvim.keys.normal_mode["<A-Left>"] = "<C-\\><C-N><C-w>h";
-- lvim.keys.normal_mode["<A-Right>"] = "<C-\\><C-N><C-w>l";

-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>ns",
--   "<cmd>lua require('package-info').show()<cr>",
--   { silent = true, noremap = true }
-- )
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- lvim.builtin.telescope.on_config_done = function(t)
--   pcall(t.load_extension, "live_grep_args")
-- end
-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"
-- lvim.builtin.which_key.mappings.f = { "<cmd>Telescope git_files show_untrack=true<cr>", "Find File"
-- }
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["m"] = {
  name = "+Terminal",
  f = { "<cmd>1ToggleTerm direction=float<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=50 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>3ToggleTerm size=15 direction=horizontal<cr>", "Split horizontal" },
  t = { "<cmd>4ToggleTerm size=15 direction=tab<cr>", "Split tab" },
  s = { "<cmd>TermSelect<cr>", "Select terminal" },
  c = { "<cmd>ToggleTerm close<cr>", "Close Terminal" },
}

lvim.builtin.which_key.mappings["n"] = {
  name = "+Package Info",
  i = { "<cmd>lua require('package-info').show()<cr>", "Show package info" },
  s = { "<cmd>lua require('package-info').search()<cr>", "Search package" },
  u = { "<cmd>lua require('package-info').update()<cr>", "Update package" },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "+Spectre",
  s = { "<cmd>lua require('spectre').open()<cr>", "Search" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Search in file" },
  p = { "<cmd>lua require('spectre').open_project_search()<cr>", "Search in project" },
}
lvim.builtin.which_key.mappings.s.t = {
  require('telescope').extensions.live_grep_args.live_grep_args, "Live grep args",
}

lvim.builtin.which_key.mappings.l.f = {
  function()
    require("lvim.lsp.utils").format {
      timeout_ms = 10000,
    }
  end,
  "Format",
}

-- lvim.builtin.which_key.mappings["m"] = {
--   name = "+Markdown Preview",
--   p = { "<Plug>MarkdownPreview", "Preview" },
--   s = { "<Plug>MarkdownPreviewStop", "Stop Preview" },
--   t = { "<Plug>MarkdownPreviewToggle", "Toggle Preview" }
-- }
-- function! ToggleGstatus() abort
--   for l:winnr in range(1, winnr('$'))
--     if !empty(getwinvar(l:winnr, 'fugitive_status'))
--       exe l:winnr 'close'
--       return
--     endif
--   endfor
--   keepalt Git
-- endfunction
-- lvim.builtin.which_key.mappings["m"] = {
--   name = "+MiniMap",
--   t = { "<Plug>MiniMap.toggle", "Toggle" }
--   -- vim.keymap.set('n', '<Leader>mt', MiniMap.toggle)
-- }
-- lvim.builtin.which_key.setup.plugins.presets.z = true
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
--   c = { "<cmd>Trouble close<cr>", "Close" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    exe = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
  },
}
-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  --   { command = "black", filetypes = { "python" } },
  --   { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    -- extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "json", "typescript", "typescriptreact", "javascript" },
  },
  {
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  --   { command = "flake8", filetypes = { "python" } },
  --   {
  --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "shellcheck",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--severity", "warning" },
  --   },
  -- {
  --   command = "codespell",
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "javascript", "typescript", "typescriptreact" },
  -- },
  {
    command = "jsonlint",
    filetypes = { "json" },
  },
  {
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript" }
  },
}

-- Additional Plugins
lvim.plugins = {
  -- {
  --   "folke/trouble.nvim",
  --   cmd = "TroubleToggle",
  -- },
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Previous()', { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-h>", 'copilot#Next()', { silent = true, expr = true })
    end
  },
  -- {
  --   "tpope/vim-fugitive",
  --   cmd = {
  --     "G",
  --     "Git",
  --     "Gdiffsplit",
  --     "Gread",
  --     "Gwrite",
  --     "Ggrep",
  --     "GMove",
  --     "GDelete",
  --     "GBrowse",
  --     "GRemove",
  --     "GRename",
  --     "Glgrep",
  --     "Gedit"
  --   },
  --   ft = { "fugitive" }
  -- },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", ";w", ":HopWord<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", ";c", ":HopWordCurrentLine<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", ";l", ":HopLineStart<cr>", { silent = true })
    end,
  },
  {
    "echasnovski/mini.map",
    branch = "stable",
    config = function()
      require('mini.map').setup()
      local map = require('mini.map')
      map.setup({
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.diagnostic({
            error = 'DiagnosticFloatingError',
            warn  = 'DiagnosticFloatingWarn',
            info  = 'DiagnosticFloatingInfo',
            hint  = 'DiagnosticFloatingHint',
          }),
        },
        symbols = {
          encode = map.gen_encode_symbols.dot('4x2'),
        },
        window = {
          side = 'right',
          width = 5, -- set to 1 for a pure scrollbar :)
          winblend = 5,
          show_integration_count = false,
        },
      })
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "typescript", "typescriptreact" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  -- {
  --   "yeddaif/neovim-purple",
  --   as = 'shades of purple'
  -- },
  {
    "tpope/vim-surround"
  },
  {
    "tpope/vim-repeat"
  },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   build = function() vim.fn["mkdp#util#install"]() end,
  -- },
  -- { "bluz71/vim-nightfly-colors", as = "nightfly" },
  -- { "bluz71/vim-moonfly-colors",  name = "moonfly", lazy = false, priority = 1000 },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        enabled = true
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = { enabled = true },
      })
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- {
  --   "oxfist/night-owl.nvim"
  -- },
  {
    "projekt0n/github-nvim-theme"
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        no_italic = true,
        color_overrides = {
          mocha = {
            base = "#120121",
            -- base = "#0e001a",
            -- base = "#041626",
            -- base = "#18192f",
            mantle = "#000000",
            crust = "#000000",
          },
        },
      })
    end
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   -- pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "Copilot setup",
-- })
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
--
--
lvim.autocommands = {
  {
    { "BufEnter", "Filetype" },
    {
      desc = "Open mini.map and exclude some filetypes",
      pattern = { "*" },
      callback = function()
        local exclude_ft = {
          "qf",
          "NvimTree",
          "toggleterm",
          "TelescopePrompt",
          "alpha",
          "netrw",
        }

        local map = require('mini.map')
        if vim.tbl_contains(exclude_ft, vim.o.filetype) then
          vim.b.minimap_disable = true
          map.close()
        elseif vim.o.buftype == "" then
          map.open()
        end
      end,
    },
  },
}


-- lvim.builtin.treesitter.autotag.enable = true
-- Can not be placed into the config method of the plugins.
lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

-- lvim.transparent_window = true
vim.opt.relativenumber = true
-- local linters
-- lvim.Workspace.checkThirdParty = false