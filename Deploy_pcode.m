% 目标文件夹
targetDir = 'pcode_files';
if ~exist(targetDir, 'dir')
    mkdir(targetDir);
end

% 排除列表
excludeFiles = {'Deploy_pcode.m', 'QUICKphotonics.m'}; % 指定排除的文件名
copyFiles = {'Changelog.txt', 'Constants.txt', 'Credits.txt', 'README.md', 'Supported_commands.txt', 'QUICKphotonics.m', 'Version.txt', 'QUICKphotonics Excel.xltx'}; % 指定要复制的文件名

% 获取当前文件夹中的所有 .m 文件
mFiles = dir('*.m');

for i = 1:length(mFiles)
    % 检查文件是否在排除列表中
    if ~ismember(mFiles(i).name, excludeFiles)
        % 获取文件名和路径信息
        [~, name, ~] = fileparts(mFiles(i).name);
        % 生成 .p 文件
        pcode(mFiles(i).name);
        % 移动 .p 文件到目标文件夹
        movefile([name, '.p'], fullfile(targetDir, [name, '.p']));
    end
end

% 复制指定的文件到目标文件夹
for i = 1:length(copyFiles)
    if exist(copyFiles{i}, 'file')
        copyfile(copyFiles{i}, targetDir);
        fprintf('文件 %s 已复制到 %s。\n', copyFiles{i}, targetDir);
    else
        fprintf('文件 %s 不存在。\n', copyFiles{i});
    end
end