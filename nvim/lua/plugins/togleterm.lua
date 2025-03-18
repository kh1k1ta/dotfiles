return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-t>]], -- Ctrl + t でターミナル開閉
      direction = "float", -- フロートウィンドウで開く
      persist_mode = true, -- ターミナルの内容を保持する
    })
  end,
}
