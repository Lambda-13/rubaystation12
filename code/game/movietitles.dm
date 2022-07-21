#define CREDIT_ROLL_SPEED 185
#define CREDIT_SPAWN_SPEED 20
#define CREDIT_ANIMATE_HEIGHT (14 * world.icon_size)
#define CREDIT_EASE_DURATION 22

GLOBAL_LIST(end_titles)

/client/var/list/credits

/client/proc/RollCredits()
	set waitfor = FALSE

	if(get_preference_value(/datum/client_preference/show_credits) != GLOB.PREF_YES)
		return

	if(!GLOB.end_titles)
		GLOB.end_titles = generate_titles()

	LAZYINITLIST(credits)

	if(mob)
		mob.overlay_fullscreen("fishbed",/obj/screen/fullscreen/fishbed)
		mob.overlay_fullscreen("fadeout",/obj/screen/fullscreen/fadeout)

		if(mob.get_preference_value(/datum/client_preference/play_lobby_music) == GLOB.PREF_YES)
			sound_to(mob, sound(null, channel = GLOB.lobby_sound_channel))
			if(GLOB.end_credits_song == null)
				var/title_song = pick('sound/music/THUNDERDOME.ogg', 'sound/music/europa/Chronox_-_03_-_In_Orbit.ogg', 'sound/music/europa/asfarasitgets.ogg')
				sound_to(mob, sound(title_song, wait = 0, volume = 40, channel = GLOB.lobby_sound_channel))
			else if(get_preference_value(/datum/client_preference/play_admin_midis) == GLOB.PREF_YES)
				sound_to(mob, sound(GLOB.end_credits_song, wait = 0, volume = 40, channel = GLOB.lobby_sound_channel))
	sleep(50)
	var/list/_credits = credits
	verbs += /client/proc/ClearCredits
	for(var/I in GLOB.end_titles)
		if(!credits)
			return
		var/obj/screen/credit/T = new(null, I, src)
		_credits += T
		T.rollem()
		sleep(CREDIT_SPAWN_SPEED)
	sleep(CREDIT_ROLL_SPEED - CREDIT_SPAWN_SPEED)

	ClearCredits()
	verbs -= /client/proc/ClearCredits

/client/proc/ClearCredits()
	set name = "Stop End Titles"
	set category = "OOC"
	verbs -= /client/proc/ClearCredits
	QDEL_NULL_LIST(credits)
	mob.clear_fullscreen("fishbed")
	mob.clear_fullscreen("fadeout")
	sound_to(mob, sound(null, channel = GLOB.lobby_sound_channel))

/obj/screen/credit
	icon_state = "blank"
	mouse_opacity = 0
	alpha = 0
	screen_loc = "1,1"
	plane = HUD_PLANE
	layer = HUD_ABOVE_ITEM_LAYER
	var/client/parent
	var/matrix/target

/obj/screen/credit/Initialize(mapload, credited, client/P)
	. = ..()
	parent = P
	maptext = {"<div style="font:'Small Fonts'">[credited]</div>"}
	maptext_height = world.icon_size * 2
	maptext_width = world.icon_size * 14

/obj/screen/credit/proc/rollem()
	var/matrix/M = matrix(transform)
	M.Translate(0, CREDIT_ANIMATE_HEIGHT)
	animate(src, transform = M, time = CREDIT_ROLL_SPEED)
	target = M
	animate(src, alpha = 255, time = CREDIT_EASE_DURATION, flags = ANIMATION_PARALLEL)
	spawn(CREDIT_ROLL_SPEED - CREDIT_EASE_DURATION)
		if(!QDELETED(src))
			animate(src, alpha = 0, transform = target, time = CREDIT_EASE_DURATION)
			sleep(CREDIT_EASE_DURATION)
			qdel(src)
	parent.screen += src

/obj/screen/credit/Destroy()
	var/client/P = parent
	if(parent)
		P.screen -= src
	LAZYREMOVE(P.credits, src)
	parent = null
	return ..()

/proc/generate_titles()
	var/list/titles = list()
	var/list/cast = list()
	var/list/chunk = list()
	var/list/possible_titles = list()
	var/chunksize = 0
	if(!GLOB.end_credits_title)
		/* Establish a big-ass list of potential titles for the "episode". */
		possible_titles += "[pick("ПАДЕНИЕ", "ВОСХОД", "НОВЫЕ", "ФИНАЛ", "ТЁМНАЯ СТОРОНА", "ВОЙНА", "УНИЧТОЖЕНИЕ", "КРИЗИС")]\
							 [pick("РЕСПУБЛИКИ", "ИМПЕРИИ", "НАНОТРАЗЕН", "СИНДИКАТА", "ТАУ КИТА", "СОЛНЕЧНОЙ ФЕДЕРАЦИИ", "ЦИВИЛИЗАЦИИ", "ЭКИПАЖА",\
							"ЦЕНТРАЛЬНОГО КОММАНДОВАНИЯ", "МЕД ОТСЕКА", "ИНЖ ОТСЕКА", "СЛУЖБЫ БЕЗОПАСНОСТИ", "РНД", "ОБСУГИ", "КОМАНДОВАНИЯ", "ИССЛЕДОВАТЕЛЕЙ", "ЛЯМБДЫ",\
							"[uppertext(GLOB.using_map.station_name)]")]"
		possible_titles += "ЭКИПАЖ СТАЛ [pick("РАСИСТАМИ", "АНТИСЕМЕТИСТАМИ", "САТАНИСТАМИ", "ХРИСТИАНАМИ", "КАТОЛИКАМИ", "НИЧТОЖЕСТВОМ", "ЛУЧШЕ САМОГО СЕБЯ", "ТЕМ, КЕМ И БЫЛ", "НАЦИСТАМИ", "КОМУНИСТАМИ", "ПЛОХИМИ ПАРНЯМИ", "ОТНОСИТЬСЯ СЕРЬЁЗНО К [pick("НАРКОТИЧЕСКИМ ВЕЩЕСТВАМ", "ПРЕСТУПЛЕНИЯМ", "ПРОДУКТИВНОСТИ", "ВЕРОИСПОВЕДАНИЮ", "СПОРТУ", "ПОЛЁТАМ В КОСМОСЕ")]")]"
		possible_titles += "А ЕЩЁ ЭКИПАЖ ПОЛУЧИЛ ЦЕННЫЙ УРОК ЧТО [pick("ЛЮБОВЬ", "НАРКОТИКИ", "ДЕНЬГИ", "КСЕНОФОБИЯ", "ВОЙНА", "МИР", "РАДИАЦИЯ", "КУЛЬТ КРОВИ", "ТЕОРИЯ ЗАПУТАНОСТИ", "ТЕХНОЛОГИИ РНД", "СЕКС С [pick("УНАТХАМИ", "СКРЕЛЛАМИ", "ДИОНАМИ", "КХАРМАМИ", "ВОКСАМИ", "СЕРПЕНТИДАМИ")]", "НЕГРЫ")] - [pick("ДОБРО", "ЗЛО")]"
		possible_titles += "ОСОБАЯ БЛАГОДАРНОСТЬ [pick("НАШИМ ПОКРОВИТЕЛЯМ", "НАНОТРАЗЕН", "БЕЛОЙ МЕЧТЕ", "ЛЯМБДЕ 13", "ОПГ ДУДОСЕРАМ", "ВСЕМ ЖИТЕЛЯМ ПЛАНЕТЫ", "СОЛНЕЧНОМУ ПРАВИТЕЛЬСТВУ", "ДАЛЬНИМ СЕКТОРАМ", "ИССЛЕДОВАТЕЛЯМ ФОРОНА", "СТРОИТЕЛЕМ КОРАБЛЯ", "\[ДАННЫЕ УДАЛЕНЫ\]")] [pick("ЗА ПОМОЩЬ ЭКИПАЖУ", "ЗА ДОСТАВКУ ПРИПАСОВ", "В ИСТРЕБЛЕНИИ ВРЕДИТЕЛЕЙ", "В ПОМОЩИ", "ЗА ПОМОЩЬ В ИЗУЧЕНИИ", "\[ДАННЫЕ УДАЛЕНЫ\]")]"
		possible_titles += "СДЕЛАНО ПО МОТИВАМ [pick("ПОЧТАЛЬОНА 2", "СИМУЛЯТОРА ШАПОК 2", "СИМУЛЯТОР ПОДЛОДКИ И НЕАДЕКВАТНОГО ЭКИПАЖА", "VHU", "УЧЁНОГО С ЛОМИКОМ", "ЗВЕЗДНЫЕ БИТАРДЫ: [pick("ЭПИЗОД I - СКРЫТЫЙ БАН","ЭПИЗОД II - АТАКА ДВАЧЕРОВ","ЭПИЗОД III - МЕСТЬ АБУ","ЭПИЗОД IV - НОВАЯ ПЕДАЛЬ","ЭПИЗОД V - АБУ НАНОСИТ ОТВЕТНЫЙ УДАР","ЭПИЗОД VI - ВОЗРАЩЕНИЕ ДВАЧА","ЭПИЗОД VII - ПРОБУЖДЕНИЕ ЗУМЕРОВ","ЭПИЗОД VIII - ПОСЛЕДНИЕ БУМЕРЫ","ЭПИЗОД IX - ЧУДЕЦ. ВОСХОД", "ВОЙНЫ БИТАРДОВ", "ФОРЧАН-ОДИН","АБУ НАРИМАН","ЭСКАДРИЛЬЯ «ДВАЧ»")]")]"
		possible_titles += "[pick("КОСМИЧЕСКИЕ", "СЕКСУАЛЬНЫЕ", "ДРАКОНЬИ", "ВОЕННЫЕ", "НЕОБЫЧАЙНЫЕ", "ЛЮДСКИЕ", "НОЧНЫЕ", "ДНЕВНЫЕ", "МЕЖПЛАНЕТНЫЕ", "НИНЗЯ", "МАГ", "СОКРАЛЬНЫЙ", "НАЦИСТКИЕ", "ПОЛИТИЧЕСКИЕ", "РАДИКАЛЬНЫЕ")] [pick("КВЕСТЫ", "СИЛЫ", "ПРИКЛЮЧЕНИЯ")]"
		possible_titles += "[pick("ДЕНЬ НА [uppertext(GLOB.using_map.station_short)]", "ОХОТА ЗА БЕЛЫМ НИГЕРОМ", "ЧУЖОЙ ПРОТИВ ПИДОРА", "ГЕИ НИГЕРЫ ИЗ ДАЛЁКОГО КОСМОСА")]"
		titles += "<center><h1>ЧАСТЬ [rand(1,1000)]<br>[pick(possible_titles)]<h1></h1></h1></center>"
	else
		titles += "<center><h1>ЭПИЗОД [rand(1,1000)]<br>[GLOB.end_credits_title]<h1></h1></h1></center>"

	for(var/mob/living/carbon/human/H in GLOB.living_mob_list_|GLOB.dead_mob_list_)
		if(findtext(H.real_name,"(mannequin)"))
			continue
		if(H.is_species(SPECIES_MONKEY) && findtext(H.real_name,"[lowertext(H.species.name)]")) //no monki
			continue
		if(H.timeofdeath && H.timeofdeath < 5 MINUTES) //don't mention these losers (prespawned corpses mostly)
			continue
		if(!cast.len && !chunksize)
			chunk += "В СЬЁМКАХ УЧАСТИЕ УЧАВСТВОВАЛИ:"
		var/job = ""
		if(GetAssignment(H) != "Unassigned")
			job = ", [uppertext(GetAssignment(H))]"
		var/used_name = H.real_name
		var/datum/computer_file/report/crew_record/R = get_crewmember_record(H.real_name)
		if(R && R.get_rank())
			var/datum/mil_rank/rank = GLOB.mil_branches.get_rank(R.get_branch(), R.get_rank())
			if(rank.name_short)
				used_name = "[rank.name_short] [used_name]"
		var/showckey = 0
		if(H.ckey && H.client)
			if(H.client.get_preference_value(/datum/client_preference/show_ckey_credits) == GLOB.PREF_SHOW)
				showckey = 1
		var/decl/cultural_info/actor_culture = SSculture.get_culture(H.get_cultural_value(TAG_CULTURE))
		if(!actor_culture || !(H.species.spawn_flags & SPECIES_CAN_JOIN) || prob(10))
			actor_culture = SSculture.get_culture(CULTURE_HUMAN)
		if(!showckey)
			if(prob(90))
				chunk += "[actor_culture.get_random_name(H.gender)]\t \t \t \t[uppertext(used_name)][job]"
			else
				var/datum/gender/G = gender_datums[H.gender]
				chunk += "[used_name]\t \t \t \t[uppertext(G.him)]SELF"
		else
			chunk += "[uppertext(actor_culture.get_random_name(H.gender))] a.k.a. '[uppertext(H.ckey)]'\t \t \t \t[uppertext(used_name)][job]"
		chunksize++
		if(chunksize > 2)
			cast += "<center>[jointext(chunk,"<br>")]</center>"
			chunk.Cut()
			chunksize = 0
	if(chunk.len)
		cast += "<center>[jointext(chunk,"<br>")]</center>"

	titles += cast

	var/list/corpses = list()
	var/list/monkies = list()
	for(var/mob/living/carbon/human/H in GLOB.dead_mob_list_)
		if(H.timeofdeath < 5 MINUTES) //no prespawned corpses
			continue
		if(H.is_species(SPECIES_MONKEY) && findtext(H.real_name,"[lowertext(H.species.name)]"))
			monkies[H.species.name] += 1
		else if(H.real_name)
			corpses += H.real_name
	for(var/spec in monkies)
		var/datum/species/S = all_species[spec]
		corpses += "[monkies[spec]] [lowertext(monkies[spec] > 1 ? S.name_plural : S.name)]"
	if(corpses.len)
		titles += "<center>ОСНОВАНО НА РЕАЛЬНЫХ СОБЫТИЯХ<br>В память [english_list(corpses)].</center>"

	var/list/staff = list("РАЗРАБОЧИКИ:")
	var/list/staffjobs = list("Кодер на петухоне", "Спрайтер в пеинте", "Кодер на плюсах", "Ничего не делал", "Обсуждал игроков", "Вахтёр", "Мапер", "Сравнивает тг и бэй", "Кодер спрайтер и мапер")
	var/list/goodboys = list()
	for(var/client/C)
		if(!C.holder || C.is_stealthed())
			continue

		if(C.holder.rights & (R_DEBUG|R_ADMIN))
			var/decl/cultural_info/cult = SSculture.cultural_info_by_name[pick(SSculture.cultural_info_by_name)]
			staff += "[uppertext(pick(staffjobs))] - [cult.get_random_name(pick(MALE, FEMALE))] он же '[C.key]'"
		else if(C.holder.rights & R_MOD)
			goodboys += "[C.key]"

	titles += "<center>[jointext(staff,"<br>")]</center>"
	if(goodboys.len)
		titles += "<center>ОСОБАЯ БЛАГОДАРНОСТЬ:<br>[english_list(goodboys)]</center><br>"

	var/disclaimer = "<br>Наш спонсор [GLOB.using_map.company_name].<br>Все права защищены.<br>\
					 Этот фильм защищен законами об авторских правах центрального правительства Солнца<br> и других правительств по всей галактике.<br>\
					 Место первой публикации: [pick("Марс", "Луна", "Земля", "Венера", "Фобос", "Церес", "Тиамат", "Тау Кита", "Еос", "Плутон", "Оуер",\
					 "Тадмор", "Брах", "Пиркс", "Иоланус", "Сафар", "Гайя")].<br>"
	disclaimer += pick("Копировать запрещено. ЗАПРЕЩЕНО.",
						"Все трюки выполняли малооплачиваемые стажеры. НЕ пытайтесь повторить увиденое дома.",
						"[GLOB.using_map.company_name] не одобряет изображенное поведение. На ваш страх и риск.",
						"Любая несанкционированная демонстрация, распространение или копирование этого фильма или любой его части (включая саундтрек)<br>\
						может привести к тому, что ОБР будет вызван для штурма вашего дома и захвата его силой.",
						"История, все имена, персонажи и события, изображенные в этом шоу, являются вымышленными. Никакой схожести и индефикации с реальными<br>\
						лицами (живыми или мёртвыми), местами, зданий и продуктов, и так далее и тому подобное.<br>\
						Этот фильм основан на реальной истории, и все изображенные персонажи основаны на реальных людях, несмотря на то, что мы только что сказали",
						"Ни одно физическое или юридическое лицо, связанное с этим фильмом, не получало оплаты или чего-либо ценного и не заключало никаких соглашений в связи<br>\
						с изображением табачных изделий, несмотря на то, что внутри шоу изображено обильное курение.<br>\
						(Этот отказ от ответственности спонсируется Carcinoma - канцерогены - это наш бизнес! (TM)).",
						"При создании этого фильма не пострадало ни одно животное, за исключением тех, которые ранее были указаны как мертвые. Не пытайтесь повторить это дома.")
	titles += "<hr>"
	titles += "<center><span style='font-size:6pt;'>[JOINTEXT(disclaimer)]</span></center>"

	return titles
