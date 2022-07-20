/decl/webhook/ooc
	id = WEBHOOK_OOC

/decl/webhook/ooc/get_message(var/list/data)
	. = ..()
	var/oocsend = data && data["text"]
	var/desc = replacetext(oocsend,"@","＠")
	.["embeds"] = list(list(
		"content" = desc
	))
