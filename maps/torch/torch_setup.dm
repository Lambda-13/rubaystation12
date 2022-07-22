/datum/map/torch/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/torch/get_map_info()
	. = list()
	. +=  "Вы находитесь на " + replacetext("<b>[station_name]</b>", "\improper", "") + ", звездолете экспедиционного корпуса. Его основная миссия - поиск неоткрытых разумных инопланетных видов и общие исследования по пути."
	. +=  "Судно укомплектовано как государственным персоналом SCG, так и наемными подрядчиками."
	. +=  "Эта область космоса неизведана, вдали от территории SCG. Вы можете столкнуться с удаленными аванпостами или дрейфующими скитальцами, но ни одно официально признанное правительство не претендует на этот сектор."
	return jointext(., "<br>")

/datum/map/torch/send_welcome()
	var/obj/effect/overmap/visitable/ship/torch = SSshuttle.ship_by_type(/obj/effect/overmap/visitable/ship/torch)

	var/welcome_text = "<center><img src = sollogo.png /><br /><font size = 3><b>ГЭК Факел</b> Показания датчика:</font><br>"
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

	post_comm_message("Показания датчика ГЭК Факел", welcome_text)
	minor_announcement.Announce(message = "Новое Обновление [GLOB.using_map.company_name] доступно на всех коммуникационных консолях.")
