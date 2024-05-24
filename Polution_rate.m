%pollution rate
input_folder_path = uigetdir('Select the input folder');
if input_folder_path == 0
    disp('Operation canceled by user.');
    return;
end

output_folder_path = uigetdir('Select the output folder');
if output_folder_path == 0
    disp('Operation canceled by user.');
    return;
end

file_list = dir(fullfile(input_folder_path, '*.jpg'));
if isempty(file_list)
    disp('No JPG files found in the input folder.');
    return;
end

for i = 1:length(file_list)
    filename = fullfile(input_folder_path, file_list(i).name);
    gray_image = imread(filename);

    CO2_threshold = 100;
    CO2_binary_image = gray_image > CO2_threshold;

    NO2_threshold = 150;
    NO2_binary_image = gray_image > NO2_threshold;

    O2_threshold = 200;
    O2_binary_image = gray_image > O2_threshold;

    N2_threshold = 170;
    N2_binary_image = gray_image > N2_threshold;

    CO2_concentration = sum(CO2_binary_image(:)) / numel(CO2_binary_image);
    NO2_concentration = sum(NO2_binary_image(:)) / numel(NO2_binary_image);
    O2_concentration = sum(O2_binary_image(:)) / numel(O2_binary_image);
    N2_concentration = sum(N2_binary_image(:)) / numel(N2_binary_image);

    if CO2_concentration+NO2_concentration>O2_concentration+N2_concentration
        plt='pollution rate more';
    else
        plt='pollution rate less';
    end

    concentration_text = sprintf('CO2: %.6f%%\n\nNO2: %.6f%%\n\nO2: %.6f%%\n\nN2: %.6f%%\n\npollution rate: %s%%\n', ...
        CO2_concentration * 100, NO2_concentration * 100, O2_concentration * 100, N2_concentration * 100,plt);
    
    h = msgbox(concentration_text, 'Concentration Results');
    msgbox_handles = findall(h, 'Type', 'Text');
    set(msgbox_handles, 'FontSize', 9);

    pause(0.5);
    frame = getframe(h);
    msgbox_image = frame.cdata;

    [~, name, ~] = fileparts(filename);
    imwrite(msgbox_image, fullfile(output_folder_path, [name '_msgbox_image.jpg']));
    
    delete(h); % Delete the message box after capturing its image
end
disp('Processing completed.');