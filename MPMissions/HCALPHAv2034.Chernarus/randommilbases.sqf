if (!isServer) exitWith {};
private ["_smlBase","_smlChance","_medBase","_medChance","_highBase","_highChance","_mkrType","_mkrPos","_smlRates","_medRates","_highRates","_mkrRay"];
/* 
STEAM: Neon155
DESC: Script to randomize bases for Survival Ops Hard Corps
INSTRUCTIONS:
Places Bases on map, place following markers in middle of base:
	Strongpoint - small loot		Yellow
	Depot - medium loot				White
	City - high loot				Red
Markers need to be added into the ray "_mkray" so that the script will look for through them.  Color is not
important but it helps to stay organized.  The type does matter, and more markers can be added into the code
so that there can be four values or more spawning in randomly.
	Set rates for the spawn in the area below, the more certain numbers overlap, the more often they will be and
the rarer the outliers become.  50, 75, and 100 means that: less than 50 is 3x more common than above 75 and
above 50 is twice as common as above one hundred. Could also look at, Rate Rand # - <= # = chance#-1, so that: 0% 
chance, 1% chance, 25% chance.  I hope that made sense, I only used whole numbers instead of decimals since
decimals take up four characters instead of two.  Whole numbers work fine, it's the same stuff.
*/
_mkrRay = ["small_1", "small_2", "small_3", "small_4", "small_5", "small_6", "small_7", "medium_1", "medium_2", "medium_3", "medium_4", "high_1", "high_2", "high_3"];
{ 
	_x setMarkerAlpha 0;
	_mkrType = getMarkerType _x;
	_mkrPos = getMarkerPos _x;
	// Random Rates for EVERY base
	_smlRates = [floor (random 50), floor (random 75), floor (random 100)];
	_medRates = [floor (random 50), floor (random 75), floor (random 100)];
	_highRates = [floor (random 50), floor (random 75), floor (random 100)];
	switch _mkrType do {
		//small
		case "Strongpoint" :	{	
			_smlChance = _smlRates select (round (random count _smlRates));	
              _smlBase = nearestObjects [_mkrPos, ["All"], 120] - nearestObjects [_mkrPos, ["Car", "Man", "Truck", "Tank", "Air"], 120];
			if (_smlChance <= 50) then {
				{deleteVehicle _x;} forEach _smlBase;
			};
		};

		//medium
		case "Depot" : {
			_medChance = _medRates select (round (random count _medRates));
			_medBase = nearestObjects [_mkrPos, ["All"], 120] - nearestObjects [_mkrPos, ["Car", "Man", "Truck", "Tank", "Air"], 120];
            if (_medChance <= 75) then {
				{deleteVehicle _x;} forEach _medBase;
			};	
		};

		//high
		case "City" : {			
			_highChance = _highRates select (round (random count _highRates));
              _highBase = nearestObjects [_mkrPos, ["All"], 120] - nearestObjects [_mkrPos, ["Car", "Man", "Truck", "Tank", "Air"], 120];
            if ( _highChance <= 100) then {
				{deleteVehicle _x;} forEach _highBase;
			};
		};
	};
} forEach _mkrRay;