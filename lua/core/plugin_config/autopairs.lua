
require("nvim-autopairs").setup{}


-- You can also add custom rules or configurations here if needed
local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

-- Example: Add custom rule for curly braces and parentheses
npairs.add_rules {
  Rule('{', '}')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col, opts.col + 1)
      return pair ~= '{}'
    end)
    :with_move(function(opts)
      return opts.prev_char:match('.%}') ~= nil
    end)
    :use_key('}'),

  Rule('(', ')')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col, opts.col + 1)
      return pair ~= '()'
    end)
    :with_move(function(opts)
      return opts.prev_char:match('.%)') ~= nil
    end)
    :use_key(')')
}
