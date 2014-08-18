local _M = {
	gettime = require "luatz.gettime" ;
	parse = require "luatz.parse" ;
	strftime = require "luatz.strftime" ;
	timetable = require "luatz.timetable" ;
	tzcache = require "luatz.tzcache" ;
}

--- Top-level aliases for common functions

_M.time = _M.gettime.gettime
_M.get_tz = _M.tzcache.get_tz

--- Handy functions

_M.time_in = function ( tz , now )
	return _M.get_tz ( tz ):localize ( now )
end

--- C-like functions

_M.gmtime = function ( ts )
	return _M.timetable.new_from_timestamp ( ts ):normalise ( )
end

_M.localtime = function ( ts )
	ts = _M.time_in ( nil , ts )
	return _M.gmtime ( ts )
end

_M.ctime = function ( ts )
	return _M.localtime ( ts ):asctime ( )
end

return _M
