/datum/mob_descriptor/height
	name = "высота"
	standalone_value_descriptors = list(
		"дварф",
		"маленький",
		"нормальный",
		"высокий",
		"тонкий"
		)
	comparative_value_descriptor_equivalent = "примерно такого же роста, как ты"
	comparative_value_descriptors_smaller = list(
		"немного ниже тебя",
		"ниже тебя",
		"намного ниже чем ты",
		"по сравнению с тобой он очень маленький"
		)
	comparative_value_descriptors_larger = list(
		"немного выше тебя",
		"выше тебя",
		"намного выше чем ты",
		"по сравнению с тобой он очень большой"
		)
	var/list/scale_effect = list(
		SPECIES_HUMAN = list(-7, -4, 0, 4, 7)
	)

/datum/mob_descriptor/build
	name = "телосложение"
	comparative_value_descriptor_equivalent = "примерно такого же телосложения, как ты"
	standalone_value_descriptors = list(
		"худощавый",
		"худой",
		"среднее телосложение",
		"сложеный",
		"грузный"
		)
	comparative_value_descriptors_smaller = list(
		"телосложение немного меньше моего",
		"телосложение меньше моего",
		"телосложение намного меньше моего",
		"я затмеваю его"
		)
	comparative_value_descriptors_larger = list(
		"телосложение немного больше моего",
		"телосложение больше моего",
		"телосложение намного больше моего",
		"он затмевает меня"
		)
	var/list/scale_effect = list(
		//SPECIES_TAG_DEFINE = list(lowest, low, middle, high, highest)<,>
	)
