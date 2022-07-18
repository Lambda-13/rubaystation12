/decl/webhook/ahelp
	id = WEBHOOK_OOC

/decl/webhook/ahelp/get_message(var/list/data)
	. = ..()
	var/ahelp = data && data["text"]
	var/desc = "[ahelp]"

	.["embeds"] = list(list(
		"title" = "Админ помощь",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
