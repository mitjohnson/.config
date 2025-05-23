local M = {}
M.configs_location = vim.fn.stdpath("config") .. "/configs/"

-- Check whether a local formatter/linter configuration file is present in the same directory or upward of a given file
function M.has_local_config(location, config_names)
  for _, name in ipairs(config_names) do
    local found = vim.fs.find(name, { upward = true, path = location })
    if #found > 0 then
      return true
    end
  end
  return false
end

return M
