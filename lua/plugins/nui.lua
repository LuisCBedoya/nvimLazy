local Popup = require('nui.popup')

local popup = Popup({
  position = '50%',
  size = {
    width = 80,
    height = 40,
  },
  enter = true,
  focusable = true,
  zindex = 50,
  relative = 'editor',
  border = {
    padding = {
      top = 2,
      bottom = 2,
      left = 3,
      right = 3,
    },
    style = 'double',
    text = {
      top = 'Popup Title',
      top_align = 'center',
    },
  },
  buf_options = {
    modifiable = true,
    readonly = false,
  },
  win_options = {
    winblend = 10,
    winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
  },
})
