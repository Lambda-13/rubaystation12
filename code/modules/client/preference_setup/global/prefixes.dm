/decl/prefix
	var/name
	var/default_key
	var/is_locked = FALSE

/decl/prefix/language
	name = "Языки"
	default_key = ","

/decl/prefix/radio_channel_selection
	name = "Радиоканалы, выбор канала"
	default_key = ":"
	is_locked = TRUE

/decl/prefix/radio_main_channel
	name = "Радиоканалы, общий канал"
	default_key = ";"

/decl/prefix/audible_emote
	name = "Эмоут, слышимый"
	default_key = "!"

/decl/prefix/visible_emote
	name = "Эмоут, видимый"
	default_key = "^"

/decl/prefix/custom_emote
	name = "Эмоут, свой"
	default_key = "/"
