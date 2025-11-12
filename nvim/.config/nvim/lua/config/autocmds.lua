local augroup = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local row = vim.fn.line([['"]])
    local last = vim.fn.line("$")
    if row > 1 and row <= last then
      vim.cmd([[normal! g`"]])
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = { "*.py", "*.pyw", "*.c", "*.h" },
  callback = function()
    vim.cmd([[match BadWhitespace /\s\+$/]])
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = "*.py",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.textwidth = 79
    vim.bo.expandtab = true
    vim.bo.autoindent = true
    vim.bo.fileformat = "unix"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = { "*.yml", "*.html", "*.js" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.autoindent = true
    vim.bo.expandtab = true
  end,
})
