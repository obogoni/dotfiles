-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins =
{
  { "hoffs/omnisharp-extended-lsp.nvim" }
}

vim.opt.relativenumber = true;
vim.opt.wrap = true;

lvim.format_on_save.enabled = true;

-- add `csharp_ls` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "csharp_ls" })
-- remove `omnisharp` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "omnisharp"
end, lvim.lsp.automatic_configuration.skipped_servers)


-- LSP keybindings with omnisharp_extended
lvim.lsp.buffer_mappings.normal_mode = {
  -- Enhanced go to definition with decompiled source support
  ["<leader>lgd"] = {
    function()
      require('omnisharp_extended').lsp_definition()
    end,
    "Go to definition"
  },

  -- Enhanced type definition
  ["<leader>lt"] = {
    function()
      require('omnisharp_extended').lsp_type_definition()
    end,
    "Type definition"
  },

  -- Enhanced find references with Telescope
  ["gr"] = {
    function()
      require('omnisharp_extended').lsp_references()
    end,
    "Go to references"
  },

  -- Enhanced go to implementation
  ["gi"] = {
    function()
      require('omnisharp_extended').lsp_implementation()
    end,
    "Go to implementation"
  },
}
