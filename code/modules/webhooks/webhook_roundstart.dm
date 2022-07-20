/decl/webhook/roundstart
	id = WEBHOOK_ROUNDSTART

// Data expects a "url" field pointing to the current hosted server and port to connect on.
/decl/webhook/roundstart/get_message(var/list/data)
	. = ..()
	var/desc = ""
	if(data && data["url"])
		desc += "Войти: [data["url"]]"
	desc += "."
	desc += "Режим: **[SSticker.mode ? SSticker.mode.name : "Секрет"]**."

	.["embeds"] = list(list(
		"title" = "Начинается новый раунд",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
