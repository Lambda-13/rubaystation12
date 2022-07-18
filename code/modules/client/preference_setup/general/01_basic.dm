/datum/preferences
	var/age = 30						//age of character
	var/spawnpoint = "Default" 			//where this character will spawn (0-2).
	var/metadata = ""
	var/real_name						//our character's name

/datum/category_item/player_setup_item/physical/basic
	name = "Основное"
	sort_order = 1

/datum/category_item/player_setup_item/physical/basic/load_character(datum/pref_record_reader/R)
	pref.spawnpoint = R.read("spawnpoint")
	pref.metadata = R.read("OOC_Notes")
	pref.real_name = R.read("real_name")

/datum/category_item/player_setup_item/physical/basic/save_character(datum/pref_record_writer/W)
	W.write("spawnpoint", pref.spawnpoint)
	W.write("OOC_Notes", pref.metadata)
	W.write("real_name", pref.real_name)

/datum/category_item/player_setup_item/physical/basic/sanitize_character()
	pref.spawnpoint         = sanitize_inlist(pref.spawnpoint, spawntypes(), initial(pref.spawnpoint))
	// This is a bit noodly. If pref.cultural_info[TAG_CULTURE] is null, then we haven't finished loading/sanitizing, which means we might purge
	// numbers or w/e from someone's name by comparing them to the map default. So we just don't bother sanitizing at this point otherwise.
	if(pref.cultural_info[TAG_CULTURE])
		var/decl/cultural_info/check = SSculture.get_culture(pref.cultural_info[TAG_CULTURE])
		if(check)
			pref.real_name = check.sanitize_name(pref.real_name, pref.species)
			if(!pref.real_name)
				pref.real_name = random_name(pref.gender, pref.species)


/datum/category_item/player_setup_item/physical/basic/content()
	. = list()
	//. += "[TBTN("spawnpoint", pref.spawnpoint, "Spawn Point")]<br />"
	. += "[TBTN("rename", pref.real_name, "Имя")] [BTN("random_name", "Рандом")]"
	. = jointext(., null)


/datum/category_item/player_setup_item/physical/basic/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["rename"])
		var/raw_name = input(user, "Введите имя вашего персонажа:", "Имя персонажа")  as text|null
		if (!isnull(raw_name) && CanUseTopic(user))

			var/decl/cultural_info/check = SSculture.get_culture(pref.cultural_info[TAG_CULTURE])
			var/new_name = check.sanitize_name(raw_name, pref.species)
			if(new_name)
				pref.real_name = new_name
				return TOPIC_REFRESH
			else
				to_chat(user, "<span class='warning'>Ваше имя должно быть от 2 до [MAX_NAME_LEN] символов длиной а так-же в нём должны быть использованы A-Z, a-z, -, ' и . символы.</span>")
				return TOPIC_NOACTION

	else if(href_list["random_name"])
		pref.real_name = random_name(pref.gender, pref.species)
		return TOPIC_REFRESH

	else if(href_list["spawnpoint"])
		var/list/spawnkeys = list()
		for(var/spawntype in spawntypes())
			spawnkeys += spawntype
		var/choice = input(user, "Где бы вы хотели появиться после начала раунда?") as null|anything in spawnkeys
		if(!choice || !spawntypes()[choice] || !CanUseTopic(user))	return TOPIC_NOACTION
		pref.spawnpoint = choice
		return TOPIC_REFRESH

	return ..()
