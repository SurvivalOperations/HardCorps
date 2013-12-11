/****************************************************************************
Copyright (C) 2013 Maca134
This program is free software under the terms of the GNU General Public License version 3.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
@authors maca134.co.uk
@version 1.00
@date 20130707
*****************************************************************************/
private ["_laptop", "_camera_objs", "_player_camera", "_get_pos", "_get_dir", "_cam", "_first_cam", "_x", "_y", "_z", "_cam_next", "_cam_rotateplus", "_cam_rotateminus", "_cam_quit", "_loop", "_cam_i", "_cams_n", "_inc", "_next_cam", "_dir", "_nv"];

CCTV_pan_angle = 45; // Angle the camera moves left to right
CCTV_tilt_angle = 15; // Angle the camera is tilted down
CCTV_time_int = 3; // Time the camera holds
CCTV_radius = 50000; // Radius which notebooks detect cameras

// END OF CONFIG
CCTV_NEXT = true;
CCTV_QUIT = false;
CCTV_NV = false;
CCTV_TER = false;

_laptop = _this select 3;
_camera_objs = nearestObjects [_laptop, ["Loudspeaker"], CCTV_radius];
_player_camera = cameraView;

if ((count _camera_objs) < 1) exitWith {
	titleText ["No cctv cameras around...","PLAIN DOWN"];
	titleFadeOut 4;
};

_cam_span_targets = {
	private ["_obj", "_pos", "_dir", "_pos1", "_pos2", "_return", "_x", "_y", "_z"];
	_obj = _this select 0;
	_pos = getPos _obj;
	_dir = [_obj] call _get_dir;
	_x = _pos select 0;
	_y = _pos select 1;
	_z = _pos select 2;
	_pos1 = [_x - 10 * sin(_dir + CCTV_pan_angle), _y - 10 * cos(_dir + CCTV_pan_angle), _z - 10 * tan(CCTV_tilt_angle)];
	_pos2 = [_x - 10 * sin(_dir - CCTV_pan_angle), _y - 10 * cos(_dir - CCTV_pan_angle), _z - 10 * tan(CCTV_tilt_angle)];
	_return = [_pos1, _pos2];
	_return;
};

_get_pos = {
	private ["_obj", "_pos", "_dir", "_x", "_y", "_z"];
	_obj = _this select 0;
	_pos = getPos _obj;
	_dir = ([_obj] call _get_dir) + 180;
	if (_dir < 0.0) then {
		_dir = _dir + 360.0;
	};
	if (_dir > 360.0) then {
		_dir = _dir - 360.0;
	};
	
	_x = _pos select 0;
	_y = _pos select 1;
	_z = _pos select 2;

	_pos = [_x + 0.3 * sin(_dir), _y  + 0.3 * cos(_dir), _z];
	_pos;
};

_get_dir = {
	private ["_obj", "_dir"];
	_obj = _this select 0;
	_dir = getdir _obj;
	_dir;
};

"Camera Instructions" hintC ["Space: Next Camera", "Enter: Exit", "T: Toggle Thermal", "N: Toggle Night Vision"];

_cam_next = 	(findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0x39) then {CCTV_NEXT = true;};"];
_cam_quit = 	(findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0x1C) then {CCTV_QUIT = true;};"];
_cam_nv = 		(findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0x31) then {CCTV_NV = true;};"];
_cam_ter = 		(findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0x14) then {CCTV_TER = true;};"];

_loop = true;
_cam_i = 0;
_cams_n = count _camera_objs;
_inc = 20;
_nv = false;
_ter = false;

while {_loop} do {
	if (CCTV_NEXT) then {
		if (_cam_i > ((count _camera_objs) - 1)) then {
			_cam_i = 0;
		};
		_next_cam = _camera_objs select _cam_i;
		if (!isNil "_cam") then {
			camDestroy _cam;
		};

		_cam = "camera" camCreate ([_next_cam] call _get_pos);
		_positions = [_next_cam] call _cam_span_targets;
		_cam camSetTarget (_positions select 0);
		camUseNVG false;
		false setCamUseTi 7;
		_cam camCommit 0;
		waitUntil {camCommitted _cam};

		_cam cameraEffect ["internal","back"];

		if (!isNil "_movehandle") then {
			terminate _movehandle;
		};
		_movehandle = [_cam, _positions] execVM "cctv\move.sqf";

		titleText [ format["Viewing camera %1 of %2", (_cam_i + 1), _cams_n],"PLAIN DOWN"];
		titleFadeOut 4;

		CCTV_NEXT = false;
		_cam_i = _cam_i + 1;
	};

	if (CCTV_NV) then {
		if (_nv) then {
			camUseNVG false;
			_nv = false;
		} else {
			camUseNVG true;
			_nv = true;
		};
		CCTV_NV = false;
	};
	
	if (CCTV_TER) then {
		if (_ter) then {
			camUseNVG false;
			false setCamUseTi 7; 
			_ter = false;
		} else {
			camUseNVG true;
			true setCamUseTi 7; 
			_ter = true;
		};
		CCTV_TER = false;
	};

	if (CCTV_QUIT) then {
		(findDisplay 46) displayRemoveEventHandler ["MouseButtonUp", _cam_next];
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", _cam_quit];
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", _cam_nv];
		if (!isNil "_movehandle") then {
			terminate _movehandle;
		};
		_cam cameraEffect ["terminate","back"];
		camDestroy _cam;	
		_loop = false;
		CCTV_QUIT = false;
	};
};