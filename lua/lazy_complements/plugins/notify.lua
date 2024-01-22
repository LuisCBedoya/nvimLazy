return {
  'rcarriga/nvim-notify',
  event = 'UIEnter',
  opts = {
    timeout = 3000,
    max_height = 10,
    max_width = 90,
    background_colour = '#000000',
    render = 'default',
    stages = 'slide',
    fps = 60,
  },
  config = function(_, opts)
    local notify = require('notify')
    notify.setup({ opts })
    -- vim.notify = notify.notify

    local function is_empty(s)
      return s == nil or s == ''
    end

    local function split_length(text, length)
      local lines = {}
      local next_line
      while true do
        if #text == 0 then
          return lines
        end
        next_line, text = text:sub(1, length), text:sub(length + 1)
        lines[#lines + 1] = next_line
      end
    end

    local function wrap_string(text, max_length)
      local lines = {}
      local next_line = ''
      local words = vim.split(text, ' ')

      for i = 1, #words do
        local next_word = words[i]

        if #next_word > max_length then
          -- if the current word is really long

          -- split the word into multiple lines
          local split_word = split_length(next_word, max_length)
          for _, part in ipairs(split_word) do
            -- add each part to the total table of lines
            table.insert(lines, part)
          end

          -- let the last part be open to concatenation
          lines[#lines] = nil
          next_word = split_word[#split_word]
        end

        if not is_empty(next_line) then
          -- add a space if the current working line already has text
          next_line = next_line .. ' '
        end
        next_line = next_line .. next_word

        if not words[i + 1] or #next_line + #words[i + 1] > max_length then
          -- if adding the next word to the current
          -- working line makes it too long

          -- end the current line
          lines[#lines + 1] = next_line
          next_line = ''
        end
      end

      return lines
    end

    -- -- https://github.com/rcarriga/nvim-notify/issues/129#issuecomment-1245025162
    vim.notify = function(msg, level, notif_opts)
      if type(msg) == 'string' then
        msg = vim.split(msg, '\n')
      end

      local wrapped = {}
      for _, line in ipairs(msg) do
        local new_lines = wrap_string(line, opts.max_width)
        for _, l in ipairs(new_lines) do
          wrapped[#wrapped + 1] = l
        end
      end
      return require('notify')(wrapped, level, notif_opts)
    end
  end,
}
