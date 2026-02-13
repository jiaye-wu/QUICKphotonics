function [paraunit, unit_detected, unit_name] = funcCheckEnergyUnit(command, include_ev)
    unit_detected = false;
    unit_name = 'error';
    paraunit = 0;
    if contains(command, 'eV') && include_ev
        unit_detected = true;
        paraunit = 1.60217663e-19;
        unit_name = 'eV';
        return;
    end
    if contains(command, 'fJ')
        unit_detected = true;
        paraunit = 1e-15;
        unit_name = 'fJ';
        return;
    end
    if contains(command, 'pJ')
        unit_detected = true;
        paraunit = 1e-12;
        unit_name = 'pJ';
        return;
    end
    if contains(command, 'nJ')
        unit_detected = true;
        paraunit = 1e-9;
        unit_name = 'nJ';
        return;
    end
    if contains(command, 'uJ')
        unit_detected = true;
        paraunit = 1e-6;
        unit_name = 'microjoule (uJ)';
        return;
    end
    if contains(command, 'mJ')
        unit_detected = true;
        paraunit = 1e-3;
        unit_name = 'mJ';
        return;
    end
    if contains(command, 'kJ')
        unit_detected = true;
        paraunit = 1e3;
        unit_name = 'kJ';
        return;
    end
    if contains(command, 'MJ')
        unit_detected = true;
        paraunit = 1e6;
        unit_name = 'MJ';
        return;
    end
    if contains(command, 'GJ')
        unit_detected = true;
        paraunit = 1e9;
        unit_name = 'GJ';
        return;
    end
    if contains(command, 'J') && ~unit_detected
        unit_detected = true;
        paraunit = 1;
        unit_name = 'J';
    end
end