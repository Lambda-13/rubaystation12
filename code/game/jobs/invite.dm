#define INVITELISTFILE "data/invite.txt"

var/global/list/invite = list()

/hook/startup/proc/loadInvitelist()
	if(config.useinvitelist)
		load_invitelist()
	return 1

/proc/load_invitelist()
	invitelist = file2list(INVITELISTFILE)
	if(!invitelist.len)	invitelist = null

/proc/check_invitelist(mob/M /*, var/rank*/)
	if(!invitelist)
		return 0
	return ("[M.ckey]" in invitelist)

/proc/invitelist_lookup(var/item, var/ckey)
	if(!alien_invitelist)
		return 0

	if(config.usealieninvitelistSQL)
		//SQL Invitelist
		if(!(ckey in alien_invitelist))
			return 0;
		var/list/invitelisted = alien_invitelist[ckey]
		if(lowertext(item) in invitelisted)
			return 1
	else
		//Config File Invitelist
		for(var/s in alien_invitelist)
			if(findtext(s,"[ckey] - [item]"))
				return 1
			if(findtext(s,"[ckey] - All"))
				return 1
	return 0

#undef INVITELISTFILE
