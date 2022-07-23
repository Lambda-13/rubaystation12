#include "meatstation_areas.dm"

/obj/effect/overmap/visitable/sector/meatstation
	name = "Обесточенная исследовательская станция"
	desc = "Обесточенная исследовательская станция. Большое количество близлежащих обломков блокируют более подробную информацию."
	icon_state = "object"
	known = FALSE
	initial_generic_waypoints = list(
		"nav_meatstation_1",
		"nav_meatstation_2",
		"nav_meatstation_3",
		"nav_meatstation_4",
		"nav_meatstation_antag"
	)

/datum/map_template/ruin/away_site/meatstation
	name = "Мясная станция"
	id = "awaysite_meatstation"
	description = "Эта станция исследовала жидкое мясо."
	suffixes = list("meatstation/meatstation.dmm")
	spawn_cost = 2
	area_usage_test_exempted_root_areas = list(/area/meatstation)

/obj/effect/shuttle_landmark/nav_meatstation/nav1
	name = "Navpoint #1"
	landmark_tag = "nav_meatstation_1"

/obj/effect/shuttle_landmark/nav_meatstation/nav2
	name = "Navpoint #2"
	landmark_tag = "nav_meatstation_2"

/obj/effect/shuttle_landmark/nav_meatstation/nav3
	name = "Navpoint #3"
	landmark_tag = "nav_meatstation_3"

/obj/effect/shuttle_landmark/nav_meatstation/nav4
	name = "Navpoint #4"
	landmark_tag = "nav_meatstation_4"

/obj/effect/shuttle_landmark/nav_meatstation/nav5
	name = "Navpoint #5"
	landmark_tag = "nav_meatstation_antag"

//structural

/obj/effect/paint/meatstation
	color = "#543333"

/obj/effect/paint/meatstation/lab
	color = "#301f1f"

/obj/machinery/power/apc/meatstation
	cell_type = /obj/item/cell/crap
	operating = 0
	locked = 0
	coverlocked = 0

//mobs

/mob/living/simple_animal/hostile/meatstation
	name = "существо мясной станции"
	desc = "Он пил жидкое мясо!"
	icon = 'maps/away/meatstation/meatstation_sprites.dmi'
	response_help = "pats"
	response_disarm = "shoves"
	response_harm = "stomps"
	flash_vulnerability = 0 //eyeless
	turns_per_move = 5
	natural_weapon = /obj/item/natural_weapon/bite/weak
	faction = "meat"
	min_gas = null
	minbodytemp = 0
	meat_type = /obj/item/reagent_containers/food/snacks/meat/meatstationmeat
	meat_amount = 1
	can_escape = TRUE

	ai_holder = /datum/ai_holder/simple_animal/melee/meatstation

/mob/living/simple_animal/hostile/meatstation/meatworm
	name = "мясной червь"
	desc = "Порождение жидкого мяса."
	icon_state = "meatworm"
	icon_living = "meatworm"
	icon_dead = "meatworm_dead"
	turns_per_move = 3
	speed = -2
	maxHealth = 20
	health = 20
	natural_weapon = /obj/item/natural_weapon/bite/weak
	mob_size = MOB_SMALL
	meat_amount = 2
	can_escape = FALSE

	say_list_type = /datum/say_list/meatstation/meatworm

/mob/living/simple_animal/hostile/meatstation/meatball
	name = "живое мясо"
	desc = "Эксперемент по скрещиванию обычного мяса и жидкого мяса."
	icon_state = "meatball"
	icon_living = "meatball"
	icon_dead = "meatball_dead"
	speed = 2
	maxHealth = 50
	health = 50
	natural_weapon = /obj/item/natural_weapon/meatball
	meat_amount = 2
	can_escape = FALSE

	say_list_type = /datum/say_list/meatstation/meatball

/obj/item/natural_weapon/meatball
	force = 12
	attack_verb = list("кусает")

/mob/living/simple_animal/hostile/meatstation/wormscientist
	name = "заражённый"
	desc = "Исследователь жидкого мяса."
	icon_state = "wormscientist"
	icon_living = "wormscientist"
	icon_dead = "wormscientist_dead"
	speed = 7
	maxHealth = 90
	health = 90
	natural_weapon = /obj/item/natural_weapon/wormscience
	meat_amount = 3

	say_list_type = /datum/say_list/meatstation/meat_human

/obj/item/natural_weapon/wormscience
	force = 15
	attack_verb = list("поглощает")

/mob/living/simple_animal/hostile/meatstation/wormguard
	name = "заражённый"
	desc = "Должен был защищать исследователей."
	icon_state = "wormguard"
	icon_living = "wormguard"
	icon_dead = "wormguard_dead"
	speed = 7
	maxHealth = 60
	health = 60
	natural_weapon = /obj/item/natural_weapon/wormguard
	meat_amount = 3
	projectilesound = 'sound/weapons/laser.ogg'
	ranged = 1
	projectiletype = /obj/item/projectile/beam/meatstation

	say_list_type = /datum/say_list/meatstation/meat_human
/obj/item/natural_weapon/wormguard
	force = 17
	attack_verb = list("slammed")

/mob/living/simple_animal/hostile/meatstation/meatmound
	name = "мясной ужас"
	desc = "Попытка превратить жидкое мясо в обычное."
	icon_state = "meatmound"
	icon_living = "meatmound"
	icon_dead = "meatmound_dead"
	flash_vulnerability = 1
	speed = 10
	maxHealth = 160
	health = 160
	natural_weapon = /obj/item/natural_weapon/meatmound
	meat_amount = 4
	mob_size = MOB_LARGE

	say_list_type = /datum/say_list/meatstation/meatmound

/obj/item/natural_weapon/meatmound
	force = 25
	sharp = TRUE
	attack_verb = list("хавает")

//projectile

/obj/item/projectile/beam/meatstation
	damage = 10
	agony = 10
	armor_penetration = 5

	muzzle_type = /obj/effect/projectile/meatstation/muzzle
	tracer_type = /obj/effect/projectile/meatstation/tracer
	impact_type = /obj/effect/projectile/meatstation/impact

/obj/effect/projectile/meatstation
	light_color = COLOR_RED_LIGHT
	icon = 'maps/away/meatstation/meatstation_sprites.dmi'

/obj/effect/projectile/meatstation/tracer
	icon_state = "redstun"

/obj/effect/projectile/meatstation/muzzle
	icon_state = "muzzle_redstun"

/obj/effect/projectile/meatstation/impact
	icon_state = "impact_redstun"

//items

/obj/item/gun/energy/laser/meatstation
	name = "карабин ЛМ76"
	desc = "Устаревший энергетический карабин, изначально предназначенный для миротворческих операций. Стреляет перегретыми электрошоковыми лучами."
	icon = 'maps/away/meatstation/meatstation_sprites.dmi'
	item_icons = list(
		slot_l_hand_str = 'maps/away/meatstation/meatstation_left_hand.dmi',
		slot_r_hand_str = 'maps/away/meatstation/meatstation_right_hand.dmi',
		)
	icon_state = "meatstationlaser"
	item_state = "meatstationlaser"
	projectile_type = /obj/item/projectile/beam/meatstation
	slot_flags = null
	wielded_item_state = "meatstationlaser-wielded"
	fire_delay = 15
	max_shots = 12

/obj/item/reagent_containers/food/snacks/meat/meatstationmeat
	name = "испорченое мясо"
	desc = "Результат неправильного хранения жидкого мяса."
	icon = 'maps/away/meatstation/meatstation_sprites.dmi'
	icon_state = "meat"
	filling_color = "#f41d7e"
	slice_path = /obj/item/reagent_containers/food/snacks/rawcutlet/meatstation

/obj/item/reagent_containers/food/snacks/meat/meatstationmeat/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 6)
	reagents.add_reagent(/datum/reagent/lexorin, 6)
	reagents.add_reagent(/datum/reagent/toxin/bromide, 3)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/rawcutlet/meatstation
	name = "кусок испорченого мяса"
	desc = "Кусок испорченого жидкого мяса. Лучше не задаваться вопросом почему оно твёрдое."
	icon = 'maps/away/meatstation/meatstation_sprites.dmi'
	icon_state = "meatchunk"

/obj/item/cell/infinite/meatstation
	name = "батарейка"
	desc = "Единственная разработка мясной станции которая не хочет убить тебя."
	icon = 'maps/away/meatstation/meatstation_sprites.dmi'
	icon_state = "biocell"
	origin_tech =  list(TECH_ENGINEERING = 3, TECH_MATERIAL = 4, TECH_BIO = 7)
	maxcharge = 500
	matter = null

//notes
//they're kinda rough, if you want to take another stab at these please do

/obj/item/paper/meatstation/biocell_note//this one's here to let players know those meat cells aren't just trash 500W power cells
	name = "записка"
	info = "Фогман, наконец, сделал это! После нескольких месяцев проб и ошибок он действительно сделал это. Все эти утомительные часы, которые он провел в лаборатории, пересоздавая жидкое мясо, не были напрасными. Все для создания биологической энергетической батарейки, способной бесконечно производить энергию через... ну, я на самом деле не уверен, как это он сделал. Я думаю, что Дэвис сказал что-то о телекристалах и о том какая в них сила содержится. Я получу от него более конкретный ответ позже. Я думаю, что Валера расстроена тем, что ее черви отошли на второй план. Мы просто в восторге от последствий успеха Дэвиса. Я должен обязательно сказать ей, что мы будем иметь их в виду."

/obj/item/paper/meatstation/xenoflora_note//this one is to try and justify the breaches all over
	name = "письмо"
	info = "Уважаемый шеф Фогман,<br><br>Мне жаль, что я блестящий ученый. Я сожалею, что потратил месяцы своей жизни на совершенствование генов очень изменчивого образца ксенофлоры. Мне жаль, что ваш помощник подумал, что образец ксенофлоры - исследуется быстро как клетки дерева. Мне жаль, что этот пилот решил сорвать несколько плодов из образца ксенофлоры. Мне очень жаль, что мистер пилот решил съесть этот фрукт, стоя в грузовом шлюзе. Мне жаль, что ты ныл и плакал о том, что это все моя вина. Извините, теперь я должен написать вам письмо с извинениями. Мне жаль, что ты избегал меня последние несколько дней. Больше всего мне жаль, что я не смог поделиться с вами своими мыслями по этому поводу лично, один на один.<br><br>С уважением,<br><br>Вы знаете, кто я, засранец.<br><br><br>P.S.<br>Я знаю, что завтра ты будешь на демонстрации Белой Мечты. Может быть, после этого мы сможем немного поболтать."

/obj/item/paper/meatstation/weapon_note//and this one's here to give players some mechanical knowledge about the gun unique to this away site
	name = "записка"
	info = "Хорошо, по общему признанию, использование LP76 не было бы сплошным солнцем и радугой, но это все же правильный выбор. Да конечно, может у них медленнее скорострельность. И да, вы можете возразить, что технически, поскольку они изначально разрабатывались как несмертельная альтернатива, они могут не обладать мощью современного оружия. Но у нас тут адская сделка! Если мы возьмем LP76, мы действительно сможем позволить себе их достаточно, чтобы вооружить всю команду безопасности, а то и кое-что! И то, что это несмертельное оружие, не означает, что оно неэффективно. Им чертовски больно, а эти оглушающие лучи достаточно сильны, чтобы сжечь плоть!<br>Послушайте, давайте будем честными: служба безопасности в значительной степени просто отпугивает пиратов. Если какие-то пираты решат совершить набег на нас, как только они увидят, что мы отстреливаемся, они побегут обратно на любую базу, которую они называют домом. Я гарантирую, что нам не понадобится ничего мощнее LP76. Поверьте мне."

//random spawns

/obj/random/single/meatstation
	icon = 'maps/away/meatstation/meatstation_sprites.dmi'
	icon_state = "50template"

/obj/random/single/meatstation/low
	icon_state = "10template"
	spawn_nothing_percentage = 90

/obj/random/single/meatstation/meatworm
	icon_state = "meatworm50"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/meatworm

/obj/random/single/meatstation/meatball
	icon_state = "meatball50"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/meatball

/obj/random/single/meatstation/wormscientist
	icon_state = "wormscientist50"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/wormscientist

/obj/random/single/meatstation/wormguard
	icon_state = "wormguard50"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/wormguard

/obj/random/single/meatstation/meatmound
	icon_state = "meatmound50"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/meatmound

/obj/random/single/meatstation/cell
	icon_state = "biocell50"
	spawn_object = /obj/item/cell/infinite/meatstation

/obj/random/single/meatstation/laser
	icon_state = "laser50"
	spawn_object = /obj/item/gun/energy/laser/meatstation

/obj/random/single/meatstation/low/biocell
	icon_state = "biocell10"
	spawn_object = /obj/item/cell/infinite/meatstation

/obj/random/single/meatstation/low/wormguard
	icon_state = "wormguard10"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/wormguard

/obj/random/single/meatstation/low/wormscientist
	icon_state = "wormscientist10"
	spawn_object = /mob/living/simple_animal/hostile/meatstation/wormscientist

/datum/ai_holder/simple_animal/melee/meatstation

/datum/say_list/meatstation/meatworm
	emote_see = list("клацает зубами", "булькает", "глотает воздух")

/datum/say_list/meatstation/meatball
	emote_hear = list("хихикает", "говорит невнятно")
	emote_see = list("скрежет", "корчится", "булькает", "щелкает зубами")

/datum/say_list/meatstation/meat_human
	emote_hear = list("булькает", "стонет")
	emote_see = list("шатается", "корчится", "подергивается", "вздрагивает", "дрожит")

/datum/say_list/meatstation/meatmound
	emote_hear = list("рычит", "стонет", "рычит")
	emote_see = list("скрежещет", "булькает", "булькает", "чавкает")
