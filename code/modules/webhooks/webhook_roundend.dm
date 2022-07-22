/decl/webhook/roundend
	id = WEBHOOK_ROUNDEND

// Data expects three numerical fields: "survivors", "escaped", "ghosts"
/decl/webhook/roundend/get_message(var/list/data)
	. = ..()
	var/desc = "Раунд **[SSticker.mode ? SSticker.mode.name : "Секрет"]** закончен.\n"
	if(data)

		if(data["surviving_total"] > 0)

			var/s_was =      "Всего выжило"
			var/s_survivor = "игрок(а)"

			if(data["surviving_total"] != 1)
				s_was = "Всего выжило"
				s_survivor = "игрок(а)"

			desc += "[s_was] **[data["surviving_total"]] [s_survivor] ([data["escaped_total"]] эвакуировалось)** и **[data["ghosts"]] призраков.**"
			desc += "[dronecount==0 ? "Всего [dronecount>1 ? "было" : "был"] [dronecount] [dronecount>1 ? "дронов" : "дрон"] в конце раунда." : ""]"
		else
			desc += "всего **0 выжило** ([data["ghosts"]] призраков)."

	.["embeds"] = list(list(
		"title" = "Раунд [game_id] окончен",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
