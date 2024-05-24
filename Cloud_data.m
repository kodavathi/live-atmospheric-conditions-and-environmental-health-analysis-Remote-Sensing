%cloud data
input_folder = uigetdir;
output_folder = uigetdir;
while true
    input_files = dir(fullfile(input_folder, '*.jpg'));
    parfor i = 1:numel(input_files)
        if exist(fullfile(output_folder, [input_files(i).name '_segmented_with_info.jpg']), 'file')
            continue;
        end
 
        input_image_path = fullfile(input_folder, input_files(i).name);
        cloud_imag = imread(input_image_path);
        cloud_gray = rgb2gray(cloud_imag); 
        cloud_gray = imadjust(cloud_gray);
        cloud_gray_filtered = medfilt2(cloud_gray);
        edges = edge(cloud_gray_filtered, 'canny');
        edges_filled = imfill(edges, 'holes');
        edges_filled = imclose(edges_filled, strel('disk', 5));
        cc = bwconncomp(edges_filled);
        stats = regionprops(cc, 'Area', 'Centroid');
        fig = figure('Visible', 'off');
        imshow(cloud_imag);
        hold on;
        for j = 1:numel(stats)
            plot(stats(j).Centroid(1), stats(j).Centroid(2), 'r*');
        end
        num_clouds = numel(stats);
        total_area = sum([stats.Area]);
        info_text = sprintf('Number of clouds: %d\nTotal area of clouds: %d', num_clouds, total_area);
        text(1, 5, info_text, 'Color', 'blue', 'FontSize', 15, 'FontWeight', 'bold');
        [~, filename, ~] = fileparts(input_files(i).name);
        output_image_path = fullfile(output_folder, [filename '_segmented_image.jpg']);
        saveas(fig, output_image_path);
        close(fig);
        pause(2);
    end
end