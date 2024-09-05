Utils.Webhook = {}

function Utils.Webhook.sendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "https://discord.com/api/webhooks/1269286251903582208/_7yNlnXXGPeWF7zafpryqKeOZ4qXMJQCuk1iVt8LgT6Zn0wd4wf0X_zCQHOn8WbCAooY" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end