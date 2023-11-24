local status, alpha = pcall(require, "alpha")
if not status then
	return
end

local dashboard = require("alpha.themes.dashboard")

local art = [[
]]

local logo = [[



███████╗███╗   ███╗ █████╗  ██████╗███████╗
██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝
█████╗  ██╔████╔██║███████║██║     ███████╗
██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║
███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║
╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝
]]

local function getTime()
	local tableTime = os.date("*t")
	local apm = "Err"
	local hour = tableTime.hour
	if hour >= 12 then
		apm = "PM "
		hour = hour % 12
	else
		apm = "AM "
	end

	local datetime = "  "
		.. tableTime.year
		.. "-"
		.. tableTime.month
		.. "-"
		.. tableTime.day
		.. "   "
		.. apm
		.. hour
		.. ":"
		.. tableTime.min
		.. ":"
		.. tableTime.sec
	local hour = tableTime.hour
	local timeTable = {
		[0] = " Error",
		[1] = " Morning",
		[2] = " Noon",
		[3] = " Midday",
		[4] = " Afternoon",
		[5] = " Evening",
		[6] = " Night",
		[7] = " MidNight",
	}
	local timeIndex = 0
	if hour > 3 and hour < 11 then
		timeIndex = 1
	elseif hour == 12 then
		timeIndex = 2
	elseif hour < 14 then
		timeIndex = 3
	elseif hour < 18 then
		timeIndex = 4
	elseif hour < 23 then
		timeIndex = 7
	end
	return datetime .. "  " .. timeTable[timeIndex]
end

local time = getTime()

dashboard.section.header.val = vim.split(logo .. "\n" .. time .. "\n" .. art, "\n")

--    [[                                   ]],
--    [[          ▀████▀▄▄              ▄█ ]],
--    [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
--    [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
--    [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
--    [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
--    [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
--    [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
--    [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
--    [[   █   █  █      ▄▄           ▄▀   ]],

dashboard.section.buttons.val = {
	dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles<CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep<CR>"),
	dashboard.button("b", "  Jump to bookmarks", ":Telescope live_grep<CR>"),
	dashboard.button("c", "  Configuration", ":e C:/Users/yum/AppData/Local/nvim/init.lua<CR>"),
}
dashboard.section.buttons.opts = { spacing = 1 }

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
