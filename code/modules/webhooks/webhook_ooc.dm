/decl/webhook/ooc
	id = WEBHOOK_OOC

/decl/webhook/ooc/get_message(var/list/data)
	. = ..()
	var/oocsend = data && data["text"]
	var/desc = "[oocsend]"

	.["embeds"] = list(list(
		"title" = "Внеигровой чат",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
