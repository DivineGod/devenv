local M = {}

---filter passed to vim.lsp.buf.format
---always selects null-ls if it's available and caches the value per buffer
---@param client table client attached to a buffer
---@return boolean if client matches
function M.format_filter(client)
  local filetype = vim.bo.filetype
  local n = require "null-ls"
  local s = require "null-ls.sources"
  local method = n.methods.FORMATTING
  local available_formatters = s.get_available(filetype, method)

  if #available_formatters > 0 then
    return client.name == "null-ls"
  elseif client.supports_method "textDocument/formatting" then
    return true
  else
    return false
  end
end

---Simple wrapper for vim.lsp.buf.format() to provide defaults
---@param opts table|nil
function M.format(opts)
  opts = opts or {}
  opts.filter = opts.filter or M.format_filter

  return vim.lsp.buf.format(opts)
end

local get_format_on_save_opts = function()
  return {
    ---@usage boolean: format on save (Default: false)
    enabled = true,
    ---@usage pattern string pattern used for the autocommand (Default: '*')
    pattern = "*",
    ---@usage timeout number timeout in ms for the format request (Default: 1000)
    timeout = 1000,
    ---@usage filter func to select client
    filter = M.format_filter,
  }
end

function M.enable_format_on_save()
  local opts = get_format_on_save_opts()
  vim.api.nvim_create_augroup("lsp_format_on_save", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "lsp_format_on_save",
    pattern = opts.pattern,
    callback = function()
      M.format { timeout_ms = opts.timeout, filter = opts.filter }
    end,
  })
end

function M.disable_format_on_save()
  M.clear_augroup "lsp_format_on_save"
end

function M.toggle_format_on_save()
  local exists, autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = "lsp_format_on_save",
    event = "BufWritePre",
  })
  if not exists or #autocmds == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

M.enable_format_on_save()
