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
_ammo addweaponcargo ["BAF_L110A1_Aim",1];
_ammo addweaponcargo ["UZI_SD_EP1",2];

//AMMO ONLY
_ammo addmagazinecargo ["20Rnd_762x51_B_SCAR", 4];
_ammo addmagazinecargo ["200Rnd_556x45_L110A1", 3];
_ammo addmagazinecargo ["30Rnd_9x19_UZI_SD", 6];
_ammo addmagazinecargo ["SmokeShell",4];
_ammo addmagazinecargo ["HandGrenade_West",2];

//ITEMS ONLY
_ammo addweaponcargo ["ACE_GlassesBalaklava",2];
_ammo addweaponcargo ["ACE_GlassesGasMask2_US", 2];

//BACKPACKS ONLY
_ammo addweaponcargo ["ACE_AssaultPack_BAF",1];
_ammo addweaponcargo ["ACE_Backpack_Multicam",2];
sleep 1500000;
};