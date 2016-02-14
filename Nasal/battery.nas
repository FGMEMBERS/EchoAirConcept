##########################################################
#######Batteries won't get lighter when unloading - so let's fix it! ;)#########
#basic setup
setlistener("/sim/signals/fdm-initialized", func {
    settimer(update_battery,5);
    print("Battery System ... ok");
});



update_battery= func {
var full=100.45;
#battery 1
var tank1=getprop("/consumables/fuel/tank/level-lbs");
var extraweight1 = full-tank1;
setprop("/consumables/fuel/tank/extra-weight-lbs", extraweight1);
#battery 2
var tank2=getprop("/consumables/fuel/tank[1]/level-lbs");
var extraweight2=full-tank2;
setprop("/consumables/fuel/tank[1]/extra-weight-lbs", extraweight2);
#battery 3
var tank3=getprop("/consumables/fuel/tank[2]/level-lbs");
var extraweight3=full-tank3;
setprop("/consumables/fuel/tank[2]/extra-weight-lbs", extraweight3);
settimer(update_battery, 0);
}
