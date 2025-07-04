return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.buttons.val = {
            dashboard.button("r", "  [ ] 󱑂  Recent",":Telescope oldfiles <cr>"),
            dashboard.button("f", "  [ ] 󰱼  Find File",":Telescope find_files <cr>"),
            dashboard.button("n", "  [ ]   New File", ":ene <BAR> startinsert <CR>"),
            dashboard.button("q", "  [ ] 󰩈  Quit", ":qa<CR>"),
        }
        dashboard.section.header.val = {
            "⠀⠀⠀⣾⣿⣿⣿⣿⣦⡀⢸⣿⣿⣿⣿⠃⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢸⣿⣿⣿⣿⡄⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⡿⢁⣿⣿⣿⣿⡇⠀⣸⣿⣿⣿⣿⣷⣄⠀⢀⣴⣿⣿⣿⣿⡟",
            "⠀⠀⠀⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠟⠸⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠀⠀⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠇⠘⠿⠿⠿⠿⠇⠀⠀⠀⠰⠿⠿⠿⠿⠿⠟⠀⠸⠿⠿⠿⠿⠀⠀⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠇",
            "⠀⠀⣴⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⠀⢠⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⡆⠀⣰⣶⣶⣶⡶⠀⠀⠀⣶⣶⣶⣶⡆⠀⣶⣶⣶⣶⣶⠀⢀⣶⣶⣶⣶⣶⡶⠀⠀⠀⣶⣶⣶⣶⡆⠀⢰⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⠀",
            "⠀⢰⣿⣿⣿⣿⠉⠻⣿⣿⣿⣿⣿⡟⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⣿⣿⣿⣿⠇⠀⠀⢸⣿⣿⣿⣿⠀⠀⢸⣿⣿⣿⣿⣧⣾⣿⣿⣿⣿⠟⠁⠀⠀⢸⣿⣿⣿⣿⠁⠀⣿⣿⣿⣿⠇⠙⢿⣿⠟⢹⣿⣿⣿⣿⡇⠀",
            "⠀⣾⣿⣿⣿⡟⠀⠀⢸⣿⣿⣿⣿⠃⢠⣿⣿⣿⣿⡿⠉⠉⠉⠉⠉⠉⠀⢸⣿⣿⣿⡿⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⢸⣿⣿⣿⣿⠀⠀⠈⠁⠀⣼⣿⣿⣿⡿⠀⠀",
            "⢠⣿⣿⣿⣿⠁⠀⠀⣿⣿⣿⣿⡿⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢸⣿⣿⣿⣷⣶⣶⣾⣿⣿⣿⡟⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⣸⣿⣿⣿⣿⠁⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⢰⣿⣿⣿⣿⠇⠀⠀",
            "⣼⣿⣿⣿⡏⠀⠀⢸⣿⣿⣿⣿⡇⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡟⠀⢸⣿⣿⣿⣿⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⠀⠀⠀",
            "",
        }
        -- dashboard.section.footer.opts.hl = ""
        require("alpha").setup(dashboard.opts)
    end,
}
