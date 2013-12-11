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
_ammo addweaponcargo ["SCAR_H_LNG_Sniper",1];
_ammo addweaponcargo ["M60A4_EP1",1];
_ammo addweaponcargo ["RH_vz61",1];
_ammo addWeaponCargo ["RH_hk417sglacog",1];

//AMMO ONLY
_ammo addmagazinecargo ["20Rnd_762x51_B_SCAR", 3];
_ammo addmagazinecargo ["100Rnd_762x51_M240", 2];
_ammo addmagazinecargo ["RH_20Rnd_32cal_vz61", 3];
_ammo addmagazinecargo ["SmokeShell",4];
_ammo addmagazinecargo ["HandGrenade_West",4];

//ITEMS ONLY
_ammo addweaponcargo ["ACE_GlassesBalaklava",2];
_ammo addweaponcargo ["ACE_GlassesGasMask2_US", 2];

//BACKPACKS ONLY
_ammo addBackpackCargo ["DZ_Backpack_EP1",1];
sleep 1500000;
};