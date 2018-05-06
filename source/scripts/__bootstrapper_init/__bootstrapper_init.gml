//  Execute this script on boot
gml_pragma( "global", "__bootstrapper_init()" );

//  Make sure the bootstrapper object is created in the first room
//  The bootstrapper object runs __bootstrapper_resolve() every frame to execute initialisation scripts
room_instance_add( room_first, 0, 0, oBootstrapper );

//  Make sure we have the necessary data structures in place for scripts to interface with
__bootstrapper_create_data_structures();