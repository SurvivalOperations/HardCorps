//HardCorps AMMO CRATE filler
//ONLY SPAWNS UPON RESTART
// _refill = [cratename] execVM "ammo.sqf"

_ammo = _this select 0;
while {true} do
{
_ammo setdamage 0;

clearmagazinecargo _ammo;
clearweaponcargo _ammo;

//WEAPONS ONLY
_ammo addweaponcargo [""RH_hk417sdsp"",1];
_ammo addweaponcargo [

//AMMO ONLY
_ammo addmagazinecargo ["RH_20Rnd_762x51_SD_hk417", 3];
_ammo addmagazinecargo ["ACE_Flashbang",2];

//ITEMS ONLY
_ammo addweaponcargo ["ItemGPS",1];


//BACKPACKS ONLY
_ammo addBackpackCargo ["DZ_Backpack_EP1",1];
_ammo addBackpackCargo ["MAV_RAVEN_BACKPACK",1]
sleep 150000;
};