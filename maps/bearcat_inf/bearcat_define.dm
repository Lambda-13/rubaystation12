/datum/map/bearcat
	name = "Биркет 2.0"
	full_name = "ФТВ Биркет 2.0"
	path = "bearcat_ru"

	station_name  = "ФТВ Биркет 2.0"
	station_short = "Bearcat"

	dock_name     = "ФНС Лямбда"
	boss_name     = "ФТУ Нексус"
	boss_short    = "Нексус"
	company_name  = "Своя Доставка"
	company_short = "СД"
	overmap_event_areas = 11

	player_levels = list(1,2,3)
	admin_levels = list(4)

	evac_controller_type = /datum/evacuation_controller/lifepods //don't remove
	evac_controller_type = /datum/evacuation_controller/starship //don't remove
	lobby_screens = list("spess","aesthetic")

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"
	use_overmap = 1
	num_exoplanets = 1
	away_site_budget = 4

//	minimum_players = 0 its already 0

	welcome_sound = 'sound/effects/cowboysting.ogg'

	map_admin_faxes = list("ФТУ Нексус")

	starting_money = 50000
	department_money = 0
	salary_modifier = 0.2

/datum/map/bearcat/get_map_info()
	. = list()
	. +=  "Вы находитесь на " + replacetext("<b>[station_name]</b>", "\improper", "") + ", звездолете свободной от корпораций. Его основную миссию задаст капитан или его заместитель."
	. +=  "Судно укомплектовано наёмным персоналом любой расы."
	. +=  "Эта область космоса неизведана, вдали от территории SCG. Вы можете столкнуться с удаленными аванпостами или дрейфующими скитальцами, но ни одно официально признанное правительство не претендует на этот сектор."
	return jointext(., "<br>")

/datum/map/bearcat/send_welcome()
	var/obj/effect/overmap/visitable/ship/torch = SSshuttle.ship_by_type(/obj/effect/overmap/visitable/ship/torch)

	var/welcome_text = "<center><img src = sollogo.png /><br /><font size = 3><b>ФТВ Биркет</b> Показания датчика:</font><br>"
	welcome_text += "Отчет создан [stationdate2text()] в [stationtime2text()]</center><br /><br />"
	welcome_text += "<hr>Текущая система:<br /><b>[torch ? system_name : "Неизвестно"]</b><br /><br>"

	if (torch) //If the overmap is disabled, it's possible for there to be no torch.
		var/list/space_things = list()
		welcome_text += "Текущие координаты:<br /><b>[torch.x]:[torch.y]</b><br /><br>"
		welcome_text += "Следующая система нацелена на прыжок:<br /><b>[generate_system_name()]</b><br /><br>"
		welcome_text += "Время в пути до Солнечной Системы:<br /><b>[rand(50,150)] дней</b><br /><br>"
		welcome_text += "Время с момента последнего посещения порта:<br /><b>[rand(120,240)] дней</b><br /><hr>"
		welcome_text += "Результаты сканирования показывают следующие интересные места:<br />"

		for(var/zlevel in map_sectors)
			var/obj/effect/overmap/visitable/O = map_sectors[zlevel]
			if(O.name == torch.name)
				continue
			if(istype(O, /obj/effect/overmap/visitable/ship/landable)) //Don't show shuttles
				continue
			if (O.hide_from_reports)
				continue
			space_things |= O

		for(var/obj/effect/overmap/visitable/O in space_things)
			var/location_desc = " на данный момент координаты."
			if(O.loc != torch.loc)
				var/bearing = round(90 - Atan2(O.x - torch.x, O.y - torch.y),5) //fucking triangles how do they work
				if(bearing < 0)
					bearing += 360
				location_desc = ", азимут [bearing]."
			welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

		welcome_text += "<hr>"

	post_comm_message("Показания датчика ФТВ Биркет", welcome_text)
	minor_announcement.Announce(message = "Новое Обновление [GLOB.using_map.company_name] доступно на всех коммуникационных консолях.")


/datum/map/bearcat/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))
