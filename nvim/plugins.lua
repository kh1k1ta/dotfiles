return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      direction = "float", -- 浮遊ウィンドウとして表示
    })
  end,
}
