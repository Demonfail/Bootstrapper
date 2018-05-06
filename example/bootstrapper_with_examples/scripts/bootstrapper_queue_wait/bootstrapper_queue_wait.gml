/// @desc Queues a script with a priority relative to the current priority. Mostly for use in wait loops.
/// @param package_name
/// @param script
/// @param [priority_decrement]

var _package_name = argument[0];
var _script       = argument[1];
var _decrement    = ((argument_count < 3) || (argument[2] == undefined))? 1 : argument[2];

var _phase = bootstrapper_get_current_priority() - _decrement;
bootstrapper_queue( _package_name, _script, _phase );
return _phase;