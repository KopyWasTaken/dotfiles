return {
  -- Staus line written in lua, it's that cool information at the bottom of the page
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox"
      }
    })
  end
}
