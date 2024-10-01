# CodeBook

## Data Description

The data collected comes from the accelerometers of the Samsung Galaxy S smartphone.

## Variables

-   `Subject`: An identifier of the subject who carried out the experiment (1-30).
-   `Activity`: The type of activity performed, such as Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, or Laying.
-   **66 Variables related to mean and standard deviation measurements**:
    -   These variables represent the mean and standard deviation of various sensor readings (e.g., acceleration, gyroscope) collected during the activity. They are named in a descriptive manner, indicating whether they represent mean or standard deviation, and the axis of measurement (X, Y, Z).

## Transformations

1.  Merged the training and test datasets to create one data set.
2.  Extracted only the mean and standard deviation for each measurement.
3.  Used descriptive activity names.
4.  Appropriately labeled the dataset with descriptive variable names.
5.  Created a second, independent tidy dataset with the average of each variable for each activity and subject.
