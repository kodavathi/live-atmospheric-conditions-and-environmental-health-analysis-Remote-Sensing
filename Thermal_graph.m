%thermal graph
inputFolder = uigetdir;
outputFolder = uigetdir;
while true
    files = dir(fullfile(inputFolder, '*.jpg'));
    if ~isempty(files)
        for file = files'
            filepath = fullfile(inputFolder, file.name);
            thermal_gray = rgb2gray(imread(filepath));
            roi_temperature = improfile(thermal_gray, [100, 300], [100, 100]);
            plot(roi_temperature, 'r');
            xlabel('Distance (pixels)');
            ylabel('Temperature (°C)');
            title('Thermal Curve Graph');
            graphFilename = [strrep(file.name, '.jpg', '') '_thermal_graph.jpg'];
            saveas(gcf, fullfile(outputFolder, graphFilename));
            disp(['Processed ' file.name ', output saved as ' graphFilename]);
        end
    else
        disp('No new files found. Waiting for new files...');
    end
    pause(10); % Pause for 10 seconds
end