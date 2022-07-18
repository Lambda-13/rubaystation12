/decl/webhook/custom_event
	id = WEBHOOK_CUSTOM_EVENT

// Data expects a "text" field containing the new custom event text.
/decl/webhook/custom_event/get_message(var/list/data)
	. = ..()
	.["embeds"] = list(list(
		"title" = "Событие начато.",
		"description" = (data && data["text"]) || "Неизвестно",
		"color" = COLOR_WEBHOOK_DEFAULT
	))
