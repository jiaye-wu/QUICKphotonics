function funcExtOpenUI(filename)

    % 获取当前 App 的所在路径
    appPath = fileparts(mfilename('fullpath'));
    
    % 组合文件路径，假设你要打开 'myfile.md' 文件
    filePath = fullfile(appPath, filename);
    
    % 判断文件是否存在，避免错误
    if exist(filePath, 'file')
        filePathWithQuotes = ['"', filePath, '"'];
        % 根据操作系统打开文件
        if ispc
            system(['start "" ', filePathWithQuotes]);
        elseif ismac
            system(['open ', filePathWithQuotes]);
        elseif isunix
            system(['xdg-open ', filePathWithQuotes]);
        end
    else
        disp("File missing or unsupported OS!");
    end

end