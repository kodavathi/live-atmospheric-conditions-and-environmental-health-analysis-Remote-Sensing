%applying gauss filter for noise reduction

inputFolder= uigetdir();
outputFolder= uigetdir();
while true
    files= dir(fullfile(inputFolder,'*jpg'));
    if ~isempty(files)
        parfor i= 1:numel(files)
            filename=files(i).name;
            filepath= fullfile(inputFolder,filename);

            inputedimage= imread(filepath);
            grayscaleimageconersion= rgb2gray(inputedimage);
            outputimage=imgaussfilt(grayscaleimageconersion,2);

            [~,name,ext]=fileparts(filepath);
            outputFilename= [name '_filter' ext];
            imwrite(outputimage,fullfile(outputFolder,outputFilename))
        end
    end
    pause(20);
end