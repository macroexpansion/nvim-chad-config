-- Dynamic workspace folders for Augment
M = {
  setup_augment_workspace = function()
    local cwd = vim.fn.getcwd()
    local folders = {}

    table.insert(folders, cwd)

    vim.g.augment_workspace_folders = folders
  end,

  add_git_folder_to_workspace = function(folder_path)
    local path = folder_path or vim.fn.getcwd()
    local git_dir = path .. "/.git"

    -- Check if .git directory exists
    if vim.fn.isdirectory(git_dir) == 1 then
      -- Initialize workspace folders if not already set
      if not vim.g.augment_workspace_folders then
        vim.g.augment_workspace_folders = {}
      end

      -- Check if folder is already in the workspace
      local already_added = false
      for _, folder in ipairs(vim.g.augment_workspace_folders) do
        if folder == path then
          already_added = true
          break
        end
      end

      -- Add folder if not already in workspace
      if not already_added then
        table.insert(vim.g.augment_workspace_folders, path)
        print("Added git repository to Augment workspace: " .. path)
      end

      return true
    else
      print("No .git directory found in: " .. path)
      return false
    end
  end,
}

return M
