//  Execute this script on boot
gml_pragma( "global", "__bootstrapper_init()" );

//  Create the bootstrapper object in the first room
//  The bootstrapper object runs __bootstrapper_resolve() every frame to execute scripts
room_instance_add( room_first, 0, 0, oBootstrapper );

//  Make sure we have the necessary data structures in place
__bootstrapper_create_data_structures();