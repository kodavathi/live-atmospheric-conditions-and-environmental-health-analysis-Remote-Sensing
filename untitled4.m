%Main progam
input1='C:/Users/ADMIN/Desktop/New folder (2)/original img';
input2='C:/Users/ADMIN/Desktop/New folder (2)/filtered img';
input3='C:/Users/ADMIN/Desktop/New folder (2)/no of cloud';
input4='C:/Users/ADMIN/Desktop/New folder (2)/cld prop';
input5='C:/Users/ADMIN/Desktop/New folder (2)/pollution';
input6='C:/Users/ADMIN/Desktop/New folder (2)/pollution gp';
input7='C:/Users/ADMIN/Desktop/New folder (2)/pie chart';
input8='C:/Users/ADMIN/Desktop/New folder (2)/thermal';
input9='C:/Users/ADMIN/Desktop/New folder (2)/thermal gp';
figure;
sgtitle('atmospheric conditions and environmental health analysis')
counter1=1;
counter2=1;
counter3=1;
counter4=1;
counter5=1;
counter6=1;
counter7=1;
counter8=1;
counter9=1;

while true
    files1=dir(fullfile(input1,'*jpg'));
    files2=dir(fullfile(input2,'*jpg'));
    files3=dir(fullfile(input3,'*jpg'));
    files4=dir(fullfile(input4,'*png'));
    files5=dir(fullfile(input5,'*jpg'));
    files6=dir(fullfile(input6,'*jpg'));
    files7=dir(fullfile(input7,'*jpg'));
    files8=dir(fullfile(input8,'*jpg'));
    files9=dir(fullfile(input9,'*jpg'));

    if counter1<=numel(files1)
        filename1=files1(counter1).name;
        filepath1=fullfile(input1,filename1);
        img1=imread(filepath1);
        subplot(3,3,1);
        imshow(img1);
        title('original image');
        counter1=counter1+1;
    end

    if counter2<=numel(files2)
        filename2=files2(counter2).name;
        filepath2=fullfile(input2,filename2);
        img2=imread(filepath2);
        subplot(3,3,2);
        imshow(img2);
        title('filtered image');
        counter2=counter2+1;
    end

    if counter3<=numel(files3)
        filename3=files3(counter3).name;
        filepath3=fullfile(input3,filename3);
        img3=imread(filepath3);
        subplot(3,3,3);
        imshow(img3);
        title('number of clouds');
        counter3=counter3+1;
    end

    if counter4<=numel(files4)
        filename4=files4(counter4).name;
        filepath4=fullfile(input4,filename4);
        img4=imread(filepath4);
        subplot(3,3,4);
        imshow(img4);
        title('atmosphere analysis');
        counter4=counter4+1;
    end

    if counter5<=numel(files5)
        filename5=files5(counter5).name;
        filepath5=fullfile(input5,filename5);
        img5=imread(filepath5);
        subplot(3,3,5);
        imshow(img5);
        title('pollution');
        counter5=counter5+1;
    end

    if counter6<=numel(files6)
        filename6=files6(counter6).name;
        filepath6=fullfile(input6,filename6);
        img6=imread(filepath6);
        subplot(3,3,6);
        imshow(img6);
        title('pollution gp');
        counter6=counter6+1;
    end

    if counter7<=numel(files7)
        filename7=files7(counter7).name;
        filepath7=fullfile(input7,filename7);
        img7=imread(filepath7);
        subplot(3,3,7);
        imshow(img7);
        title('pollution piechart');
        counter7=counter7+1;
    end

    if counter8<=numel(files8)
        filename8=files8(counter8).name;
        filepath8=fullfile(input8,filename8);
        img8=imread(filepath8);
        subplot(3,3,8);
        imshow(img8);
        title('thermal image');
        counter8=counter8+1;
    end

    if counter9<=numel(files9)
        filename9=files9(counter9).name;
        filepath9=fullfile(input9,filename9);
        img9=imread(filepath9);
        subplot(3,3,9);
        imshow(img9);
        title('thermal graph');
        counter9=counter9+1;
    end
    pause(3);
end
