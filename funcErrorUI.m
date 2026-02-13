function funcErrorUI(errtype)
    if errtype == 1
        disp("Error: unsupported command! Type 'help' or 'functions' to show syntax.")
    end
    if errtype == 2
        disp("Error: at least 1 supported unit is missing. The units are case-sensitive.")
    end
%     disp("The programme continues...")
end