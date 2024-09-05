local Translations = {
    notify = {
        ["hud_settings_loaded"] = "HUD: Settings loaded...",
 ["hud_restart"] = "HUD: Restarting...",
 ["hud_start"] = "HUD: Load...",
 ["hud_command_info"] = "This command resets your HUD settings!",
 ["load_square_map"] = "Map loading...",
 ["loaded_square_map"] = "Map loaded!",
 ["load_circle_map"] = "Map loading...",
 ["loaded_circle_map"] = "Map loaded!",
 ["cinematic_on"] = "Cinematic mode was on!",
 ["cinematic_off"] = "Cinematic mode was turned off!",
 ["engine_on"] = "You have started the engine.",
 ["engine_off"] = "You have turned off the engine.",
 ["low_fuel"] = "Low fuel!",
 ["access_denied"] = "You have no such right!",
 ["stress_gain"] = "You got stressed!",
 ["stress_removed"] = "Feel more relaxed!"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
