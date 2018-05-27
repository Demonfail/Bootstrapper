//  Please read "Making A Package" in __bootstrapper_readme()

//  Step 1) "The package must use gml_pragma( "global", ... ) to execute a boot script"
gml_pragma( "global", "__example_b_init()" );

//  Step 2) "The boot script must only define variables essential to the package's operation"
//  Example B has no variables to define :o

//  Step 3) "If further processing is needed, the boot script may queue a script or create a job instance"
//  For this example, we'll create an instance. This is often termed a "job instance".
//  
//  It's not possible to create an instance using the normal functions when using gml_pragma( "global" )
//  Instead we use bootstrapper_instance_create().
//  This script handles instance creation for us. Depending on when this script is called it either:
//  1) If we're still in the boot phase, it uses room_instance_add() to add an instance to the first room;
//  2) Otheriwse iT uses instance_create_depth(), with a depth of 0.
//  To prevent errors, this instance is created as a singleton by default (though this can be switched off).
bootstrapper_instance_create( "Example B", oExampleB );

//  Step 4) "The package must declare when the entire initialisation process for that package has finished"
//  oExampleB handles setting the package finished flag.