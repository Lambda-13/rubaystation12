/obj/item/device/scanner/xenobio
	name = "сканер ксеноорганизмов"
	desc = "Лучший друг ксенобиолога и исследователей. Позволяет узнать чем дышит существо, что оно любит и не любит."
	icon = 'lambda/icons/obj/xenolife_scanner.dmi'
	icon_state = "xenobio"
	item_state = "analyzer"
	scan_sound = 'sound/effects/scanbeep.ogg'
	printout_color = "#f3e6ff"
	origin_tech = list(TECH_MAGNET = 1, TECH_BIO = 1)

	var/list/valid_targets = list(
		/mob/living/carbon/human,
		/mob/living/simple_animal,
		/mob/living/carbon/slime,
	)

/obj/item/device/scanner/xenobio/is_valid_scan_target(atom/O)
	if(is_type_in_list(O, valid_targets))
		return TRUE
	if(istype(O, /obj/structure/stasis_cage))
		var/obj/structure/stasis_cage/cagie = O
		return !!cagie.contained
	return FALSE

/obj/item/device/scanner/xenobio/scan(mob/O, mob/user)
	scan_title = O.name
	scan_data = xenobio_scan_results(O)
	user.show_message(SPAN_NOTICE(scan_data))

/proc/list_gases(var/gases)
	. = list()
	for(var/g in gases)
		. += "[gas_data.name[g]] ([gases[g]]%)"
	return english_list(.)

/proc/xenobio_scan_results(mob/target)
	. = list()
	. += "<meta charset='utf-8'>"
	if(istype(target, /obj/structure/stasis_cage))
		var/obj/structure/stasis_cage/cagie = target
		target = cagie.contained
	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = target
		. += "Данные [H]:"
		. += "Раса:\t[H.species]"
		if(H.species.breath_type)
			. += "Чем дышит:\t[gas_data.name[H.species.breath_type]]"
		if(H.species.exhale_type)
			. += "Что выдыхает:\t[gas_data.name[H.species.exhale_type]]"
		. += "Токсичные вещества:\t[english_list(H.species.poison_types)]"
		. += "Комфортная температура:\t[H.species.cold_discomfort_level] K to [H.species.heat_discomfort_level] K"
		. += "Комфортное давление:\t[H.species.warning_low_pressure] kPa to [H.species.warning_high_pressure] kPa"
	else if(istype(target, /mob/living/simple_animal))
		var/mob/living/simple_animal/A = target
		. += "Данные [A]:"
		. += "Раса:\t[initial(A.name)]"
		if(A.min_gas)
			. += "Чем дышит:\t[list_gases(A.min_gas)]"
		if(A.max_gas)
			. += "Токсичные вещества:\t[list_gases(A.max_gas)]"
		if(A.minbodytemp && A.maxbodytemp)
			. += "Комфортная температура:\t[A.minbodytemp] K to [A.maxbodytemp] K"
		var/area/map = locate(/area/overmap)
		for(var/obj/effect/overmap/visitable/sector/exoplanet/P in map)
			if((A in P.animals) || is_type_in_list(A, P.repopulate_types))
				GLOB.stat_fauna_scanned |= "[P.name]-[A.type]"
				. += "Новая ксенофауна изучена!"
				break
	else if(istype(target, /mob/living/carbon/slime))
		var/mob/living/carbon/slime/T = target
		. += "Slime scan result for \the [T]:"
		. += "[T.colour] [T.is_adult ? "adult" : "baby"] slime"
		. += "Nutrition:\t[T.nutrition]/[T.get_max_nutrition()]"
		if(T.nutrition < T.get_starve_nutrition())
			. += "<span class='alert'>Warning:\tthe slime is starving!</span>"
		else if (T.nutrition < T.get_hunger_nutrition())
			. += "<span class='warning'>Warning:\tthe slime is hungry.</span>"
		. += "Electric charge strength:\t[T.powerlevel]"
		. += "Health:\t[round((T.health * 100) / T.maxHealth)]%"

		var/list/mutations = T.GetMutations()

		if(!mutations.len)
			. += "This slime will never mutate."
		else
			var/list/mutationChances = list()
			for(var/i in mutations)
				if(i == T.colour)
					continue
				if(mutationChances[i])
					mutationChances[i] += T.mutation_chance / mutations.len
				else
					mutationChances[i] = T.mutation_chance / mutations.len

			var/list/mutationTexts = list("[T.colour] ([100 - T.mutation_chance]%)")
			for(var/i in mutationChances)
				mutationTexts += "[i] ([mutationChances[i]]%)"

			. += "Possible colours on splitting:\t[english_list(mutationTexts)]"

		if (T.cores > 1)
			. += "Anomalous slime core amount detected."
		. += "Growth progress:\t[T.amount_grown]/10."
	else
		. += "Incompatible life form, analysis failed."

	. = jointext(., "<br>")
