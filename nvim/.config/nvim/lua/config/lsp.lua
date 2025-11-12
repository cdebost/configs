local M = {}

local function setup_cmp()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  luasnip.config.setup({})

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
    }, {
      { name = "path" },
      { name = "buffer" },
    }),
  })
end

local function setup_lsp_defaults()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  vim.lsp.config("*", {
    capabilities = capabilities,
  })

  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  })
end

local function setup_lsp_keymaps()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
    callback = function(event)
      local bufnr = event.buf
    local map = function(keys, fn, desc)
      vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = desc })
    end

    map("<leader>r", vim.lsp.buf.rename, "LSP Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "LSP Code Action")
    map("<leader>dl", vim.diagnostic.open_float, "Line Diagnostics")
    end,
  })
end

function M.setup()
  setup_cmp()
  setup_lsp_defaults()
  setup_lsp_keymaps()
end

return M
