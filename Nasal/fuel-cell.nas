##########################################################
#######Electrical system for Xray#########
#basic setup
setlistener("/sim/signals/fdm-initialized", func {
    settimer(update_electric,5);
    print("Eletrical engine System ... ok");
});

#start fuel cell if battery switch and fuel cell switch are on.
setlistener("/controls/electric/fuel-cell", func {
if(getprop("/controls/electric/battery-switch") == 1){
setprop("systems/electrical/fuel-cell", 1);
}
    });


#engine master switch toggles starter till engine starts
setlistener("/controls/engines/engine[0]/master-switch", func {
setprop("/controls/engines/engine[0]/starter", 1);
    });


update_electric = func {
if(getprop("/systems/electrical/volts")<6){
setprop("/instrumentation/efis/off", 1);
}
if(getprop("engines/engine[0]/running") == 1){
setprop("/controls/engines/engine[0]/starter", 0);
 }
if(getprop("/controls/engines/engine[0]/master-switch") == 0){
setprop("/controls/engines/engine[0]/starter", 0);
 }
settimer(update_electric, 0);
}
