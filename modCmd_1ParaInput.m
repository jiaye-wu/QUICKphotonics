function [inputError, isExit] = modCmd_1ParaInput(tokens)
    isExit = false;
    inputError = true;
    current_ver = fileread("Version.txt");
    if strcmp(tokens, 'exit') || strcmp(tokens, 'close')
        isExit = true;
        inputError = false;
        disp("Thank you for using QUICKphotonics!")
        disp(" ")
        return;
    end
    if strcmp(tokens, 'changelog')
        funcTextUI(2);
        inputError = false;
    end
    if strcmp(tokens, 'functions') || strcmp(tokens, 'help') || strcmp(tokens, 'commands') || strcmp(tokens, 'flexiCommand') || strcmp(tokens, 'flexiCMD')
        funcTextUI(3);
        inputError = false;
    end
    if strcmp(tokens, 'help-ol') || strcmp(tokens, 'help-online')
        web('https://github.com/jiaye-wu/QUICKphotonics/blob/main/README.md', '-browser');
        disp("A browser page on tool description (https://github.com/jiaye-wu/QUICKphotonics/blob/main/README.md) is open.")
        inputError = false;
    end
    if strcmp(tokens, 'help-md') || strcmp(tokens, 'help-markdown')
        funcExtOpenUI('README.md');
        disp("A markdown file on tool description (README.md) is open. Please DO NOT modify its contents!")
        inputError = false;
    end
    if strcmp(tokens, 'credits') || strcmp(tokens, 'license') || strcmp(tokens, 'licence') || strcmp(tokens, 'about') || strcmp(tokens, 'info') 
        funcTextUI(4);
        inputError = false;
    end
    if strcmp(tokens, 'constants')
        funcTextUI(5);
        inputError = false;
    end
    if strcmp(tokens, 'Excel') || strcmp(tokens, 'excel')
        funcExtOpenUI('QUICKphotonics Excel.xltx');
        disp("QUICKphotonics Excel launched!")
        inputError = false;
    end
    if strcmp(tokens, 'blog')
        web('https://jiaye-wu.github.io/blog/2024/dev-QUICKphotonics/', '-browser');
        disp("A browser page of project blog (https://jiaye-wu.github.io/blog/2024/dev-QUICKphotonics/) is open.")
        inputError = false;
    end
    if strcmp(tokens, 'update') || strcmp(tokens, 'upgrade')
        web('https://github.com/jiaye-wu/QUICKphotonics/releases', '-browser');
        disp("A browser page on latest releases (https://github.com/jiaye-wu/QUICKphotonics/releases) is open.")
        msg_pre = "The current version is " + current_ver + ".";
        disp(msg_pre)
        inputError = false;
    end
    if strcmp(tokens, 'github') || strcmp(tokens, 'GitHub') || strcmp(tokens, 'project')
        web('https://github.com/jiaye-wu/QUICKphotonics', '-browser');
        disp("The GitHub project page (https://github.com/jiaye-wu/QUICKphotonics) is open.")
        inputError = false;
    end
    if strcmp(tokens, 'clear') || strcmp(tokens, 'restart')
        funcTextUI(0, current_ver);
        inputError = false;
    end
    if strcmp(tokens, 'version') || strcmp(tokens, 'ver')
        msg_pre = "The current version is " + current_ver + ".";
        disp(msg_pre)
        disp("To check for updates, type 'update' or 'upgrade'.")
        inputError = false;
    end
end