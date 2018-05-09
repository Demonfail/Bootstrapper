if ( BOOTSTRAPPER_SHOW_DEBUG ) {
	
	var _names_string = "";
	var _status_string = "";
	
    var _size = ds_map_size( global.bootstrapper_finished_map );
    var _package = ds_map_find_first( global.bootstrapper_finished_map );
	for( var _i = 0; _i < _size; _i++ ) {
        
		_names_string += "\"" + _package + "\"";
		_status_string += "state=" + string( global.bootstrapper_finished_map[? _package ] );
		
		if ( _i < _size-1 ) {
			_names_string += "\n";
			_status_string += "\n";
		}
        
        _package = ds_map_find_next( global.bootstrapper_finished_map, _package );
		
	}
	
	var _spacing = string_width( _names_string ) + 40;
	
	draw_text( 10, 10, BOOTSTRAPPER_INFO + "\niteration=" + string( iterations ) + ", " + last_script );
	draw_text( 10, 70, _names_string );
	draw_text( 10 + _spacing, 70, _status_string );
	
}