//Blocks an attempt to connect before even creating our client datum thing.
/world/IsBanned(key,address,computer_id)

	if(ckey(key) in admin_datums)
		return ..()

	//Guest Checking
	if(!config.guests_allowed && IsGuestKey(key))
		log_access("Ошибка входа: [key] - Гостевой аккаунт")
		message_admins("<span class='notice'>Ошибка входа: [key] - Гостевой аккаунт</span>")
		return list("reason"="гостевой аккаунт", "desc"="\nПричина: гостевой аккаунт. Зарегестрируйся или войди в уже существующий.")

	if(config.configinvitelist && ckey(key) in !invitelist)
		return list("reason"="не приглашён", "desc"="\nТы не приглашён.")

	if(config.ban_legacy_system)

		//Ban Checking
		. = CheckBan( ckey(key), computer_id, address )
		if(.)
			log_access("Ошибка входа: [key] [computer_id] [address] - Блокировка [.["reason"]]")
			message_admins("<span class='notice'>Ошибка входа: [key] id:[computer_id] ip:[address] - Блокировка [.["reason"]]</span>")
			return .

		return ..()	//default pager ban stuff

	else

		var/ckeytext = ckey(key)

		if(!establish_db_connection())
			error("Ban database connection failure. Key [ckeytext] not checked")
			log_misc("Ban database connection failure. Key [ckeytext] not checked")
			return

		var/failedcid = 1
		var/failedip = 1

		if (config.minimum_player_age && get_player_age(key) < config.minimum_player_age)
			message_admins("[key] пытался присоединиться, но не достиг установленного минимального возраста игрока.")
			return list("reason"="возраст аккаунта", "desc"="Этот сервер в настоящее время не разрешает присоединяться учетным записям с небольшим количеством дней с момента создания.")

		var/ipquery = ""
		var/cidquery = ""
		if(address)
			failedip = 0
			ipquery = " OR ip = '[address]' "

		if(computer_id)
			failedcid = 0
			cidquery = " OR computerid = '[computer_id]' "

		var/DBQuery/query = dbcon.NewQuery("SELECT ckey, ip, computerid, a_ckey, reason, expiration_time, duration, bantime, bantype FROM erro_ban WHERE (ckey = '[ckeytext]' [ipquery] [cidquery]) AND (bantype = 'PERMABAN'  OR (bantype = 'TEMPBAN' AND expiration_time > Now())) AND isnull(unbanned)")

		query.Execute()

		while(query.NextRow())
			var/pckey = query.item[1]
			//var/pip = query.item[2]
			//var/pcid = query.item[3]
			var/ackey = query.item[4]
			var/reason = query.item[5]
			var/expiration = query.item[6]
			var/duration = query.item[7]
			var/bantime = query.item[8]
			var/bantype = query.item[9]

			var/expires = ""
			if(text2num(duration) > 0)
				expires = "  Блокировка выдана на [minutes_to_readable(duration)] и истекает [expiration] (по времени сервера)."

			var/desc = "\nПричина: ([pckey]) не имеет права играть на данном сервере. Описание: \n[reason]\nБлокировка выдана [ackey] в [bantime].\n[expires]"

			return list("reason"="[bantype]", "desc"="[desc]")

		if (failedcid)
			message_admins("[key] зашёл на сервер с пустым cid в проверке бана.")
		if (failedip)
			message_admins("[key] зашел на сервер с пустым ip в проверке бана.")
		return ..()	//default pager ban stuff
