%thermal image
inputFolder = uigetdir();
outputFolder = uigetdir();
while true
 files = dir(fullfile(inputFolder, '*.jpg'));
 if ~isempty(files)
 parfor i = 1:numel(files)
 filename = files(i).name;
 filepath = fullfile(inputFolder, filename);
 
 inputedimage = imread(filepath);
 grayscaleimageconersion = rgb2gray(inputedimage);
 thermalcolormaptoconvert = jet(256);
 outputimage = ind2rgb(gray2ind(grayscaleimageconersion, 256),thermalcolormaptoconvert);
 
 [~, name, ext] = fileparts(filename);
 outputFilename = [name '_thermal' ext];
 imwrite(outputimage, fullfile(outputFolder, outputFilename));
 end
 end
 pause(20);
end
