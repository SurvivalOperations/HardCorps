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
_ammo addweaponcargo ["ACE_M110_SD",1];

//AMMO ONLY
_ammo addmagazinecargo ["ACE_20Rnd_762x51_T_M110", 2];
_ammo addmagazinecargo ["ACE_20Rnd_762x51_SB_M110", 2];
_ammo addBackpackCargo ["MAV_RAVEN_BACKPACK",1];
//ITEMS ONLY


//BACKPACKS ONLY
sleep 1500000;
};