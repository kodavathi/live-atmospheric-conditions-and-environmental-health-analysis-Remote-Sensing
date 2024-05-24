%weather
inputFolder = uigetdir('Select Input Folder');
outputFolder = uigetdir('Select Output Folder');
while true
    imageFiles = dir(fullfile(inputFolder, '*.jpg'));
    for i = 1:numel(imageFiles)
        if ~exist(fullfile(outputFolder, ['msg_box_image_1 ''.png' ' num2str(i) ''.png']), 'file')
            imagePath = fullfile(inputFolder, imageFiles(i).name);
            cloudImage = imread(imagePath);
            grayImage = rgb2gray(cloudImage);
            contrast = std2(grayImage)^2;
            energy = sum(sum(grayImage.^2)) / numel(grayImage);
            homogeneity = sum(sum(1 ./ (1 + (grayImage - mean2(grayImage)).^2))) /numel(grayImage);
            contrasthreshold=50;
            homogeneitythreshold=0.5;
            energythreshold=5.0;
            if energy>energythreshold
                if contrast>contrasthreshold && homogeneity <homogeneitythreshold
                    ctype='stromy/rainy';
                else
                    ctype='rainy and fair';
                end
            else
                if contrast<contrasthreshold && homogeneity >homogeneitythreshold
                    ctype='Fair';
                else
                    ctype='Normal';
                end
            end
            msg = sprintf('Texture Features for Image %d:\nContrast: %f\nEnergy:%f\nHomogeneity: %f\ncloud type: %s', ...
                i, contrast, energy, homogeneity,ctype);
            h = msgbox(msg, 'Texture Features', 'modal');
            pause(1);
            screenshot = getframe(h);
            imwrite(screenshot.cdata, fullfile(outputFolder, ['msg_box_image_' num2str(i) '.png']));
            close(h); % Close the message box after taking the screenshot
        end
   end
    pause(5);
end