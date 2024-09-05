--
-- Discord Webhooks
--

Webhooks = {}
Webhooks.TestDrive = "https://discord.com/api/webhooks/1269288218340098163/9hlboUDePDZnOkooMB-Vje8o0Kp3bfu9ZPVfRbV1oJ6ysXmmzv3amyAwY15zz__n53RW"
Webhooks.Purchase = "https://discord.com/api/webhooks/1269288279006515222/v_T8Ig_Viqy30E0444SYC8E8Yg9irl-RGNXN6HDwHMzO3-up0_ypNILqQE4BOqF9F9tw"
Webhooks.Finance = "https://discord.com/api/webhooks/1269288333557895168/Ve-XKbNuOSxyxE1HInQjMTFxUECpxlv0_XlVNlT3peKsEFMRFGX16sYSmscpiZDo-ZXA"
Webhooks.Dealership = "https://discord.com/api/webhooks/1269288428055433236/EVNwswrUNnt07MDxDsopXBjTZUNfkBeC6v-aoUosrqSZgf2cyYzQ19v4lWDmu9tnWsTc"
Webhooks.Admin = "https://discord.com/api/webhooks/1269288477728440412/g2iezEUe0itiFERyGIlidV1c4vtLWMWK6COAi5daEeFy-_sKdHEMcjvpbjDCtfKlDSdF"

--[[
  EXAMPLE WEBHOOK CALL

  sendWebhook(src, Webhooks.Admin, "Webhook Title", "success", {
    { key = "Data fields", value = "Data value" },
    { key = "Data fields 2", value = "Data value 2" }
  })
]]--

function sendWebhook(playerId, webhookUrl, title, type, data)
  if not webhookUrl then return end

  local player = Framework.Server.GetPlayerInfo(playerId)
  if not player then return false end

  local color = 0xff6700
  if type == "success" then color = 0x2ecc71 end
  if type == "danger" then color = 0xe74c3c end

  local fields = {
    {
      name = "Player",
      value = string.format("%s (id: %s)", player.name, tostring(playerId)),
      inline = false
    }
  }
  for _, row in pairs(data) do
    fields[#fields + 1] = {
      name = row.key,
      value = tostring(row.value),
      inline = true
    }
  end

  local body = {
    username = "JG Dealerships Webhook",
    avatar_url = "https://forum.cfx.re/user_avatar/forum.cfx.re/jgscripts/288/3621910_2.png",
    content = "",
    embeds = {
      {
        type = "rich",
        title = title,
        description = "",
        color = color,
        fields = fields
      }
    }
  }

  PerformHttpRequest(
    webhookUrl,
    function(err, text, header) end,
    "POST",
    json.encode(body),
    {["Content-Type"] = "application/json"}
  )
end