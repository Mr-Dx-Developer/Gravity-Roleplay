Locations = {

}

--if Gabz locations are enabled, override their coords with these
if Config.Overrides.Gabz247 then
	Locations["247supermarket"]["coords"] = {
		vec4(24.91, -1346.86, 29.5, 268.37),
		vec4(-3039.64, 584.78, 7.91, 21.88),
		vec4(-3242.73, 1000.46, 12.83, 2.08),
		vec4(1728.44, 6415.4, 35.04, 243.26),
		vec4(1697.96, 4923.04, 42.06, 326.61),
		vec4(1960.26, 3740.6, 32.34, 300.45),
		vec4(548.67, 2670.94, 42.16, 101.0),
		vec4(2677.97, 3279.95, 55.24, 325.89),
		vec4(2556.8, 381.27, 108.62, 359.15),
		vec4(373.08, 326.75, 103.57, 253.14),
		vec4(161.2, 6641.74, 31.7, 221.02),
		vec4(812.86, -782.01, 26.17, 270.01),
	}
end
if Config.Overrides.GabzAmmu then
	Locations["ammunation"]["coords"] = {
		vec4(-659.16, -939.79, 21.83, 91.25),
		vec4(812.85, -2155.16, 29.62, 355.85),
		vec4(1698.04, 3757.43, 34.71, 136.69),
		vec4(-326.03, 6081.17, 31.45, 138.33),
		vec4(246.87, -51.3, 69.94, 335.47),
		vec4(18.71, -1108.24, 29.8, 158.71),
		vec4(2564.85, 298.83, 108.74, 283.17),
		vec4(-1112.4, 2697.08, 18.55, 152.96),
		vec4(841.16, -1028.63, 28.19, 294.2),
		vec4(-1310.71, -394.33, 36.7, 340.51),
	}
end
if Config.Overrides.BlackMarket then
	Locations["blackmarket"] = {
		["label"] = "Black Market",
		["type"] = "items",
		["model"] = {
			`mp_f_weed_01`,
			`MP_M_Weed_01`,
			`A_M_Y_MethHead_01`,
			`A_F_Y_RurMeth_01`,
			`A_M_M_RurMeth_01`,
			`MP_F_Meth_01`,
			`MP_M_Meth_01`,
		},
		["coords"] = {
			vec4(776.24, 4184.08, 41.8, 92.12),
			vec4(2482.51, 3722.28, 43.92, 39.98),
			vec4(462.67, -1789.16, 28.59, 317.53),
			vec4(-115.15, 6369.07, 31.52, 232.08),
			vec4(752.52, -3198.33, 6.07, 301.72)
		},
		["products"] = Products["blackmarket"],
		["hideblip"] = true,
	}
end

if Config.Overrides.VendOverride then
	Locations["vendingmachine"] = {
		["label"] = "Vending Machine",
		["targetIcon"] = "fas fa-calculator",
		["targetLabel"] = "Vending Machine",
		["type"] = "items",
		["logo"] = "https://static.wikia.nocookie.net/gtawiki/images/d/d4/Ecola-GTAO-LSTunersBanner.png",
		["model"] = { -- You can add more models to this, but these make the most sense for the vending machine stuff
			`prop_vend_soda_01`,
			`prop_vend_soda_02`,
			`prop_vend_snak_01`,
			`prop_vend_snak_01_tu`
		},
		["coords"] = { -- If you want to place custom vending machine locations
			vec4(131.13, -3007.16, 7.04, 0.0), -- GABZ LS Tuners
		},
		["products"] = Products["vending"],
	}
end