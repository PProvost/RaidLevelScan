local myname, ns = ...

-- Checks the headslot of "unit".
-- Assumes that NotifyInspect has been called if required
function ns.CheckHeadslot(unit)
	if not CanInspect(unit) then return end

	local slot = GetInventorySlotInfo(unit, "HEADSLOT")
	local link = GetInventoryItemLink(unit, slot)
	local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(link)

	local raidLevel = 0


end
