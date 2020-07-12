//if place_meeting(x,y,player) {
//	var ragDoll = instance_create_layer(x,y,"Instances",ragdoll)
//	ragDoll.bodyparts = bodyparts
//	ragDoll.spawnRagdoll()
//	instance_destroy()
//}

if instance_position(x,y,ball) {
	var ragDoll = instance_create_layer(x,y,"Instances",ragdoll)
	ragDoll.bodyparts = bodyparts
	ragDoll.image_xscale = image_xscale
	ragDoll.spawnRagdoll()
	instance_destroy()	
}