function inputError = modCmd_3ParaInput(command, value1, value2)
    inputError = true;
    clight = 299792458;

    %% wavelength - frequency conversion
    if startsWith(command, 'dwl') && contains(command, '2dfreq')
        [wlunit, unit_detected1, unit_name1] = funcCheckLengthUnit(command);
        [frequnit, unit_detected2, unit_name2] = funcCheckFreqUnit(command);
        if ~unit_detected1 || ~unit_detected2
            funcErrorUI(2);
            return;
        else
            if contains(command, '@wl')
                dfreq = funcConvert_WlFreq(value2, wlunit, frequnit) .* (value1./value2);
                disp(num2str(value1) + " " + unit_name1 + " difference at " + num2str(value2) + " " + unit_name1 + " converts to " + num2str(dfreq) + " " + unit_name2 + " difference.")
            end
            if contains(command, '@freq')
                dfreq = value2 .* (value1 ./ funcConvert_WlFreq(value2, frequnit, wlunit));
                disp(num2str(value1) + " " + unit_name1 + " difference at " + num2str(value2) + " " + unit_name2 + " converts to " + num2str(dfreq) + " " + unit_name2 + " difference.")
            end
            if ~contains(command, '@')
                dfreq = funcConvert_WlFreq(value1, wlunit, frequnit) - funcConvert_WlFreq(value2, wlunit, frequnit);
                disp("Difference between " + num2str(value1) + " " + unit_name1 + " and " + num2str(value2) + " " + unit_name1 + " is " + num2str(dfreq) + " " + unit_name2 + ".")
            end
            inputError = false;
        end
    end
    if startsWith(command, 'dfreq') && contains(command, '2dwl')
        [frequnit, unit_detected1, unit_name1] = funcCheckFreqUnit(command);
        [wlunit, unit_detected2, unit_name2] = funcCheckLengthUnit(command);
        if ~unit_detected1 || ~unit_detected2
            funcErrorUI(2);
            return;
        else
            if contains(command, '@freq')
                dwl = funcConvert_WlFreq(value2, frequnit, wlunit) .* (value1./value2);
                disp(num2str(value1) + " " + unit_name1 + " difference at " + num2str(value2) + " " + unit_name1 + " converts to " + num2str(dwl) + " " + unit_name2 + " difference.")
            end
            if contains(command, '@wl')
                dwl = value2 .* (value1 ./ funcConvert_WlFreq(value2, wlunit, frequnit));
                disp(num2str(value1) + " " + unit_name1 + " difference at " + num2str(value2) + " " + unit_name2 + " converts to " + num2str(dwl) + " " + unit_name2 + " difference.")
            end
            if ~contains(command, '@')
                dwl = funcConvert_WlFreq(value1, wlunit, frequnit) - funcConvert_WlFreq(value2, wlunit, frequnit);
                disp("Difference between " + num2str(value1) + " " + unit_name1 + " and " + num2str(value2) + " " + unit_name1 + " is " + num2str(dwl) + " " + unit_name2 + ".")
            end
            inputError = false;
        end
    end
    
    %% Wavenumber conversion
    if contains(command, '2wn')
        if contains(command, 'wl')
            [wlunit, unit_detected1, unit_name1] = funcCheckLengthUnit(command);
            if ~unit_detected1
                funcErrorUI(2);
                return;
            else
                wavenum = 2 .* pi .* value1 ./ (value2 .* wlunit);
                unit_name2 = 'm^-1';
                disp(num2str(value2) + " " + unit_name1 + " in a n = " + num2str(value1) + " medium corresponds to a wavenumber of " + num2str(wavenum) + " " + unit_name2 + ".")
                inputError = false;
            end
        end
        if contains(command, 'freq')            
            unit_name2 = 'm^-1';
            if contains(command, 'afreq')
                unit_name1 = 'rad/s';
                wavenum = value1 .* value2 ./ clight;
                disp(num2str(value2) + " " + unit_name1 + " in a n = " + num2str(value1) + " medium corresponds to a wavenumber of " + num2str(wavenum) + " " + unit_name2 + ".")
                inputError = false;
            else
                [frequnit, unit_detected1, unit_name1] = funcCheckFreqUnit(command);
                if ~unit_detected1
                    funcErrorUI(2);
                    return;
                else
                    wavenum = 2 .* pi .* value1 .* (value2 .* frequnit) ./ clight;
                    disp(num2str(value2) + " " + unit_name1 + " in a n = " + num2str(value1) + " medium corresponds to a wavenumber of " + num2str(wavenum) + " " + unit_name2 + ".")
                    inputError = false;
                end
            end
        end
    end

    %% Cavity FSR conversion
    if startsWith(command, 'cav')
        if contains(command, '2freq')
            [frequnit, unit_detected2, unit_name2] = funcCheckFreqUnit(command);
            [lenunit, unit_detected1, unit_name1] = funcCheckLengthUnit(command);
            if ~unit_detected1 || ~unit_detected2
                funcErrorUI(2);
                return;
            else
                cavfreq = clight ./ (2 .* value1 .* value2 .* lenunit) ./ frequnit;
                cavfreq_loop = clight ./ (value1 .* value2 .* lenunit) ./ frequnit;
                disp(num2str(value2) + "-" + unit_name1 + "-long cavity with n = " + num2str(value1) + " medium has a FSR of " + num2str(cavfreq) + " " + unit_name2 + " for Fabry-Perot and " + num2str(cavfreq_loop) + " " + unit_name2 + " for loop cavity.")
                inputError = false;
            end
        end
        if contains(command, '2t')
            [tunit, unit_detected2, unit_name2] = funcCheckTimeUnit(command);
            [lenunit, unit_detected1, unit_name1] = funcCheckLengthUnit(command);
            if ~unit_detected1 || ~unit_detected2
                funcErrorUI(2);
                return;
            else
                cavfreq = (2 .* value1 .* value2 .* lenunit) ./ clight ./ tunit;
                cavfreq_loop = (value1 .* value2 .* lenunit) ./ clight ./ tunit;
                disp(num2str(value2) + "-" + unit_name1 + "-long cavity with n = " + num2str(value1) + " medium has a period of " + num2str(cavfreq) + " " + unit_name2 + " for Fabry-Perot and " + num2str(cavfreq_loop) + " " + unit_name2 + " for loop cavity.")
                inputError = false;
            end
        end
    end

    %% Cavity length conversion
    if contains(command, '2cav')
        if contains(command, 'freq')
            [frequnit, unit_detected1, unit_name1] = funcCheckFreqUnit(command);
            [lenunit, unit_detected2, unit_name2] = funcCheckLengthUnit(command);
            if ~unit_detected1 || ~unit_detected2
                funcErrorUI(2);
                return;
            else
                cavlen = clight ./ (2 .* value1 .* value2 .* frequnit) ./ lenunit;
                cavlen_loop = clight ./ (value1 .* value2 .* frequnit) ./ lenunit;
                disp("Cavity with a FSR of " + num2str(value2) + " " + unit_name1 + " and n = " + num2str(value1) + " medium has a length of " + num2str(cavlen) + " " + unit_name2 + " for Fabry-Perot and " + num2str(cavlen_loop) + " " + unit_name2 + " for loop cavity.")
                inputError = false;
            end
        end
        if contains(command, 't')
            [tunit, unit_detected1, unit_name1] = funcCheckTimeUnit(command);
            [lenunit, unit_detected2, unit_name2] = funcCheckLengthUnit(command);
            if ~unit_detected1 || ~unit_detected2
                funcErrorUI(2);
                return;
            else
                cavlen = (value2 .* tunit .* clight) ./ (2 .* value1) ./ lenunit;
                cavlen_loop = (value2 .* tunit .* clight) ./ value1 ./ lenunit;
                disp("Cavity with a period of " + num2str(value2) + " " + unit_name1 + "and n = " + num2str(value1) + " medium has a length of " + num2str(cavlen) + " " + unit_name2 + " for Fabry-Perot and " + num2str(cavlen_loop) + " " + unit_name2 + " for loop cavity.")
                inputError = false;
            end
        end
    end

end