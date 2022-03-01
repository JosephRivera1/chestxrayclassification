% Joseph Rivera see below on how to run gradCAM functions

clc;clear;close all;
testClass = "NORMAL";
netPath = "C:\Users\jrivera\MATLAB\Projects\MedImageAss1\Best_ChestXRay_Network";
imgPath = "C:\Users\jrivera\Downloads\archive\chest_xray\test\" + testClass + "\*.jpeg";
d = dir(imgPath);
for i = 1:length(d)
    load(netPath,'trainedNetwork');
    net = trainedNetwork;
    img = repmat(imresize(imread(fullfile(d(i).folder,d(i).name)),net.Layers(1).InputSize(1:2)),[1 1 3]);

    className = classify(net,img);
    
    disp(className)
    if string(className) ~= testClass
        disp("missed!")
    end

    % gradCAM Option
    [scoreMap,featureLayer,reductionLayer] = gradCAM(net,img,className);

    % LIME Option
    % scoreMap = imageLIME(net,img,className); % LIME scoreMap comes out very dark in this example. Normailzed it between (0,1) for visual clarity
    % scoreMap = scoreMap - min(scoreMap(:));
    % scoreMap = scoreMap ./ max(scoreMap(:));

    subplot(1,3,1); imshow(scoreMap); title("scoreMap");
    subplot(1,3,2); imshow(img); title(testClass + " classified as: " + string(className));
    subplot(1,3,3); imshow(img); hold on; imagesc(scoreMap,'AlphaData',0.5); colormap jet; title("overlay");

    disp("feature Layer (last spatial layer i.e. relu) " + string(featureLayer));
    disp("reduction Layer (last flat layer i.e. fully connected) " + string(reductionLayer));
end