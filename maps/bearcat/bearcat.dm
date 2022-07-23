#if !defined(using_map_DATUM)

	#include "torch_announcements.dm"
	#include "torch_antagonism.dm"
	#include "torch_areas.dm"
	#include "torch_elevator.dm"
	#include "torch_events.dm"
	#include "torch_holodecks.dm"
	#include "torch_lobby.dm"
	#include "torch_machinery.dm"
	#include "torch_map_templates.dm"
	#include "torch_npcs.dm"
	#include "torch_overmap.dm"
	#include "torch_presets.dm"
	#include "torch_procs.dm"
	#include "torch_ranks.dm"
	#include "torch_security_state.dm"
	#include "torch_setup.dm"
	#include "torch_shuttles.dm"
	#include "torch_submaps.dm"
	#include "torch_turfs.dm"
	#include "torch_unit_testing.dm"

	#include "datums/uniforms.dm"
	#include "datums/uniforms_expedition.dm"
	#include "datums/uniforms_fleet.dm"
	#include "datums/game_modes/torch_traitor.dm"
	#include "datums/game_modes/torch_revolution.dm"
	#include "datums/game_modes/torch_siege.dm"
	#include "datums/game_modes/torch_meteor.dm"
	#include "datums/game_modes/torch_uprising.dm"
	#include "datums/reports/command.dm"
	#include "datums/reports/corporate.dm"
	#include "datums/reports/exploration.dm"
	#include "datums/reports/medical.dm"
	#include "datums/reports/robotics.dm"
	#include "datums/reports/science.dm"
	#include "datums/reports/security.dm"
	#include "datums/reports/solgov.dm"
	#include "datums/reports/deck.dm"
	#include "datums/shackle_law_sets.dm"
	#include "datums/supplypacks/security.dm"
	#include "datums/supplypacks/science.dm"
	#include "datums/department_exploration.dm"

	#include "game/antagonist/outsider/deathsquad.dm"
	#include "game/antagonist/outsider/ert.dm"
	#include "game/antagonist/outsider/foundation.dm"
	#include "game/antagonist/outsider/mercenary.dm"
	#include "game/antagonist/outsider/raider.dm"

	#include "items/cards_ids.dm"
	#include "items/encryption_keys.dm"
	#include "items/headsets.dm"
	#include "items/items.dm"
	#include "items/machinery.dm"
	#include "items/manuals.dm"
	#include "items/stamps.dm"
	#include "items/uniform_vendor.dm"
	#include "items/rigs.dm"
	#include "items/solbanner.dm"
	#include "items/explo_shotgun.dm"
	#include "items/mecha.dm"
	#include "items/memos.dm"

	#include "../../packs/faction_iccgn/_pack.dm"

	#include "items/clothing/ec_skillbadges.dm"
	#include "items/clothing/solgov-accessory.dm"
	#include "items/clothing/solgov-armor.dm"
	#include "items/clothing/solgov-feet.dm"
	#include "items/clothing/solgov-hands.dm"
	#include "items/clothing/solgov-head.dm"
	#include "items/clothing/solgov-suit.dm"
	#include "items/clothing/solgov-under.dm"

	#include "items/weapon/storage/wallets.dm"

	#include "job/torch_access.dm"
	#include "job/torch_jobs.dm"
	#include "job/command_jobs.dm"
	#include "job/corporate_jobs.dm"
	#include "job/engineering_jobs.dm"
	#include "job/exploration_jobs.dm"
	#include "job/medical_jobs.dm"
	#include "job/misc_jobs.dm"
	#include "job/research_jobs.dm"
	#include "job/security_jobs.dm"
	#include "job/service_jobs.dm"
	#include "job/supply_jobs.dm"

	#include "job/outfits/torch_outfits.dm"
	#include "job/outfits/command_outfits.dm"
	#include "job/outfits/corporate_outfits.dm"
	#include "job/outfits/engineering_outfits.dm"
	#include "job/outfits/exploration_outfits.dm"
	#include "job/outfits/medical_outfits.dm"
	#include "job/outfits/misc_outfits.dm"
	#include "job/outfits/research_outfits.dm"
	#include "job/outfits/security_outfits.dm"
	#include "job/outfits/service_outfits.dm"
	#include "job/outfits/supply_outfits.dm"
	#include "job/outfits/unused_outfits.dm"

	#include "language/human/euro.dm"
	#include "language/human/misc/spacer.dm"

	#include "machinery/apc_shuttle.dm"
	#include "machinery/keycard authentication.dm"
	#include "machinery/suit_storage.dm"

	#include "outfits/scgec.dm"

	#include "robot/module_flying_surveyor.dm"

	#include "structures/signs.dm"
	#include "structures/closets.dm"
	#include "structures/closets/closet_appearances.dm"
	#include "structures/closets/command.dm"
	#include "structures/closets/engineering.dm"
	#include "structures/closets/medical.dm"
	#include "structures/closets/misc.dm"
	#include "structures/closets/research.dm"
	#include "structures/closets/security.dm"
	#include "structures/closets/services.dm"
	#include "structures/closets/supply.dm"
	#include "structures/closets/exploration.dm"

	#include "loadout/_defines.dm"
	#include "loadout/loadout_accessories.dm"
	#include "loadout/loadout_ec_skillbadges.dm"
	#include "loadout/loadout_eyes.dm"
	#include "loadout/loadout_gloves.dm"
	#include "loadout/loadout_head.dm"
	#include "loadout/loadout_shoes.dm"
	#include "loadout/loadout_suit.dm"
	#include "loadout/loadout_uniform.dm"
	#include "loadout/loadout_xeno.dm"
	#include "loadout/~defines.dm"

	#include "torch1_deck5.dmm"
	#include "torch2_deck4.dmm"
	#include "torch3_deck3.dmm"
	#include "torch4_deck2.dmm"
	#include "torch5_deck1.dmm"
	#include "torch6_bridge.dmm"
	#include "z1_admin.dmm"
	#include "z2_transit.dmm"

	#include "../away/empty.dmm"
	#include "../away/mining/mining.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/bearcat/bearcat.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/casino/casino.dm"
	#include "../away/yacht/yacht.dm"
	#include "../away/blueriver/blueriver.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lar_maria/lar_maria.dm"
	#include "../away/voxship/voxship.dm"
	#include "../away/skrellscoutship/skrellscoutship.dm"
	#include "../away/meatstation/meatstation.dm"
	#include "../away/miningstation/miningstation.dm"
	#include "../away/mininghome/mininghome.dm"
	#include "../away/scavver/scavver_gantry.dm"

	#include "../event/iccgn_ship/icgnv_hound.dm"


	#define using_map_DATUM /datum/map/torch

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Torch

#endif









#include "bearcat_areas.dm"
#include "bearcat_jobs.dm"
#include "bearcat_access.dm"
#include "bearcat_radio.dm"

/obj/effect/submap_landmark/joinable_submap/bearcat
	name = "FTV Bearcat"
	archetype = /decl/submap_archetype/derelict/bearcat

/decl/submap_archetype/derelict/bearcat
	descriptor = "derelict cargo vessel"
	map = "Bearcat Wreck"
	crew_jobs = list(
		/datum/job/submap/bearcat_captain,
		/datum/job/submap/bearcat_crewman
	)

/obj/effect/overmap/visitable/ship/bearcat
	name = "light freighter"
	color = "#00ffff"
	vessel_mass = 20000
	max_speed = 1/(10 SECONDS)
	burn_delay = 10 SECONDS

/obj/effect/overmap/visitable/ship/bearcat/New()
	name = "[pick("FTV","ITV","IEV")] [pick("Bearcat", "Firebug", "Defiant", "Unsinkable","Horizon","Vagrant")]"
	for(var/area/ship/scrap/A)
		A.name = "\improper [name] - [A.name]"
		GLOB.using_map.area_purity_test_exempt_areas += A.type
	name = "[name], \a [initial(name)]"
	..()

/datum/map_template/ruin/away_site/bearcat_wreck
	name = "Bearcat Wreck"
	id = "awaysite_bearcat_wreck"
	description = "A wrecked light freighter."
	suffixes = list("bearcat/bearcat-1.dmm", "bearcat/bearcat-2.dmm")
	spawn_cost = 1
	player_cost = 4
	shuttles_to_initialise = list(/datum/shuttle/autodock/ferry/lift)
	area_usage_test_exempted_root_areas = list(/area/ship)
	apc_test_exempt_areas = list(
		/area/ship/scrap/maintenance/engine/port = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/maintenance/engine/starboard = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/crew/hallway/port= NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/crew/hallway/starboard= NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/maintenance/hallway = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/maintenance/lower = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/maintenance/atmos = NO_SCRUBBER,
		/area/ship/scrap/escape_port = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/escape_star = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/shuttle/lift = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/ship/scrap/command/hallway = NO_SCRUBBER|NO_VENT
	)
	spawn_weight = 0.67

/datum/shuttle/autodock/ferry/lift
	name = "Cargo Lift"
	shuttle_area = /area/ship/scrap/shuttle/lift
	warmup_time = 3	//give those below some time to get out of the way
	waypoint_station = "nav_bearcat_lift_bottom"
	waypoint_offsite = "nav_bearcat_lift_top"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0
	defer_initialisation = TRUE

/obj/machinery/computer/shuttle_control/lift
	name = "cargo lift controls"
	shuttle_tag = "Cargo Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = FALSE

/obj/effect/shuttle_landmark/lift/top
	name = "Top Deck"
	landmark_tag = "nav_bearcat_lift_top"
	flags = SLANDMARK_FLAG_AUTOSET

/obj/effect/shuttle_landmark/lift/bottom
	name = "Lower Deck"
	landmark_tag = "nav_bearcat_lift_bottom"
	base_area = /area/ship/scrap/cargo/lower
	base_turf = /turf/simulated/floor

/obj/machinery/power/apc/derelict
	cell_type = /obj/item/cell/crap/empty
	locked = 0
	coverlocked = 0

/obj/machinery/door/airlock/autoname/command
	door_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/autoname/engineering
	door_color = COLOR_AMBER

/obj/effect/landmark/deadcap
	name = "Dead Captain"

/obj/effect/landmark/deadcap/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/landmark/deadcap/LateInitialize()
	var/turf/T = get_turf(src)
	var/mob/living/carbon/human/corpse = new(T)
	scramble(1, corpse, 100)
	corpse.real_name = "Captain"
	corpse.name = "Captain"
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/deadcap)
	outfit.equip(corpse)
	corpse.adjustOxyLoss(corpse.maxHealth)
	corpse.setBrainLoss(corpse.maxHealth)
	var/obj/structure/bed/chair/C = locate() in T
	if (C)
		C.buckle_mob(corpse)
	qdel(src)

/decl/hierarchy/outfit/deadcap
	name = "Derelict Captain"
	uniform = /obj/item/clothing/under/casual_pants/classicjeans
	suit = /obj/item/clothing/suit/storage/hooded/wintercoat
	shoes = /obj/item/clothing/shoes/black
	r_pocket = /obj/item/device/radio/map_preset/bearcat

/decl/hierarchy/outfit/deadcap/post_equip(mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/toggleable/hawaii/random/eyegore = new()
		if(uniform.can_attach_accessory(eyegore))
			uniform.attach_accessory(null, eyegore)
		else
			qdel(eyegore)
	var/obj/item/cell/super/C = new()
	H.put_in_any_hand_if_possible(C)
