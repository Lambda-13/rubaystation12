/area/ship/torch_extra
	name = "Generic Ship"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')

/area/ship/torch_extra/crew
	name = "Crew Compartements"
	icon_state = "crew_quarters"

/area/hallway/torch_extra
	name = "Коридор"
	icon_state = "crew_quarters"

/area/hallway/torch_extra/hallway
	name = "Коридор - 2 этаж"
	icon_state = "crew_quarters"

/area/hallway/torch_extra/crew/hallway/port
	name = "Коридор - Левый борт"

/area/hallway/torch_extra/crew/hallway/starboard
	name = "Коридор - Правый борт"

/area/ship/torch_extra/crew/kitchen
	name = "Galley"
	icon_state = "kitchen"

/area/ship/torch_extra/crew/cryo
	name = "Cryo Storage"
	icon_state = "cryo"

/area/ship/torch_extra/crew/dorms1
	name = "Crew Cabin #1"
	icon_state = "green"

/area/ship/torch_extra/crew/dorms2
	name = "Crew Cabin #2"
	icon_state = "purple"

/area/ship/torch_extra/crew/dorms3
	name = "Crew Cabin #3"
	icon_state = "yellow"

/area/ship/torch_extra/crew/saloon
	name = "Saloon"
	icon_state = "conference"

/area/ship/torch_extra/crew/toilets
	name = "Bathrooms"
	icon_state = "toilet"
	turf_initializer = /decl/turf_initializer/maintenance

/area/ship/torch_extra/crew/wash
	name = "Washroom"
	icon_state = "locker"

/area/ship/torch_extra/crew/medbay
	name = "Medical Bay"
	icon_state = "medbay"

/area/ship/torch_extra/cargo
	name = "Cargo Hold"
	icon_state = "quartstorage"

/area/ship/torch_extra/cargo/lower
	name = "Lower Cargo Hold"

/area/ship/torch_extra/dock
	name = "Docking Bay"
	icon_state = "entry_1"

/area/ship/torch_extra/fire
	name = "Firefighting Equipment Comparment"
	icon_state = "green"

/area/ship/torch_extra/tcomms
	name = "Telecomms Compartment"
	icon_state = "yellow"

/area/ship/torch_extra/hidden
	name = "Unknown" //shielded compartment
	icon_state = "auxstorage"

/area/ship/torch_extra/escape_port
	name = "Port Escape Pods"
	icon_state = "green"

/area/ship/torch_extra/escape_star
	name = "Starboard Escape Pods"
	icon_state = "yellow"

/area/ship/torch_extra/broken1
	name = "Robotic Maintenance"
	icon_state = "green"

/area/ship/torch_extra/broken2
	name = "Compartment 1-B"
	icon_state = "yellow"

/area/ship/torch_extra/gambling
	name = "Compartment 1-C"
	icon_state = "cave"

/area/ship/torch_extra/maintenance
	name = "Maintenance Compartments"
	icon_state = "amaint"
	req_access = list(access_bearcat)

/area/hallway/torch_extra/maintenance
	name = "Maintenance Corridors"

/area/ship/torch_extra/maintenance/lower
	name = "Lower Deck Maintenance Compartments"
	icon_state = "sub_maint_aft"

/area/ship/torch_extra/maintenance/storage
	name = "Tools Storage"
	icon_state = "engineering_storage"

/area/ship/torch_extra/maintenance/techstorage
	name = "Parts Storage"
	icon_state = "engineering_supply"

/area/ship/torch_extra/maintenance/eva
	name = "EVA Storage"
	icon_state = "eva"

/area/ship/torch_extra/maintenance/engineering
	name = "Engineering Bay"
	icon_state = "engineering_supply"

/area/ship/torch_extra/maintenance/atmos
	name = "Atmospherics Comparment"
	icon_state = "atmos"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambiatm1.ogg')

/area/ship/torch_extra/maintenance/power
	name = "Power Compartment"
	icon_state = "engine_smes"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')

/area/ship/torch_extra/maintenance/engine
	icon_state = "engine"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')

/area/ship/torch_extra/maintenance/engine/aft
	name = "Main Engine Bay"

/area/ship/torch_extra/maintenance/engine/port
	name = "Port Thruster"

/area/ship/torch_extra/maintenance/engine/starboard
	name = "Starboard Thruster"

/area/hallway/torch_extra/command
	name = "Command Deck"
	icon_state = "centcom"
	req_access = list(access_bearcat)

/area/ship/torch_extra/command/bridge
	name = "Bridge"
	icon_state = "bridge"
	req_access = list(access_bearcat)

/area/ship/torch_extra/command/captain
	name = "Captain's Quarters"
	icon_state = "captain"
	req_access = list(access_bearcat_captain)

/area/ship/torch_extra/comms
	name = "Communications Relay"
	icon_state = "tcomsatcham"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/signal.ogg','sound/ambience/sonar.ogg')

/area/ship/torch_extra/shuttle/lift
  name = "Cargo Lift"
  icon_state = "shuttle3"
  base_turf = /turf/simulated/open
