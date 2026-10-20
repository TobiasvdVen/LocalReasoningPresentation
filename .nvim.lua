local project_actions = require("project_actions")

local build = {
        name = "build",
        builder = function(params)
                return {
                        cmd = { "dotnet", "build" },
                        name = "build",
                }
        end,
        desc = "Build",
}

local test = {
        name = "test",
        builder = function(params)
                return {
                        cmd = { "dotnet", "test" },
                        name = "test",
                        }
                end,
                desc = "Test",
}

local actions = {
        { key = "b", task = build },
        { key = "t", task = test }
}

project_actions.register(actions)
