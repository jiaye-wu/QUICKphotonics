function [paraunit, unit_detected, unit_name] = funcCheckLengthUnit(command)
    unit_detected = false;
    unit_name = 'error';
    paraunit = 0;
    if contains(command, 'pm')
        unit_detected = true;
        paraunit = 1e-12;
        unit_name = 'pm';
        return;
    end
    if contains(command, 'nm')
        unit_detected = true;
        paraunit = 1e-9;
        unit_name = 'nm';
        return;
    end
    if contains(command, 'um')
        unit_detected = true;
        paraunit = 1e-6;
        unit_name = 'micron (um)';
        return;
    end
    if contains(command, 'mm')
        unit_detected = true;
        paraunit = 1e-3;
        unit_name = 'mm';
        return;
    end
    if contains(command, 'cm')
        unit_detected = true;
        paraunit = 1e-2;
        unit_name = 'cm';
        return;
    end
    if contains(command, 'dm')
        unit_detected = true;
        paraunit = 1e-1;
        unit_name = 'dm';
        return;
    end
    if contains(command, 'km')
        unit_detected = true;
        paraunit = 1e3;
        unit_name = 'km';
        return;
    end
    if contains(command, 'Mm')
        unit_detected = true;
        paraunit = 1e6;
        unit_name = 'Mm';
        return;
    end
    if contains(command, 'Gm')
        unit_detected = true;
        paraunit = 1e9;
        unit_name = 'Gm';
        return;
    end
    if contains(command, 'm') && ~unit_detected
        unit_detected = true;
        paraunit = 1;
        unit_name = 'm';
    end
end