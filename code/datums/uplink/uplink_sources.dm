#define NO_GUARANTEE_NO_EXTRA_COST_DESC(X) "Устанавливает аплинк в " + X + " только в том случае, если он есть у тебя."

#define SETUP_FAILED TRUE

GLOBAL_LIST_INIT(default_uplink_source_priority, list(
	/decl/uplink_source/pda,
	/decl/uplink_source/radio,
	/decl/uplink_source/unit))

/decl/uplink_source
	var/name
	var/desc

/decl/uplink_source/proc/setup_uplink_source(mob/M, amount)
	return SETUP_FAILED

/decl/uplink_source/pda
	name = "PDA"
	desc = NO_GUARANTEE_NO_EXTRA_COST_DESC("a PDA")

/decl/uplink_source/pda/setup_uplink_source(mob/M, amount)
	var/obj/item/modular_computer/pda/P = find_in_mob(M, /obj/item/modular_computer/pda)
	if(!P || !P.hard_drive)
		return SETUP_FAILED

	var/pda_pass = "[rand(100,999)] [pick(GLOB.greek_letters)]"
	var/obj/item/device/uplink/T = new(P, M.mind, amount)
	P.hidden_uplink = T
	var/datum/computer_file/program/uplink/program = new(pda_pass)
	if(!P.hard_drive.save_file(program))
		return SETUP_FAILED	//Not enough space or other issues.
	to_chat(M, "<span class='notice'>Переносное реле телепортации объекта было установлено в вашем [P.name]. Просто введите код \"[pda_pass]\" в TaxQuickly для разблокировки узела связи.</span>")
	M.StoreMemory("<B>Код узела связи (аплинка):</B> [pda_pass] ([P.name]).", /decl/memory_options/system)
	T.program = program

/decl/uplink_source/radio
	name = "Радиогарнитура"
	desc = NO_GUARANTEE_NO_EXTRA_COST_DESC("a radio")

/decl/uplink_source/radio/setup_uplink_source(mob/M, amount)
	var/obj/item/device/radio/R = find_in_mob(M, /obj/item/device/radio)
	if(!R)
		return SETUP_FAILED

	var/freq = PUBLIC_LOW_FREQ
	var/list/freqlist = list()
	while (freq <= PUBLIC_HIGH_FREQ)
		if (freq < 1451 || freq > PUB_FREQ)
			freqlist += freq
		freq += 2
		if ((freq % 2) == 0)
			freq += 1

	freq = freqlist[rand(1, freqlist.len)]
	var/obj/item/device/uplink/T = new(R, M.mind, amount)
	R.hidden_uplink = T
	R.traitor_frequency = freq
	to_chat(M, "<span class='notice'>Переносное реле телепортации объекта было установлено в вашем [R.name]. Просто наберите частоту [format_frequency(freq)] для разблокировки узела связи.</span>")
	M.StoreMemory("<B>Частота:</B> [format_frequency(freq)] ([R.name]).", /decl/memory_options/system)

/decl/uplink_source/implant
	name = "Имплант"
	desc = "Вживляет имплантат узела связи (аплинка) в вашу голову. Стоит 20% от первоначальной суммы ТС."

/decl/uplink_source/implant/setup_uplink_source(mob/living/carbon/human/H, amount)
	if(!istype(H))
		return SETUP_FAILED

	var/obj/item/organ/external/head = H.organs_by_name[BP_HEAD]
	if(!head)
		return SETUP_FAILED

	var/obj/item/implant/uplink/U = new(H, round(amount * 0.8))
	U.imp_in = H
	U.implanted = TRUE
	U.part = head
	head.implants += U

	U.implanted(H) // This proc handles the installation feedback

/decl/uplink_source/unit
	name = "Устроиство"
	desc = "Специальное устроиство будет находиться у вас в вещах. Имеет на 50% больше ТК."

/decl/uplink_source/unit/setup_uplink_source(mob/M, amount)
	var/obj/item/device/radio/uplink/U = new(M, M.mind, round(amount * 1.5))
	put_on_mob(M, U, "\A [U]")

/decl/uplink_source/telecrystals
	name = "ТелеКристалы"
	desc = "Вам даются ТелеКристалы в чистом виде. Дает 200% от начальной суммы ТС."

/decl/uplink_source/telecrystals/setup_uplink_source(mob/M, amount)
	amount = round(amount * 2.0)
	var/obj/item/stack/telecrystal/TC = new(M, amount)
	put_on_mob(M, TC, "[amount] телекристалов\s")

/decl/uplink_source/proc/find_in_mob(var/mob/M, var/type)
	for(var/item in M.get_equipped_items(TRUE))
		if(!istype(item, type))
			continue
		var/obj/item/I = item
		if(!I.hidden_uplink)
			return I

/decl/uplink_source/proc/put_on_mob(mob/M, atom/movable/AM, text)
	var/obj/O = M.equip_to_storage(AM)
	if(O)
		to_chat(M, "<span class='notice'>[text] можно найти у вас в [O.name].</span>")
	else if(M.put_in_hands(AM))
		to_chat(M, "<span class='notice'>[text] у вас в руке.</span>")
	else
		AM.dropInto(M.loc)
		to_chat(M, "<span class='notice'>[text] должен быть около вас.</span>")

/proc/setup_uplink_source(mob/M, amount = DEFAULT_TELECRYSTAL_AMOUNT)
	if(!istype(M) || !M.mind)
		return FALSE

	var/list/priority_order
	if(M.client && M.client.prefs)
		priority_order = M.client.prefs.uplink_sources

	if(!priority_order || !priority_order.len)
		priority_order = list()
		for(var/entry in GLOB.default_uplink_source_priority)
			priority_order += decls_repository.get_decl(entry)

	for(var/entry in priority_order)
		var/decl/uplink_source/US = entry
		if(US.setup_uplink_source(M, amount) != SETUP_FAILED)
			return TRUE

	to_chat(M, "<span class='warning'>Либо по выбору, либо по обстоятельствам вы останетесь без узела связи.</span>")
	return FALSE

#undef NO_GUARANTEE_NO_EXTRA_COST_DESC
#undef SETUP_FAILED
