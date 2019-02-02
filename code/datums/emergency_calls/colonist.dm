

//Blank colonist ERT for admin stuff.
/datum/emergency_call/colonist
	name = "Colonists"
	mob_max = 8
	mob_min = 1
	arrival_message = "Incoming Transmission: 'This is the *static*. We are *static*.'"
	objectives = "Follow the orders given to you."
	probability = 0
	var/preset = "Colonist"


/datum/emergency_call/colonist/create_member(datum/mind/M) //Blank ERT with only basic items.
	set waitfor = 0
	var/turf/T = get_spawn_point()

	if(!istype(T)) r_FAL

	var/mob/living/carbon/human/H = new(T)
	H.key = M.key
	if(H.client) H.client.change_view(world.view)
	ticker.mode.traitors += H.mind
	arm_equipment(H, preset, TRUE)

	sleep(20)
	if(H && H.loc)
		H << "<span class='role_header'>You are a colonist!</span>"
		H << "<span class='role_body'>You have been put into the game by a staff member. Please follow all staff instructions.</span>"

/datum/emergency_call/colonist/engineers
	name = "Colonists - Engineers"
	preset = "Colonist - Engineer"

/datum/emergency_call/colonist/security
	name = "Colonists - Security"
	preset = "Colonist - Security"

/datum/emergency_call/colonist/doctors
	name = "Colonists - Doctors"
	preset = "Colonist - Doctor"