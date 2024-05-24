%gas concentration piechart
input_folder = uigetdir;
output_folder = uigetdir;
while true
    image_files = dir(fullfile(input_folder, '*.jpg'));
    for i = 1:numel(image_files)
        image = imread(fullfile(input_folder, image_files(i).name));
        gray_image = rgb2gray(image);
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

        figure('Visible', 'off');
        x=[CO2_concentration NO2_concentration O2_concentration N2_concentration];
        pie(x,{'CO2_concentration' ,'NO2_concentration' ,'O2_concentration ','N2_concentration'})
        title('Gas Concentrations vs Pixel Number');
        output_filename = fullfile(output_folder, image_files(i).name);
        saveas(gcf, output_filename);
        close(gcf);
        
        disp(['Processed and saved: ' image_files(i).name]);

    end

    pause(1);
end