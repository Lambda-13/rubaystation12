/decl/webhook/roundstart
	id = WEBHOOK_ROUNDSTART

// Data expects a "url" field pointing to the current hosted server and port to connect on.
/decl/webhook/roundstart/get_message(var/list/data)
	. = ..()
	var/desc = "Новый раунд начинается"
	if(data && data["url"])
		desc += ". Ссылка: [data["url"]]"
	desc += "."

	.["embeds"] = list(list(
		"title" = "Начинается новый раунд.",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
