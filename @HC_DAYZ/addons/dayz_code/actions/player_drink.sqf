private ["_onLadder","_itemorignal","_hasdrinkitem","_hasoutput","_config","_text","_invehicle","_sfx","_itemtodrop","_nearByPile","_item","_display","_sfxdis"];

disableserialization;
call gear_ui_init;

_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};

//if (vehicle player != player) exitWith {cutText [localize "str_player_fail_drink", "PLAIN DOWN"]};

//Force players to wait 3 mins to drink again
//if (dayz_lastDrink < 180) exitWith {cutText ["You may not drink, your not thirsty", "PLAIN DOWN"]};

_itemorignal = _this;
_hasdrinkitem = _itemorignal in magazines player;
_hasoutput = _itemorignal in drink_with_output;
_invehicle = false;

_config = configFile >> "CfgMagazines" >> _itemorignal;
_text = getText (_config >> "displayName");

//getting type of sfx (now just drink od soda open and drink)
_sfx = getText (_config >> "sfx");
//Get distance of sfx sound
_sfxdis = getNumber (_config >> "sfxdis");

if (!_hasdrinkitem) exitWith {cutText [format[(localize "str_player_31"),_text,(localize "str_player_31_drink")] , "PLAIN DOWN"]};

if (vehicle player != player) then {
	_display = findDisplay 106;
	_display closeDisplay 0;
	_invehicle = true;
} else {
player playActionNow "PutDown";
};
player removeMagazine _itemorignal;

sleep 1;

if (_itemorignal in no_output_drink) then {
    player addMagazine "ItemWaterbottleUnfilled";
};

[player,_sfx,0,false,_sfxdis] call dayz_zombieSpeak;
[player,_sfxdis,true,(getPosATL player)] call player_alertZombies;

if (_hasoutput and !_invehicle) then {
    // Selecting output
    _itemtodrop = drink_output select (drink_with_output find _itemorignal);

    sleep 3;
    _nearByPile= nearestObjects [(getPosATL player), ["WeaponHolder","WeaponHolderBase"],2];
    if (count _nearByPile ==0) then {
        _item = createVehicle ["WeaponHolder", (getPosATL player), [], 0.0, "CAN_COLLIDE"];
    } else {
        _item = _nearByPile select 0;
    };
    _item addMagazineCargoGlobal [_itemtodrop,1];
	_item setvelocity [0,0,1];
};

//add infection chance for "ItemWaterbottle",
if ((random 15 < 1) and (_itemorignal == "ItemWaterbottle")) then {
    r_player_infected = true;
    player setVariable["USEC_infected",true,true];
};

player setVariable ["messing",[dayz_hunger,dayz_thirst],true];

dayz_lastDrink = time;
dayz_thirst = 0;

//Ensure Control is visible
_display = uiNamespace getVariable 'DAYZ_GUI_display';
(_display displayCtrl 1302) ctrlShow true;

cutText [format[(localize "str_player_consumed"),_text], "PLAIN DOWN"];