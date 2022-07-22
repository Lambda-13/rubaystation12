/datum/map/torch
	emergency_shuttle_docked_message = "Всему персоналу: Эвакуационные поды готовы к прыжку, у вас есть %ETD%."
	emergency_shuttle_leaving_dock = "Всему персоналу: Эвакуационные поды отправлены к месту сбора, примерное время прибытия %ETA%."

	emergency_shuttle_called_message = "Всему персоналу: Запущена процедура эвакуации, через %ETA% поды станут доступны для эвакуации."
	emergency_shuttle_called_sound = sound('sound/AI/torch/abandonship.ogg', volume = 45)

	emergency_shuttle_recall_message = "Всему персоналу: Эвакуация отменена, экипажу вернуться к своим делам."

	command_report_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45)

	grid_check_message = "Аномальная активность обнаружена в сети %STATION_NAME%'. Подача энергии приостановлена на неопределённый промежуток."
	grid_check_sound = sound('sound/AI/torch/poweroff.ogg', volume = 45)

	grid_restored_message = "Энергия на %STATION_NAME% будет скоро восстановлена."
	grid_restored_sound = sound('sound/AI/torch/poweron.ogg', volume = 45)

	meteor_detected_sound = sound('sound/AI/torch/meteors.ogg', volume = 45)

	radiation_detected_message = "Высокий уровень радиации обнаружен около %STATION_NAME%. Технические туннели или специальные комнаты защитят от радиационного фона."
	radiation_detected_sound = sound('sound/AI/torch/radiation.ogg', volume = 45)

	space_time_anomaly_sound = sound('sound/AI/torch/spanomalies.ogg', volume = 45)

	unknown_biological_entities_message = "Неопознаные существа обнаружены вблизи %STATION_NAME%."

	unidentified_lifesigns_message = "Неизвестная форма жизни обнаружена на борту. Рекомендуется заварить все входы и выходы, вентиляционные шахты а так-же держаться вблизи друг от друга."
	unidentified_lifesigns_sound = sound('sound/AI/torch/aliens.ogg', volume = 45)

	lifesign_spawn_sound = sound('sound/AI/torch/aliens.ogg', volume = 45)

	electrical_storm_moderate_sound = sound('sound/AI/torch/electricalstormmoderate.ogg', volume = 45)
	electrical_storm_major_sound = sound('sound/AI/torch/electricalstormmajor.ogg', volume = 45)

/datum/map/torch/level_x_biohazard_sound(var/bio_level)
	switch(bio_level)
		if(7)
			return sound('sound/AI/torch/outbreak7.ogg', volume = 45)
		else
			return sound('sound/AI/torch/outbreak5.ogg', volume = 45)
