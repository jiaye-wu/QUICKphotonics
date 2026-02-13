function [paraunit, unit_detected, unit_name] = funcCheckTimeUnit(command)
    unit_detected = false;
    unit_name = 'error';
    paraunit = 0;
    if contains(command, 'as')
        unit_detected = true;
        paraunit = 1e-18;
        unit_name = 'as';
        return;
    end
    if contains(command, 'fs')
        unit_detected = true;
        paraunit = 1e-15;
        unit_name = 'fs';
        return;
    end
    if contains(command, 'ps')
        unit_detected = true;
        paraunit = 1e-12;
        unit_name = 'ps';
        return;
    end
    if contains(command, 'ns')
        unit_detected = true;
        paraunit = 1e-9;
        unit_name = 'ns';
        return;
    end    
    if contains(command, 'us')
        unit_detected = true;
        paraunit = 1e-6;
        unit_name = 'microsecond (us)';
        return;
    end  
    if contains(command, 'ms')
        unit_detected = true;
        paraunit = 1e-3;
        unit_name = 'ms';
        return;
    end   
    if contains(command, 's') && ~unit_detected
        unit_detected = true;
        paraunit = 1;
        unit_name = 'sec';
        return;
    end
end