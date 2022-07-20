/decl/webhook/ooc
	id = WEBHOOK_OOC

/decl/webhook/ooc/get_message(var/list/data)
	. = ..()
	var/oocsend = data && data["text"]
	var/desc = "[oocsend]"

	.["embeds"] = list(list(
		"content" = desc,
		"embeds" = null
	))
