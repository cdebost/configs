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

