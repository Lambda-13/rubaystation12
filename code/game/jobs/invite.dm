var/global/list/invitelist = list()

/hook/startup/proc/loadInvitelist()
	if(config.configinvitelist)
		load_invitelist()
	else
		return 1

/proc/load_invitelist()
	var/text = file2text("config/invite.txt")
	if (!text)
		log_misc("Failed to load config/invite.txt")
		return 0
	else
		invitelist = splittext(text, "\n")
		return 1
