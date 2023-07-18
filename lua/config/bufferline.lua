require("bufferline").setup {
  options = {
    hover = {
      enabled = true,
      delay = 150,
      reveal = { 'close' }
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        highlight = "Directory",
      }
    }
  }
}
