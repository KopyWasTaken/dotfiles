return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "echasnovski/mini.diff",
        },
        opts = {
            strategies = {
                chat = {
                    name = "copilot",
                    model = "gpt-4.1",
                },
                inline = {
                    keymaps = {
                        accept_change = {
                            modes = { n = "ga" },
                            description = "Accept the suggested change",
                        },
                        reject_change = {
                            modes = { n = "gr" },
                            opts = { nowait = true },
                            description = "Reject the suggested change",
                        },
                    },
                },
            },
            display = {
                action_pallete = {
                    provider = "telescope",
                },
                chat = {
                    window = {
                        position = "right",
                    },
                    icons = {
                        context = "📎️ ",
                    },
                    fold_context = true,
                },
            },
        },
    },
}
