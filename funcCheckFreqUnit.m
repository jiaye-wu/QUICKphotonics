function [paraunit, unit_detected, unit_name] = funcCheckFreqUnit(command)
    unit_detected = false;
    unit_name = 'error';
    paraunit = 0;
    if contains(command, 'kHz')
        unit_detected = true;
        paraunit = 1e3;
        unit_name = 'kHz';
        return;
    end
    if contains(command, 'MHz')
        unit_detected = true;
        paraunit = 1e6;
        unit_name = 'MHz';
        return;
    end
    if contains(command, 'GHz')
        unit_detected = true;
        paraunit = 1e9;
        unit_name = 'GHz';
        return;
    end
    if contains(command, 'THz')
        unit_detected = true;
        paraunit = 1e12;
        unit_name = 'THz';
        return;
    end    
    if contains(command, 'Hz') && ~unit_detected
        unit_detected = true;
        paraunit = 1;
        unit_name = 'Hz';
        return;
    end
end