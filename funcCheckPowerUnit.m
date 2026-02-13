function [paraunit, unit_detected, unit_name] = funcCheckPowerUnit(command) % with repect to W
    unit_detected = false;
    unit_name = 'error';
    paraunit = 0;
    if contains(command, 'fW')
        unit_detected = true;
        paraunit = 1e-15;
        unit_name = 'fW';
        return;
    end
    if contains(command, 'pW')
        unit_detected = true;
        paraunit = 1e-12;
        unit_name = 'pW';
        return;
    end
    if contains(command, 'nW')
        unit_detected = true;
        paraunit = 1e-9;
        unit_name = 'nW';
        return;
    end    
    if contains(command, 'uW')
        unit_detected = true;
        paraunit = 1e-6;
        unit_name = 'microwatt (uW)';
        return;
    end  
    if contains(command, 'mW')
        unit_detected = true;
        paraunit = 1e-3;
        unit_name = 'mW';
        return;
    end   
    if contains(command, 'kW')
        unit_detected = true;
        paraunit = 1e3;
        unit_name = 'kW';
        return;
    end   
    if contains(command, 'MW')
        unit_detected = true;
        paraunit = 1e6;
        unit_name = 'MW';
        return;
    end
    if contains(command, 'GW')
        unit_detected = true;
        paraunit = 1e9;
        unit_name = 'GW';
        return;
    end
    if contains(command, 'W') && ~unit_detected
        unit_detected = true;
        paraunit = 1;
        unit_name = 'W';
        return;
    end
end