--[[
   Copyright 2010 Quaiche and Hauta

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
--]]

local L = setmetatable({}, {__index=function(t,i) return i end})
local defaults, defaultsPC, db, dbpc = {}, {}

-- Debug helper methods
local function Print(...) print("|cFF33FF99RaidLevelScan|r:", ...) end
local debugf = tekDebug and tekDebug:GetFrame("RaidLevelScan")
local function Debug(...) if debugf then debugf:AddMessage(string.join(", ", tostringall(...))) end end

-- The main addon frame
local f = CreateFrame("frame")
f:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end)
f:RegisterEvent("ADDON_LOADED")

function f:ADDON_LOADED(event, addon)
	if addon:lower() ~= "raidlevelscan" then return end

	RaidLevelScanDB, RaidLevelScanDBPC = setmetatable(RaidLevelScanDB or {}, {__index = defaults}), setmetatable(RaidLevelScanDBPC or {}, {__index = defaultsPC})
	db, dbpc = RaidLevelScanDB, RaidLevelScanDBPC

	-- Do anything you need to do after addon has loaded

	LibStub("tekKonfig-AboutPanel").new(nil, "RaidLevelScan") -- Make first arg nil if no parent config panel
	self:UnregisterEvent("ADDON_LOADED")
	self.ADDON_LOADED = nil
	if IsLoggedIn() then self:PLAYER_LOGIN() else self:RegisterEvent("PLAYER_LOGIN") end
end

function f:PLAYER_LOGIN()
	self:RegisterEvent("PLAYER_LOGOUT")

	-- Do anything you need to do after the player has entered the world

	self:UnregisterEvent("PLAYER_LOGIN")
	self.PLAYER_LOGIN = nil
end

function f:PLAYER_LOGOUT()
	for i,v in pairs(defaults) do if db[i] == v then db[i] = nil end end
	for i,v in pairs(defaultsPC) do if dbpc[i] == v then dbpc[i] = nil end end

	-- Do anything you need to do as the player logs out
end

SLASH_RAIDLEVELSCAN1 = "/raidlevelscan"
SLASH_RAIDLEVELSCAN2 = "/rls"
SlashCmdList.RAIDLEVELSCAN = function(msg)
	-- Do crap here
end

local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local dataobj = ldb:GetDataObjectByName("RaidLevelScan") or ldb:NewDataObject("RaidLevelScan", { type = "launcher", icon = "Interface\\Icons\\Spell_Nature_GroundingTotem" })
dataobj.OnClick = SlashCmdList.RAIDLEVELSCAN

