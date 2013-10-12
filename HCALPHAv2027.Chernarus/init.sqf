startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];
 
//Server Settings
dayZ_instance = 1; // The instance
dayZ_serverName = "SO"; // Servername (country code + server number)
dayz_antihack = 0; // DayZ Antihack / 1 = enabled // 0 = disabled
dayz_REsec = 0; // DayZ RE Security / 1 = enabled // 0 = disabled
dayzHiveRequest = [];
 
//Game Settings
dayz_spawnselection = 0; // DayZ Spawnselection / 1 = enabled // 0 = disabled, No current spawn limits.
dayz_spawnCrashSite_clutterCutter = 0;  // Helicrash Settings / 0 =  loot hidden in grass // 1 = loot lifted // 2 = no grass around the Helicrash
dayz_spawnInfectedSite_clutterCutter = 0; // Infected Base Settings / 0 =  loot hidden in grass // 1 = loot lifted // 2 = no grass around the infected base
 
#include "\z\addons\dayz_code\system\mission\init.sqf"
 
///////////////////////////////////////////////////////////////////////////////////////////
// POI Chernarus - By Bungle
 
[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\villages.sqf";                                                                                                                        // Epoch Trader Villages 1.2
[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\buildings.sqf";                                                                                                                       // Extra Charnarus Buildings 1.2
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\raceday.sqf";                                                                                                                       // Coastal Racetrack 1.1
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\fightyard.sqf";                                                                                                             // Cherno Fightyard 1.0
 
// Race Day and the Fightyard are for events, unless you want them as default.
// Updates and additons on these will be posted seperate and included in future updates.
///////////////////////////////////////////////////////////////////////////////////////////
 
///////////////////////////////////////////////////////////////////////////////////////////
// POI Chernarus - By Team BBC
 
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\Barrage_Dan_BBC.sqf";                                                                                                 // Topolka Dam Military Base
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\BlackLac_Dan_BBC.sqf";                                                                                                        // Black Lake Miltary Base
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\bois1_Dan_BBC.sqf";                                                                                                           // Hidden Killers Ranch
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\LieuxditPenduAto.sqf";                                                                                                        // Wreck Sites
//[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\castle.sqf";                                                                                                                          // The Dead Castle
[] ExecVM "\z\addons\dayz_code\system\mission\map_updates\bridge.sqf"; 

// Upadtes and additons on these will be posted sepearte and included in furture updates.
///////////////////////////////////////////////////////////////////////////////////////////
 
///////////////////////////////////////////////////////////////////////////////////////////
//Above is the custom map you can remove any
///////////////////////////////////////////////////////////////////////////////////////////
//Lights
//[] execVM "custom\tower_lights.sqf";             //Tower lights
//[] execVM "custom\change_streetlights.sqf";     //House lights
 
if (player distance c2 > 500) then {skipTime -1};
 
_handleLoop = []execVM "Complexes\loop.sqf";
 
//if (isserver) then {execVM "oldbases.sqf";};
 
// Add any 3rd party init.sqf scripts here
 
// ---- Start BTK Gasmask 
if (!(isServer) && !(isDedicated) && (player != player) || (isNull player)) then {
  waitUntil {(player == player) && !(isNull player)};
};
BTK = execVM "BTK\Gasmask\start.sqf";

 
[] execVM "wind.sqf"; //Handles Client Wind Deflection//Same Readings

};

///////////////STAMINA
waitUntil {(!isNull player)};
	script = [] execVM "stamina.sqf";
Private["_actionIndex"];
	if (isNil "ACE_SYS_STAMINA_DEBUG") then { ACE_SYS_STAMINA_DEBUG = True };
_actionIndex = [["Toggle Stamina Debug Display", "StaminaDebug.sqf"]] call CBA_fnc_addPlayerAction;
//////////////

waitUntil {player == player};
 
null=[] execVM "randommilbases.sqf";
 
nul = ["GuerillaCacheBox_EP1",["mkr1", "mkr2", "mkr3", "mkr4", "mkr5", "mkr6"]] execVM "rndmkr.sqf";
 
//////////////////////////////////////////////////////////////////////////////////////
//CRATES SECTION ONLY
/////////////////////////////////////////////////////////////////////////////////////
/*
[hidebox_1] execVM "crate\hidebox_1.sqf";
[hidebox_2] execVM "crate\hidebox_2.sqf";
[BunBox_1] execVM "crate\BunBox_1.sqf";
[BunBox_2] execVM "crate\BunBox_2.sqf";
[BunBox_3] execVM "crate\BunBox_3.sqf";
[BunBox_4] execVM "crate\BunBox_4.sqf";
[BunBox_5] execVM "crate\BunBox_5.sqf";
[campbox_1] execVM "crate\radio.sqf";
[campbox_2] execVM "crate\radio.sqf";
[campbox_3] execVM "crate\radio.sqf";
*/
 
////////////////////////////////////////////////////////////////////////////////////
 

///////////////////////////////////////////////////////////////////////////////////////////
// I hope you enjoy the pack thanks to everyone for their contributions.
// If you have any issues please let me know via the post on www.dayzepoch.com
// Special Thanks to the Epoch Development Team for their mod and hard work on the mod.
///////////////////////////////////////////////////////////////////////////////////////////