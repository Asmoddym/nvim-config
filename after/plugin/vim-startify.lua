utils = require("telescope._extensions.project.utils")

local projects = {}
for _, project in pairs(utils.get_project_objects()) do
  table.insert(projects, { project.title, "call execute(\"tcd " .. project.path .. "\") | Neotree position=float filesystem" })
end

vim.g.startify_commands = projects

vim.g.startify_lists = {
  { type = "commands",  header = {"   Projects:"} },
  { type = "files",     header = {"   Recent files:"}},
}

vim.g.startify_custom_header_quotes = {{"coucou"}}
