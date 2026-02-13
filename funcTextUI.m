function funcTextUI(msgtype, results)
    if msgtype == 0     % main
        disp(' ')
        disp('======== QUICKphotonics - Quick UnIt Convertion Kit for Photonics ========')
        disp('=== A MATLAB-powered lightweight tool for unit conversion in optics ===')
        disp('=== Copyright 2024 Jiaye Wu at PHOSL, EPFL ===')
        verno = "=== Version " + results + " ===";
        disp(verno)
%         urls = {'https://jiaye-wu.github.io', 'https://jiaye-wu.github.io/2024-QUICKphotonics-project/', 'https://github.com/jiaye-wu/QUICKphotonics', 'https://github.com/jiaye-wu/QUICKphotonics/releases', 'https://github.com/jiaye-wu/QUICKphotonics/blob/main/README.md'};
%         displayTexts = {'Author Website', 'Project Blog', 'GitHub Project Page', 'Check for update', 'Online manual (help document)'};
%         for i = 1:length(urls)
%             fprintf('<a href="%s">%s</a>\n', urls{i}, displayTexts{i});
%         end
%         disp("! No effect on the links? Try typing 'close' after clicking on the links. ")
        disp("* 'excel' to launch QUICKphotonics Excel (Office suite must already be installed).")
        disp("* 'help' for supported commands; 'help-ol' for online help; 'help-md' for local help file.")
        disp("* 'update' to check for new releases; 'blog' for project blog; 'github' for GitHub page.")
        disp("* 'clear' for restart; 'info' for impoartant notes; 'constants' for optical constants; 'exit' for closing the programme.")
        disp("Tips: for the first trial, try 'wlnm2freqTHz 1550' and the combinations in other order.")
        disp(' ')
    end
    if msgtype == 1     % Results
        outinfo = "result: " + results + " in the requested unit.";
        disp(outinfo);
    end
    if msgtype == 2     % Changelog
        fileContent = fileread('Changelog.txt');
        disp(fileContent);
    end
    if msgtype == 3     % Help Functions
        fileContent = fileread('Supported_commands.txt');
        disp(fileContent);        
    end
    if msgtype == 4     % Credits & License & Author info
        fileContent = fileread('Credits.txt');
        disp(fileContent);
    end
    if msgtype == 5     % Optical constants
        fileContent = fileread('Constants.txt');
        disp(fileContent);
    end
end