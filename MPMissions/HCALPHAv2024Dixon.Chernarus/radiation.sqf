while {alive player} do
{
_t = time;
waitUntil {time - _t > 1};
 
if (damage player > 0) then 
{
_newDamage = (damage player) + 0.01;
player setdamage _newDamage;
hint "You are losing health"
};
sleep 0.05;
};