/decl/webhook/roundend
	id = WEBHOOK_ROUNDEND

// Data expects three numerical fields: "survivors", "escaped", "ghosts"
/decl/webhook/roundend/get_message(var/list/data)
	. = ..()
	var/desc = "Раунд **[SSticker.mode ? SSticker.mode.name : "Секрет"]** закончен.\n"
	if(data)

		if(data["surviving_total"] > 0)

			var/s_was =      "всего"
			var/s_survivor = "выжило"

			if(data["surviving_total"] != 1)
				s_was = "всего"
				s_survivor = "выжило"

			desc += "Тут [s_was] **[data["surviving_total"]] [s_survivor] ([data["escaped_total"]] эвакуировалось)** и **[data["ghosts"]] призраков.**"
		else
			desc += "всего **0 выжило** ([data["ghosts"]] призраков)."

	.["embeds"] = list(list(
		"title" = "Раунд [game_id] окончен.",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
