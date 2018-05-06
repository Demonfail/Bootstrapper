/// @param package_name
/// @param [package_name...]

//  Make sure we have the necessary data structures in place for scripts to interface with
__bootstrapper_create_data_structures();

//  This script can only be run after the bootstrapper has started resolving packages
if ( !global.bootstrapper_resolving ) {
    show_error( "ERROR: bootstrapper_check_dependencies() can only be called\nafter the bootstrapper has started resolving packages.\n ", true );
}

for( var _i = 0; _i < argument_count; _i++ ) {
    if ( bootstrapper_get_package_state( argument[_i] ) == E_BOOTSTRAPPER_STATE.NOT_FOUND ) {
        return false;
    }
}

return true;