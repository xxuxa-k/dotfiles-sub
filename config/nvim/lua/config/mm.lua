vim.api.nvim_create_user_command('Mm', function(opts)
  local title = opts.args
  if title == "" then
    vim.notify("タイトルを指定してください", vim.log.levels.ERROR)
    return
  end

  local memo_dir = os.getenv("HOME") .. "/.memo"
  local memo_path = memo_dir .. "/" .. title .. ".md"

  local dir_exists = vim.fn.isdirectory(memo_dir)
  if dir_exists == 0 then
    vim.fn.mkdir(memo_dir, "p")
  end

  vim.cmd("edit " .. memo_path)
end, {
    nargs = 1,
    desc = "Create or open a memo file",
    complete = function(arg_lead)
      local memo_dir = os.getenv("HOME") .. "/.memo"
      local files = vim.fn.glob(memo_dir .. "/*" .. arg_lead .. "*.md", false, true)

      local completion_list = {}
      for _, file in ipairs(files) do
        local name = vim.fn.fnamemodify(file, ":t:r")
        table.insert(completion_list, name)
      end

      return completion_list
    end
  })

vim.cmd([[command! -nargs=1 -complete=customlist,v:lua.CompleteFunc mm Mm <args>]])
