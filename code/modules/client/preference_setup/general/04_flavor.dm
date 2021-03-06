/datum/preferences
	var/list/flavor_texts        = list()
	var/list/flavour_texts_robot = list()

/datum/category_item/player_setup_item/physical/flavor
	name = "Описание"
	sort_order = 4

/datum/category_item/player_setup_item/physical/flavor/load_character(datum/pref_record_reader/R)
	pref.flavor_texts["general"] = R.read("flavor_texts_general")
	pref.flavor_texts["head"] = R.read("flavor_texts_head")
	pref.flavor_texts["face"] = R.read("flavor_texts_face")
	pref.flavor_texts["eyes"] = R.read("flavor_texts_eyes")
	pref.flavor_texts["torso"] = R.read("flavor_texts_torso")
	pref.flavor_texts["arms"] = R.read("flavor_texts_arms")
	pref.flavor_texts["hands"] = R.read("flavor_texts_hands")
	pref.flavor_texts["legs"] = R.read("flavor_texts_legs")
	pref.flavor_texts["feet"] = R.read("flavor_texts_feet")

	//Flavour text for robots.
	pref.flavour_texts_robot["Default"] = R.read("flavour_texts_robot_Default")
	for(var/module in SSrobots.all_module_names)
		pref.flavour_texts_robot[module] = R.read("flavour_texts_robot_[module]")

/datum/category_item/player_setup_item/physical/flavor/save_character(datum/pref_record_writer/W)
	W.write("flavor_texts_general", pref.flavor_texts["general"])
	W.write("flavor_texts_head", pref.flavor_texts["head"])
	W.write("flavor_texts_face", pref.flavor_texts["face"])
	W.write("flavor_texts_eyes", pref.flavor_texts["eyes"])
	W.write("flavor_texts_torso", pref.flavor_texts["torso"])
	W.write("flavor_texts_arms", pref.flavor_texts["arms"])
	W.write("flavor_texts_hands", pref.flavor_texts["hands"])
	W.write("flavor_texts_legs", pref.flavor_texts["legs"])
	W.write("flavor_texts_feet", pref.flavor_texts["feet"])

	W.write("flavour_texts_robot_Default", pref.flavour_texts_robot["Default"])
	for(var/module in SSrobots.all_module_names)
		W.write("flavour_texts_robot_[module]", pref.flavour_texts_robot[module])

/datum/category_item/player_setup_item/physical/flavor/sanitize_character()
	if(!istype(pref.flavor_texts))        pref.flavor_texts = list()
	if(!istype(pref.flavour_texts_robot)) pref.flavour_texts_robot = list()

/datum/category_item/player_setup_item/physical/flavor/content(var/mob/user)
	. += "<b>Flavor:</b><br>"
	. += "<a href='?src=\ref[src];flavor_text=open'>Изменить описание персонажа</a><br/>"
	. += "<a href='?src=\ref[src];flavour_text_robot=open'>Изменить описание киборга</a><br/>"

/datum/category_item/player_setup_item/physical/flavor/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["flavor_text"])
		switch(href_list["flavor_text"])
			if("open")
			if("general")
				var/msg = sanitize(input(usr,"Дайте общую характеристику своему характеру. Это будет видно независимо от одежды. Не включайте сюда информацию об ООС.","Описание",html_decode(pref.flavor_texts[href_list["flavor_text"]])) as message, extra = 0)
				if(CanUseTopic(user))
					pref.flavor_texts[href_list["flavor_text"]] = msg
			else
				var/msg = sanitize(input(usr,"Установите описание для вашего [href_list["flavor_text"]].","Текст",html_decode(pref.flavor_texts[href_list["flavor_text"]])) as message, extra = 0)
				if(CanUseTopic(user))
					pref.flavor_texts[href_list["flavor_text"]] = msg
		SetFlavorText(user)
		return TOPIC_HANDLED

	else if(href_list["flavour_text_robot"])
		switch(href_list["flavour_text_robot"])
			if("open")
			if("Default")
				var/msg = sanitize(input(usr,"Установите описание по умолчанию для вашего киборга. Описание будет использоваться для любого модуля без индивидуальной настройки.","Текст",html_decode(pref.flavour_texts_robot["Default"])) as message, extra = 0)
				if(CanUseTopic(user))
					pref.flavour_texts_robot[href_list["flavour_text_robot"]] = msg
			else
				var/msg = sanitize(input(usr,"Установите описание для вашего киборга с помощью [href_list["flavour_text_robot"]] модуль. Если вы оставите это поле пустым, для этого модуля будет использоваться текст по умолчанию.","Текст",html_decode(pref.flavour_texts_robot[href_list["flavour_text_robot"]])) as message, extra = 0)
				if(CanUseTopic(user))
					pref.flavour_texts_robot[href_list["flavour_text_robot"]] = msg
		SetFlavourTextRobot(user)
		return TOPIC_HANDLED

	return ..()

/datum/category_item/player_setup_item/physical/flavor/proc/SetFlavorText(mob/user)
	var/HTML = "<body><meta charset='utf-8'>"
	HTML += "<tt><center>"
	HTML += "<b>Set Flavour Text</b> <hr />"
	HTML += "<br></center>"
	HTML += "<a href='?src=\ref[src];flavor_text=general'>General:</a> "
	HTML += TextPreview(pref.flavor_texts["general"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];flavor_text=head'>Head:</a> "
	HTML += TextPreview(pref.flavor_texts["head"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];flavor_text=face'>Face:</a> "
	HTML += TextPreview(pref.flavor_texts["face"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];flavor_text=eyes'>Eyes:</a> "
	HTML += TextPreview(pref.flavor_texts["eyes"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];flavor_text=torso'>Body:</a> "
	HTML += TextPreview(pref.flavor_texts["torso"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];flavor_text=arms'>Arms:</a> "
	HTML += TextPreview(pref.flavor_texts["arms"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];flavor_text=hands'>Hands:</a> "
	HTML += TextPreview(pref.flavor_texts["hands"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];flavor_text=legs'>Legs:</a> "
	HTML += TextPreview(pref.flavor_texts["legs"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];flavor_text=feet'>Feet:</a> "
	HTML += TextPreview(pref.flavor_texts["feet"])
	HTML += "<br>"
	HTML += "<hr />"
	HTML += "<tt>"
	show_browser(user, HTML, "window=flavor_text;size=430x300")
	return

/datum/category_item/player_setup_item/physical/flavor/proc/SetFlavourTextRobot(mob/user)
	var/HTML = "<body><meta charset='utf-8'>"
	HTML += "<tt><center>"
	HTML += "<b>Set Robot Flavour Text</b> <hr />"
	HTML += "<br></center>"
	HTML += "<a href='?src=\ref[src];flavour_text_robot=Default'>Default:</a> "
	HTML += TextPreview(pref.flavour_texts_robot["Default"])
	HTML += "<hr />"
	for(var/module in SSrobots.all_module_names)
		HTML += "<a href='?src=\ref[src];flavour_text_robot=[module]'>[module]:</a> "
		HTML += TextPreview(pref.flavour_texts_robot[module])
		HTML += "<br>"
	HTML += "<hr />"
	HTML += "<tt>"
	show_browser(user, HTML, "window=flavour_text_robot;size=430x300")
	return
