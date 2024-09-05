if Shared.Inventory == 'qb' then
	function Airdrop:CreateQBStash(id, rewards)
		local stashTable = {}
		for k, v in pairs(rewards) do
			local itemInfo = QBCore.Shared.Items[v.item:lower()]
			if not itemInfo then print("^5Debug^7: ^3MakeStash ^7- ^2Can't find item ^7'^6"..v.item.."^7'")
			elseif itemInfo then
				stashTable[k] = {
					name = itemInfo["name"],
					amount = v.count,
					info = v.info or {},
					label = itemInfo["label"],
					description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
					weight = itemInfo["weight"],
					type = itemInfo["type"],
					unique = itemInfo["unique"],
					useable = itemInfo["useable"],
					image = itemInfo["image"],
					created = itemInfo["created"],
					slot = k,
				}
			end
		end
		MySQL.insert('INSERT INTO stashitems (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
			['stash'] = id,
			['items'] = json.encode(stashTable)
		})
		return id
	end
end