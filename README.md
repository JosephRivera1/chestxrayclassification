# ChestXRayClassification

This code depends on matlab 2021b and the Deep Learning Toolbox along with the Resnet18 Add-On Support Package

# Begin by Opening Experiment Manager

![image](https://user-images.githubusercontent.com/48141934/156086881-d291ac70-972c-458f-b7b6-c00eff356981.png)

Point your setup function and metric function to our code as seen above.

The setup function defines the code flow for the network training including the sources of your imagery for training, validation and testing, as well as your network definition, and training options including hyperparameter selection. The hyperparamaters can also be iterated over using the hyperparameter table as shown below.

The metric function lets us track additional metrics while training. In this case, we specified our testing accuracy since only validation accuracy is reported initially.

# Hyperparameter Table

create a table of hyperparameters as shown, you should have:
_miniBatchSize = 128,
numEpochs = 10,
augmentation = [0 1],
transformFunction = "none",
network = ["resnet18_ImgNet" "resnet18_Rng"],
inputNormalization = ["none"],
_ and _myInitialLearnRate = [1e-5 1e-6]_
You should now be able to recreate our experiments!

# Viewing Results

After hitting "Run", you should kick off your experiments and return a list of results similar to the one below. You can view training plots, confusion matrices, and the output of your custom metrics. We added a custom metric to evaluate our test accuracy in this case.

![image](https://user-images.githubusercontent.com/48141934/156087505-6716c3d1-5574-4b2f-af2a-cec9cf9999dd.png)


# Visualization with grad-CAM

Next you can use the gradCAM_MEDIMG.m script to visualize a trained network's prediction results. The output is shown below:
![image](https://user-images.githubusercontent.com/48141934/156088611-932ab863-58b0-4096-aa5a-2c967e27cc0d.png)
