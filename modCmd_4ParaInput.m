function inputError = modCmd_4ParaInput(command, value1, value2, value3)
    inputError = true;

    %% Fresnel reflections
    if startsWith(command, 'reflect') 
        if contains(command, 'DEG')
            rangle = deg2rad(value3);
            unit_name = 'degrees';
        else
            rangle = value3;
            unit_name = 'radian';
        end
        n1 = value1;
        n2 = value2;
        R_s = abs((n1 .* cos(rangle) - n2 .* sqrt(1 - (n1 ./ n2 .* sin(rangle)).^2)) ./ (n1 .* cos(rangle) + n2 .* sqrt(1 - (n1 ./ n2 .* sin(rangle)).^2))).^2;
        R_p = abs((n1 .* sqrt(1 - (n1 ./ n2 .* sin(rangle)).^2) - n2 .* cos(rangle)) ./ (n1 .* sqrt(1 - (n1 ./ n2 .* sin(rangle)).^2) + n2 .* cos(rangle))).^2;
        R_eff = 0.5 .* (R_s + R_p);
        disp("The interface between n1 = " + num2str(value1) + " and n2 = " + num2str(value2) + " at an incident angle of " + num2str(value3) + " " + unit_name + " has R_s = " + num2str(R_s) + ", R_p = " + num2str(R_p) + ", and R_eff = " + num2str(R_eff) + ".")
        inputError = false;
    end
    
    %% Pulsed laser
    if startsWith(command, 'peak') && contains(command, '2pavg')
        [frequnit, unit_detected1, unit_name1] = funcCheckFreqUnit(command); % reprate
        [tunit, unit_detected2, unit_name2] = funcCheckTimeUnit(command); % temporal width
        [~, unit_detected3, unit_name3] = funcCheckPowerUnit(command); % power unit
        if ~unit_detected3
            unit_name3 = '(a.u.)/unit_area';
        else
            unit_name3 = unit_name3 + "/unit_area";
        end
        if ~unit_detected1 || ~unit_detected2
            funcErrorUI(2);
            return;
        else            
            P_peak = value1;
            t_pulse = value2;
            f_rep = value3;
            P_avg = P_peak .* (t_pulse .* tunit) .* (f_rep .* frequnit);
            disp("Pulsed laser with a peak power of " + num2str(value1) + " " + unit_name3 + ", a temporal width of " + num2str(value2) + " " + unit_name2 + ", and a repetition rate of " + num2str(value3) + " " + unit_name1 + " has an average power of " + num2str(P_avg) + " " + unit_name3 + ".")
            inputError = false;
        end
    end
    if startsWith(command, 'pavg') && contains(command, '2peak')
        [frequnit, unit_detected1, unit_name1] = funcCheckFreqUnit(command); % reprate
        [tunit, unit_detected2, unit_name2] = funcCheckTimeUnit(command); % temporal width
        [~, unit_detected3, unit_name3] = funcCheckPowerUnit(command); % power unit
        if ~unit_detected3
            unit_name3 = '(a.u.)/unit_area';
        else
            unit_name3 = unit_name3 + "/unit_area";
        end
        if ~unit_detected1 || ~unit_detected2
            funcErrorUI(2);
            return;
        else
            P_avg = value1;
            t_pulse = value2;
            f_rep = value3;
            P_peak = P_avg ./ (t_pulse .* tunit) ./ (f_rep .* frequnit);
            disp("Pulsed laser with an average power of " + num2str(value1) + " " + unit_name3 + ", a temporal width of " + num2str(value2) + " " + unit_name2 + ", and a repetition rate of " + num2str(value3) + " " + unit_name1 + " has a peak power of " + num2str(P_peak) + " " + unit_name3 + ".")
            inputError = false;
        end
    end

end