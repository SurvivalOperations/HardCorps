if (!isServer) exitwith { "VientoGlobal" addPublicVariableEventHandler { setWind ((_this select 1) + [true]);};}; // El control lo lleva el server

private["_VientoX","_VientoY","_WindPower","_WindDir","_NextSleep"];

VientoGlobal=[0,0];
_WindPower=1;
_WindDir=0;

_VientoX=_WindPower * (sin _WindDir);
_VientoY=_WindPower * (cos _WindDir);

while {true} do // bucle de control del viento
{
    if ((random 1) > 0.4) then // 60% de posibilidades
    {
        _WindPower= random 2; //viento suave
        _WindDir=_WindDir - round(random 20);
    } else {
        if ((random 1) > 0.2) then // 80% de posibilidades
        {
            _WindPower= random 7; // viento moderado
            _WindDir=_WindDir + round((random 20)+(random 20));
        } else {
            // 20% de 40% es decir muy pocas poss
            if ((random 1) > 0.5) then // 50% de posibilidades
            {
                _WindPower=0; // calma momentanea
            } else {
                if ((random 1) > 0.2) then
                {
                    _WindPower=10;//ventolera
                } else {
                    _WindPower=20;//huracan xD
                };
            };
        };
    };

    if ((abs _WindDir) > 360) then { _WindDir = 0;}; // es tonteria que se valla a numeros desorvitados

    if (!isDedicated) then    {
        player sidechat format ["VIENTO potencia: %1 , direccion: %2",_WindPower,_WindDir];
    };

    _VientoX=_WindPower * (sin _WindDir);
    _VientoY=_WindPower * (cos _WindDir);

    VientoGlobal=[_VientoX,_VientoY];
    setWind (VientoGlobal + [true]);
    publicvariable "VientoGlobal";

    //Control de potencia, hacemos que los vientos fuertes duren menos
    if (_WindPower >2) then
    {
        if (_WindPower >5) then
        {
            if (_WindPower >7) then
            {
                _NextSleep=(random 15); //vientos mayores de 7
            } else {
                _NextSleep=(random 30); //vientos entre 5 y 7
            };
        }else {
            _NextSleep=(random 45); //vientos entre 3 y 5
        };
    }else {
        _NextSleep=(random 60); //vientos menores de 3
    };

    sleep (18 + _NextSleep);
};