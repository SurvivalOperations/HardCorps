private ["_playerPos","_item","_location","_config","_text","_dir","_dis","_sfx","_consumetext","_stashname","_stashtype","_stash","_consume","_hasitemcount","_worldspace"];

//check if can pitch here
call gear_ui_init;
closeDialog 1;

if (r_action_count != 1) exitWith { cutText [localize "str_player_actionslimit", "PLAIN DOWN"]; };

//Player Pos
_playerPos = getPosATL player;

//Classname
_item = _this;

//Config
_config = configFile >> "CFGWeapons" >> _item;
_text = getText (_config >> "displayName");
_stashtype = "0";
_consume = getText (_config >> "consume");
_consumetext = getText (configFile >> "CfgMagazines" >> _consume >> "displayName");


_hasitemcount = {_x == _consume} count magazines player;

//if ("ItemSandbag" in magazines player) then { _stashtype = "StashMedium"; };

//if (_hasitemcount == 0) exitwith {};
if (_hasitemcount == 1) then { _stashtype = getText (_config >> "stashsmall"); };
if (_hasitemcount >= 2) then { _stashtype = getText (_config >> "stashmedium"); };
_stashname = getText (configFile >> "CfgVehicles" >> _stashtype >> "displayName");

// Items are missing
if ((!(_consume IN magazines player))) exitWith {
	r_action_count = 0;
	cutText [format[(localize "str_player_31_stash"),_consumetext] , "PLAIN DOWN"];
};

_location = player modeltoworld [0,2.5,0];
_location set [2,0];

//blocked
	if (["concrete",dayz_surfaceType] call fnc_inString) exitwith {
		r_action_count = 0;
		diag_log ("surface concrete");
	};

_worldspace = [_stashtype, player] call fn_niceSpot;

if ((count _worldspace) == 2) then {

	player removeMagazine _consume;
	if (_hasitemcount >= 2) then {
		player removeMagazine _consume;
	};
	_dir = round(direction player);

	//wait a bit
	player playActionNow "Medic";
	sleep 1;

	_dis=20;
	_sfx = "tentunpack";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
	[player,_dis,true,(getPosATL player)] call player_alertZombies;

	sleep 5;
	//place tent (local)
	_stash = createVehicle [_stashtype, _location, [], 0, "CAN_COLLIDE"];
	_stash setdir _dir;
	_stash setpos _location;
	player reveal _stash;
	_location = getPosATL _stash;

	_stash setVariable ["characterID",dayz_characterID,true];
	PVDZ_obj_Publish = [dayz_characterID,_stash,[_dir,_location],_stashtype];

	publicVariableServer "PVDZ_obj_Publish";

	r_action_count = 0;
	cutText [format[(localize "str_success_stash_pitch"),_stashname], "PLAIN DOWN"];
	//cutText [format[(localize "str_player_31_missingtools"),_config,_consume,(localize "str_player_31_build")] , "PLAIN DOWN"];
} else {
	r_action_count = 0;
	cutText [format[(localize "str_fail_stash_pitch"),_stashname], "PLAIN DOWN"];
};
