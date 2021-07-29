--         ██╗   ██╗ ██╗ ███╗   ███╗ ██████╗   ██████╗
--         ██║   ██║ ██║ ████╗ ████║ ██╔══██╗ ██╔════╝
--         ██║   ██║ ██║ ██╔████╔██║ ██████╔╝ ██║
--         ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ██╔══██╗ ██║
--       ██╗╚████╔╝  ██║ ██║ ╚═╝ ██║ ██║  ██║ ╚██████╗
--       ╚═╝ ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ╚═╝  ╚═╝  ╚═════╝

-------------------- HELPERS -------------------------------

local cmd = vim.cmd                  -- Execute Vim commands.
local opt = vim.opt                  -- Set options.
local map = vim.api.nvim_set_keymap  -- Key mappings.

-------------------- OPTIONS -------------------------------

opt.clipboard = 'unnamedplus'       -- Clipboard integration.
opt.colorcolumn = '80'              -- Colored column to see textwidth.
opt.cursorline = true               -- Highlight the line with the cursor.
opt.expandtab = true                -- Use spaces instead of tabs.
opt.hidden = true                   -- Enable background buffers.
opt.ignorecase = true               -- Ignore case.
opt.joinspaces = false              -- No double spaces with join.
opt.mouse = 'a'                     -- Enable mouse support.
opt.number = true                   -- Show line numbers.
opt.scrolloff = 4                   -- Lines of context.
opt.shiftround = true               -- Round indent.
opt.shiftwidth = 4                  -- Size of an indent.
opt.sidescrolloff = 8               -- Columns of context.
opt.smartcase = true                -- Do not ignore case with capitals.
opt.smartindent = true              -- Insert indents automatically.
opt.startofline = false             -- Go to previous cursor location when
                                    -- switching buffers.
opt.tabstop = 4                     -- Number of spaces tabs count for.
opt.termguicolors = true            -- True color support.
opt.wildmode = {'list', 'longest'}  -- Command-line completion mode.
opt.wrap = false                    -- Disable line wrap.

-------------------- PLUGINS -------------------------------

cmd 'packadd paq-nvim'
require 'paq-nvim' {
    'airblade/vim-gitgutter';          -- Git gutter.
    'chrisbra/vim-diff-enhanced';      -- Enhanced vimdiff.
    'easymotion/vim-easymotion';       -- Easy motions.
    'justinmk/vim-sneak';              -- Extra motions.
    'kana/vim-textobj-line';           -- Text objects for current line.
    'kana/vim-textobj-user';           -- Dependency for vim-textobj-line.
    'michaeljsmith/vim-indent-object'; -- Indent text object.
    'tpope/vim-commentary';            -- Comment stuff out.
    'tpope/vim-repeat';                -- Repeating plugin maps.
    'tpope/vim-rsi';                   -- Readline features in command line.
    'tpope/vim-surround';              -- Quoting/parenthesizing made simple.
    'tpope/vim-unimpaired';            -- Bracket mappings.
    'unblevable/quick-scope';          -- Hightlight f, F, t, T.
}

-------------------- MAPPINGS ------------------------------

options = { noremap = true }

-- Map the leader key.
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

-- Exit to normal mode.
map('i', 'fd', '<esc>', options)
map('v', 'fd', '<esc>', options)

-- Paste last yank, make Y consistent with C and D.
map('n', 'Y', 'y$', options)

-- Stop cursor jumping when joining lines.
map('n', 'J', 'mzJ`z', options)

-- Move between editor lines rather than actual lines.
map('v', 'j', 'gj', options)
map('v', 'k', 'gk', options)
map('v', '$', 'g$', options)
map('v', '^', 'g^', options)
map('v', '0', 'g0', options)
map('n', 'j', 'gj', options)
map('n', 'k', 'gk', options)
map('n', '$', 'g$', options)
map('n', '^', 'g^', options)
map('n', '0', 'g0', options)

-- Reverse mappings for above.
map('v', 'gj', 'j', options)
map('v', 'gk', 'k', options)
map('v', 'g$', '$', options)
map('v', 'g^', '^', options)
map('v', 'g0', '0', options)
map('n', 'gj', 'j', options)
map('n', 'gk', 'k', options)
map('n', 'g$', '$', options)
map('n', 'g^', '^', options)
map('n', 'g0', '0', options)
