#define INVITELISTFILE "config/invite.txt"

var/global/list/invitelist = list()

/hook/startup/proc/loadInvitelist()
	if(config.configinvitelist)
		load_invitelist()
	return 1

/proc/load_invitelist()
	invitelist = file2list(INVITELISTFILE)
	if(!invitelist.len)	invitelist = null

/proc/check_invitelist(mob/M /*, var/rank*/)
	if(!invitelist)
		return 0
	return ("[M.ckey]" in invitelist)

#undef INVITELISTFILE
