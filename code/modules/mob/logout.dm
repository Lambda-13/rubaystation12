/mob/Logout()
	SSnano.user_logout(src) // this is used to clean up (remove) this user's Nano UIs
	GLOB.player_list -= src
	log_access("Logout: [key_name(src)]")
	handle_admin_logout()
	if(my_client)
		my_client.screen -= l_general

	RemoveRenderers()

	QDEL_NULL(l_general)
	hide_client_images()
	..()

	my_client = null
	return 1

/mob/proc/handle_admin_logout()
	if(admin_datums[ckey] && GAME_STATE == RUNLEVEL_GAME) //Only report this stuff if we are currently playing.
		var/datum/admins/holder = admin_datums[ckey]
		message_staff("[holder.rank] logout: [key_name(src)]")
		if(!GLOB.admins.len) //Apparently the admin logging out is no longer an admin at this point, so we have to check this towards 0 and not towards 1. Awell.
			send2adminirc("[key_name(src)] вышел - теперь админов нет в игре.")
			SSwebhooks.send(WEBHOOK_AHELP, list("text" = "[key_name(src)] вышел - теперь админов нет в игре."))
			if(config.delist_when_no_admins && config.hub_visible)
				world.update_hub_visibility(FALSE)
				send2adminirc("Обновляем видимость в хабе. Сервер теперь невидим в хабе.")
				SSwebhooks.send(WEBHOOK_AHELP, list("text" = "Обновляем видимость в хабе. Сервер теперь невидим в хабе."))
