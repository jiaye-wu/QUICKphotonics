function QUICKphotonics()
%% QUICKphotonics - Quick UnIt Convertion Kit for Photonics
% For quick unit convertion in optics and photonics in commandline style
% Copyright Jiaye Wu 2024

clear all
close all
format long

VersionQUICK = fileread("Version.txt");
isExit = false;

funcTextUI(0, VersionQUICK);

while ~isExit
    % Get user input    
    user_input = input('convert >> ', 's');    
    tokens = strsplit(user_input);    

    inputError = true;
    
    %% single command
    if length(tokens) == 1
        [inputError, isExit] = modCmd_1ParaInput(tokens{1});
    end

    %% cmd + 1 values
    if length(tokens) == 2
        command = tokens{1};
        value = str2double(tokens{2});        
        inputError = modCmd_2ParaInput(command, value);    
    end

    %% cmd + 2 values
    if length(tokens) == 3
        command = tokens{1};
        value1 = str2double(tokens{2});
        value2 = str2double(tokens{3});
        inputError = modCmd_3ParaInput(command, value1, value2);    
    end

    %% cmd + 3 values
    if length(tokens) == 4
        command = tokens{1};
        value1 = str2double(tokens{2});
        value2 = str2double(tokens{3});
        value3 = str2double(tokens{4});
        inputError = modCmd_4ParaInput(command, value1, value2, value3);    
    end

    if ~isExit
        if inputError
            funcErrorUI(1)
        end
        disp("Press any key to continue. In the next session, type 'close' or 'exit' to end.")
        disp(" ")
        pause
    end
    
end
end