if ( BOOTSTRAPPER_SHOW_DEBUG ) {
	
	var _size = ds_list_size( global.bootstrapper_package_list );
	var _names_string = "";
	var _status_string = "";
	
	for( var _i = 0; _i < _size; _i++ ) {
		var _package_name = global.bootstrapper_package_list[| _i ];
		
		_names_string += _package_name;
		_status_string += "state=" + string( bootstrapper_get_package_state( _package_name ) );
		
		if ( _i < _size-1 ) {
			_names_string += "\n";
			_status_string += "\n";
		}
		
	}
	
	var _spacing = string_width( _names_string ) + 20;
	
	draw_text( 10, 10, BOOTSTRAPPER_INFO + "\niteration=" + string( iterations ) + ", " + last_script + ", priority=" + string( bootstrapper_get_current_priority() ) );
	draw_text( 10, 70, _names_string );
	draw_text( 10 + _spacing, 70, _status_string );
	
}