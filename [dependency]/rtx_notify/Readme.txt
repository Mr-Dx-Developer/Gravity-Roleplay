Thank you for purchasing rtx_notify we're grateful for your support. If you'd ever have a question and / or need our help, please reach out to us by sending an email or go ahead and create a ticket on our discord: https://discord.gg/P6KdaDpgAk


Install instructions:
1. Put rtx_notify folder to your resources
2. Configure your config.lua to your preferences
3. Put rtx_notify to the server.cfg

Notify Examples:

Client Side Notify TriggerEvent("rtx_notify:Notify", "Title", "text", time, "type")	
Client Side Notify Function exports["rtx_notify"]:Notify("Title", "text", time, "type")	

Example Client Side Notify TriggerEvent("rtx_notify:Notify", "Info", "This is info notify", 2500, "info") - time 1000 = 1 seconds
Example Client Side Notify exports["rtx_notify"]:Notify("Info", "This is info notify", 2500, "info") - time 1000 = 1 seconds

Server Side Notify TriggerClientEvent("rtx_notify:Notify", source, "Title", "text", time, "type")	

Example Server Side Notify TriggerClientEvent("rtx_notify:Notify", source, "Info", "This is info notify", 2500, "info") - time 1000 = 1 seconds

2. Each product is to be used on a singular server, with the exception of a test server.
3. Any form of redistribution of our content is considered copyright infringement.
4. If any of these rules are broken, legal actions can be taken.
© 2022 RTX Development, all rights reserved.