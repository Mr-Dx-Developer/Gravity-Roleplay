Logs = {}

-- General webhook configurations
Logs.Name = '247 Robbery' -- Name for the webhook
Logs.Image = 'https://i.ibb.co/xg69C7Z/ILTkWBh.png' -- Image for the webhook
Logs.Footer = 'https://i.ibb.co/xg69C7Z/ILTkWBh.png' -- Footer image for the webhook

Logs.Types = {
    robbery = {
        enabled = true, -- Enable this log?
        webhook = 'https://discord.com/api/webhooks/1269293562038583449/YhNhScBZoaPjYu5vexhGSgb_j9NqPOesADRcSwH0xevrVgeA7N0955RnGcCwUGV91j5_' -- Webhook link
    },
    cooldown = {
        enabled = true,
        webhook = 'https://discord.com/api/webhooks/1269293631022436382/khFq1UODMU_UuIjA9Qh97R-CTXENbdlp7fbRRVF0AVN_nL0I5W-7qJmq0YaJRPKP413T'
    }
}