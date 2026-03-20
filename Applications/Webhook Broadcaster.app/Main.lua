local GUI = require("GUI")
local JSON = require("JSON")
local internet = require("internet")
local system = require("System")
local localization = system.getCurrentScriptLocalization()

local function SendToWebhook(Content, Name)
	local data = {
		content = Content,
		name = Name,
	}

	local postData = JSON.encode(data)
	local testurl = "https://n8n.gameknigh283.qzz.io/webhook-test/57225b93-bb0f-4f9c-8ae9-35469ff188f3"
	local url = "https://n8n.gameknight283.qzz.io/webhook/57225b93-bb0f-4f9c-8ae9-35469ff188f3"
	local headers = {
		["Content-Type"] = "application/json",
	}

	local success, response = pcall(internet.request, url, postData, headers)
end

local workspace, window, menu = system.addWindow(GUI.filledWindow(1, 1, 60, 30, 0xE1E1E1))

local layout = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))

local layout2 = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 5))

local Label = layout2:addChild(GUI.text(3, 2, 0x000000, "Webhook " .. localization.broadcast))

local DateText = layout2:addChild(GUI.text(1, 1, 0x000000, os.date("%d %b %Y", system.getTime())))

local NameInput =
	layout2:addChild(GUI.input(2, 2, 30, 3, 0xEEEEEE, 0x555555, 0x999999, 0xFFFFFF, 0x2D2D2D, "", "Enter a Name"))

local myInput

myInput = layout:addChild(GUI.input(2, 2, 30, 3, 0xEEEEEE, 0x555555, 0x999999, 0xFFFFFF, 0x2D2D2D, "", "Enter a Text"))

myInput.onInputFinished = function()
	SendToWebhook(myInput.text, NameInput.text)
	myInput.text = ""
end
