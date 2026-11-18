---@module 'luassert'

local format = dofile("sk/cli/claude.lua").format

describe("claude format", function()
  local cases = {
    { "@a.lua :L5", "@a.lua#L5" },
    { "@a.lua :L5-L9", "@a.lua#L5-9" },
    { "@a.lua :L5:C3", "@a.lua#L5 :C3" },
    { "@a.lua :L5:C3-C8", "@a.lua#L5" },
    { "@a.lua :L5:C3-L9:C2", "@a.lua#L5-9" },
  }
  for _, case in ipairs(cases) do
    it(case[1], function()
      assert.are.same(case[2], format({ { { case[1] } } }))
    end)
  end
end)
