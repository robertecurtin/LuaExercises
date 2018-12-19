local function CalculatePossibleDimensions(gift)
  local dimensions = {}
  for i = 1, 3 do
    dimensions[i] = {}
    dimensions[i][1] = gift[i]
    local v = 0
    for j = 1, 3 do
      if i ~= j then
        v = v + gift[j] * 2
      end
      dimensions[i][2] = v
    end
  end
  return dimensions
end

function WrapPresents(gift1, gift2, paperWidth)
  local dimensions1 = CalculatePossibleDimensions(gift1)
  local dimensions2 = CalculatePossibleDimensions(gift2)

  local min = math.huge

  for _, d1 in ipairs(dimensions1) do
    for _, d2 in ipairs(dimensions2) do

      for i1 = 1, 2 do
        local j1 = i1 == 1 and 2 or 1
        local x1 = d1[i1]
        local y1 = d1[j1]

        for i2 = 1, 2 do
          local j2 = i2 == 1 and 2 or 1
          local x2 = d2[i2]
          local y2 = d2[j2]
          if x1 + x2 <= paperWidth then
            min = math.min(min, math.max(y1, y2))
          elseif x1 <= paperWidth and x2 <= paperWidth then
            min = math.min(min, y1 + y2)
          end
        end
      end
    end
  end

  return min
end

print(WrapPresents(
{1, 4, 8},
{1, 1, 1},
10
))
