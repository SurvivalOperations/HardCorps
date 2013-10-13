private ["_camp","_chance","_mkType","_mkPos","_rates","_mkAray"];
// Random Camp (For RADIOs) spawner
// Courtesy of Neon155 - Used similiar script type/changed to handley 1 layout only. 
//See RandomMilbases.sqf for details on random fob spawner

_mkAray = ["camp_1","camp_2","camp_3"];
{
	_x setMarkerAlpha 0;
	_mkType = getMarkerType _x;
	_mkPos = getMarkerPos _x;
	//Random Rates
	_rates = [floor(random 50), floor(random 75), floor(random 100)];
	
switch _mkType do {
// Camps
case "Flag" : {
	_chance = _rates select (round (random count _rates));
		_camp = nearestObjects [_mkPos, ["All"], 120] - nearestObjects [_mkPos, ["Car", "Man", "Truck", "Tank", "Air"], 120];
		if (_chance <=75) then {
			(deleteVehicle _x;) forEach _camp;
		};
	};
};
} forEach _mkAray;;