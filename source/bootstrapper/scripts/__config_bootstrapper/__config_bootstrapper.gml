//  -- Dev-editable config --

//  Controls how much process data is shown in the Output window.
//  This is useful for debugging dependency behaviours and wait loops.
//  Be warned - this is *very* verbose and it's appropriate for anything but debug.
#macro BOOTSTRAPPER_VERBOSE false

//  The number of frames (one iterations per frame) oBootstrapper will wait until throwing a warning.
//  This is handy for catching dependency loops etc.
//  For long load periods, this will need to be increased.
#macro BOOTSTRAPPER_ITERATIONS_WARNING 250

//  Controls a pedantic start-up for oBootstrapper to make sure it's not being misused.
//  Advanced users can switch this off and mess around with other behaviours if they want.
#macro BOOTSTRAPPER_STARTUP_CHECK true

//  oBootstrapper has a draw_text() debug output that can be shown during initialisation.
//  It's a bit more friendly than pouring over values in GM's native debugger.
#macro BOOTSTRAPPER_SHOW_DEBUG true

//  -- Internal definitions --
#macro BOOTSTRAPPER_VERSION "00.02.00"
#macro BOOTSTRAPPER_INFO "bootstrapper v" + BOOTSTRAPPER_VERSION + ", 2018/05/05, for the GameMakerDiscord GitHub organisation, (c) @jujuadams 2018"
enum E_BOOTSTRAPPER_STATE {
	FAILED    = -2, //Not used
	NOT_FOUND = -1,
	QUEUED    =  0,
	COMPLETE  =  1
}