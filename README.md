# chestXRayClassification

This code depends on matlab 2021b and the Deep Learning Toolbox along with the Resnet18 Add-On Support Package

Begin by opening Experiment Manager

![image](https://user-images.githubusercontent.com/48141934/156086881-d291ac70-972c-458f-b7b6-c00eff356981.png)

Replace the setup function and metric function with ours, as seen above

create a table of hyperparameters as shown, you should have:
_miniBatchSize
numEpochs
augmentation
transformFunction
network
inputNormalization
myInitialLearnRate_
You should now be able to recreate our experiments!
