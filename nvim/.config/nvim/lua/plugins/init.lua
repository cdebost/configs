return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "editorconfig/editorconfig-vim",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "plasticboy/vim-markdown",
    ft = { "markdown" },
  },
  {
    "scrooloose/nerdtree",
    cmd = "NERDTreeToggle",
    keys = {
      { "<C-n>", "<cmd>NERDTreeToggle<cr>", desc = "Toggle NERDTree" },
    },
  },
  {
    "itchyny/lightline.vim",
    lazy = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "airblade/vim-gitgutter",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git status (Fugitive)" },
    },
  },
  "nvim-lua/plenary.nvim",
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.4",
    keys = {
      { "<leader>P", function() require("telescope.builtin").find_files() end, desc = "Telescope Find Files" },
      { "<leader>p", function() require("telescope.builtin").git_files() end, desc = "Telescope Git Files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Telescope Live Grep" },
      { "<leader>;", function() require("telescope.builtin").buffers() end, desc = "Telescope Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Telescope Help Tags" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "python", "rust" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  { import = "plugins.lsp" },
}
