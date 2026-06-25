local M = {}

-- Arts database (array)
M.arts = {
    {

                             /.   |                             .-""-.__
                             'J'            _.--"""--._____.-'        `-._
                             `-''          .-'                              `.
                                         .'                        _.._       `.
                                /                       J""    `-.      \
                                       /                         \        `-.    `.
                                     .'          |               F           \     \
                                     F           |              /             `.    \
                               _.---<_           J             J                `-._/
                             ./`.     `.          \          J F
                          __/ F  )                 \          \
                        <     |                \    >.         L
                         `-.                    |  J  `-.      )
         VK                J         |          | /      `-    F
                            \  o     /         (|/        //  /
                             `.    )'.          |        /'  /
                              `---'`\ `.        |        /  /
                              '|\\ \ `. `.      |       /( /
                                 `` `  \  \     |       \_'
                                        L  L    |     .' /
                                        |  |    |    (_.'
                                        J  J    F
                                        J  J   J
                                        J  J   J                                 .--.
                                        J  J   F                                J    L
                                        |  |  J                                 |    |
                                        |  F  F 
    },
--[[    {
        "  ╱|、",
        "(｡◕ ‿ ◕｡)",
        "  |、~〵",
        "  じしˍ,)ノ",
    },]]
}

-- Get random art
function M.get_random()
    local index = math.random(1, #M.arts)
    return M.arts[index]
end

return M
