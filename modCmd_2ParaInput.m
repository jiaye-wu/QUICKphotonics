function inputError = modCmd_2ParaInput(command, value)
    inputError = true;
    h_planck = 6.62607015e-34;
    e_charge = 1.60217663e-19;
    clight = 299792458;

    %% wavelength - frequency - time conversion
    if startsWith(command, 'wl') && contains(command, '2freq')
        [wlunit, unit_detected1, unit_name1] = funcCheckLengthUnit(command);
        [frequnit, unit_detected2, unit_name2] = funcCheckFreqUnit(command);
        if ~unit_detected1 || ~unit_detected2
            funcErrorUI(2);
            return;
        else                
            freq = funcConvert_WlFreq(value, wlunit, frequnit);
            disp(num2str(value) + " " + unit_name1 + " converts to " + num2str(freq) + " " + unit_name2 + ".")
            inputError = false;
        end
    end
    if startsWith(command, 'freq') && contains(command, '2wl')
        [wlunit, unit_detected1, unit_name1] = funcCheckLengthUnit(command);
        [frequnit, unit_detected2, unit_name2] = funcCheckFreqUnit(command);
        if ~unit_detected1 || ~unit_detected2
            funcErrorUI(2);
            return;
        else
            wl = funcConvert_WlFreq(value, frequnit, wlunit);
            disp(num2str(value) + " " + unit_name2 + " converts to " + num2str(wl) + " " + unit_name1 + ".")
            inputError = false;
        end
    end
    if startsWith(command, 'freq') && contains(command, '2t')
        [Tunit, unit_detected1, unit_name1] = funcCheckTimeUnit(command);
        [frequnit, unit_detected2, unit_name2] = funcCheckFreqUnit(command);
        if ~unit_detected1 || ~unit_detected2
            funcErrorUI(2);
            return;
        else
            Ttime = funcConvert_FreqT(value, frequnit, Tunit);
            disp(num2str(value) + " " + unit_name2 + " converts to " + num2str(Ttime) + " " + unit_name1 + ".")
            inputError = false;
        end
    end
    if startsWith(command, 't') && contains(command, '2freq')
        [Tunit, unit_detected1, unit_name1] = funcCheckTimeUnit(command);
        [frequnit, unit_detected2, unit_name2] = funcCheckFreqUnit(command);
        if ~unit_detected1 || ~unit_detected2
            funcErrorUI(2);
            return;
        else
            freq = funcConvert_FreqT(value, Tunit, frequnit);
            disp(num2str(value) + " " + unit_name1 + " converts to " + num2str(freq) + " " + unit_name2 + ".")
            inputError = false;
        end
    end
    
    %% Power conversion
    if startsWith(command, 'power')
        if contains(command, 'W2dBm')
            [powerunit, unit_detected1, unit_name1] = funcCheckmWUnit(command);
            if ~unit_detected1
                funcErrorUI(2);
                return;
            else
                p_dBm = 10 .* log10(value .* powerunit / 1);
                unit_name2 = 'dBm';
                disp(num2str(value) + " " + unit_name1 + " converts to " + num2str(p_dBm) + " " + unit_name2 + ".")
                inputError = false;
            end
        end
        if contains(command, 'dBm2')
            [powerunit, unit_detected1, unit_name2] = funcCheckmWUnit(command);
            if ~unit_detected1
                funcErrorUI(2);
                return;
            else
                p_mW = 10 ^ (value/10);
                p_lin = p_mW ./ powerunit;
                unit_name1 = 'dBm';
                disp(num2str(value) + " " + unit_name1 + " converts to " + num2str(p_lin) + " " + unit_name2 + ".")
                inputError = false;
            end
        end
    end

    %% Decibel conversion
    if startsWith(command, 'lin2dB')
        v_dB = 10 .* log10(value);
        unit_name1 = '';
        unit_name2 = 'dB';
        disp("Factor of " + num2str(value) + " converts to " + num2str(v_dB) + " " + unit_name2 + ".")
        inputError = false;
    end
    if startsWith(command, 'dB2lin')
        v_lin = 10 ^ (value/10);
        unit_name1 = 'dB';
        unit_name2 = '';
        disp(num2str(value) + " " + unit_name1 + " converts to a factor of " + num2str(v_lin) + ".")
        inputError = false;
    end

    %% Photon energy conversion
    if startsWith(command, 'photon') && contains(command, '2E')
        [energyunit, unit_detected2, unit_name2] = funcCheckEnergyUnit(command, true);
        if ~unit_detected2
            funcErrorUI(2);
            return;
        end            
        if contains(command, 'freq')
            if contains(command, 'afreq')
                E_photon = h_planck ./ (2*pi) .* value ./ energyunit;
                unit_name1 = 'rad/s';                
                disp("The photon with " + num2str(value) + " " + unit_name1 + " has energy of " + num2str(E_photon) + " " + unit_name2 + ".")
                inputError = false;
            else
                [frequnit, unit_detected1, unit_name1] = funcCheckFreqUnit(command);
                if ~unit_detected1
                    funcErrorUI(2);
                    return;
                else
                    E_photon = h_planck .* value .* frequnit ./ energyunit;
                    disp("The photon with " + num2str(value) + " " + unit_name1 + " has energy of " + num2str(E_photon) + " " + unit_name2 + ".")
                    inputError = false;
                end
            end
        end
        if contains(command, 'wl')
            [wlunit, unit_detected1, unit_name1] = funcCheckLengthUnit(command);
            if ~unit_detected1
                funcErrorUI(2);
                return;
            else
                E_photon = h_planck .* funcConvert_WlFreq(value, wlunit, 1) ./ energyunit;
                disp("The photon with " + num2str(value) + " " + unit_name1 + " has energy of " + num2str(E_photon) + " " + unit_name2 + ".")
                inputError = false;
            end
        end
    end
    if startsWith(command, 'photonE') && contains(command, '2')
        [energyunit, unit_detected2, unit_name2] = funcCheckEnergyUnit(command, true);
        if ~unit_detected2
            funcErrorUI(2);
            return;
        end            
        if contains(command, 'freq')
            if contains(command, 'afreq')
                omega = (2*pi) .* value .* energyunit ./ h_planck;
                unit_name1 = 'rad/s';                
                disp("The photon of " + num2str(value) + " " + unit_name2 + " has angular frequency of " + num2str(omega) + " " + unit_name1 + ".")
                inputError = false;
            else
                [frequnit, unit_detected1, unit_name1] = funcCheckFreqUnit(command);
                if ~unit_detected1
                    funcErrorUI(2);
                    return;
                else
                    freq = value .* energyunit ./ h_planck ./ frequnit;
                    disp("The photon of " + num2str(value) + " " + unit_name2 + " has frequency of " + num2str(freq) + " " + unit_name1 + ".")
                    inputError = false;
                end
            end
        end
        if contains(command, 'wl')
            [wlunit, unit_detected1, unit_name1] = funcCheckLengthUnit(command);
            if ~unit_detected1
                funcErrorUI(2);
                return;
            else
                wavelength = h_planck .* clight ./ (value .* energyunit) ./ wlunit;
                disp("The photon of " + num2str(value) + " " + unit_name2 + " has wavelength of " + num2str(wavelength) + " " + unit_name1 + ".")
                inputError = false;
            end
        end
    end

    %% J and eV conversion
    if startsWith(command, 'energy') && contains(command, '2eV')
        [energyunit, unit_detected1, unit_name1] = funcCheckEnergyUnit(command, false);
        if ~unit_detected1
            funcErrorUI(2);
            return;
        else
            unit_name2 = 'eV';
            E_eV = value .* energyunit ./ e_charge;
            disp(num2str(value) + " " + unit_name1 + " converts to " + num2str(E_eV) + " " + unit_name2 + ".")
            inputError = false;
        end
    end
    if startsWith(command, 'energy') && contains(command, 'eV2')
        [energyunit, unit_detected2, unit_name2] = funcCheckEnergyUnit(command, false);
        if ~unit_detected2
            funcErrorUI(2);
            return;
        else
            unit_name1 = 'eV';
            E_normal = value .* e_charge ./ energyunit;
            disp(num2str(value) + " " + unit_name1 + " converts to " + num2str(E_normal) + " " + unit_name2 + ".")
            inputError = false;
        end
    end

end