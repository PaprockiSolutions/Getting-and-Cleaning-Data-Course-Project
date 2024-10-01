library(dplyr)

# Load training data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Load test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Load features and activity labels
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Combine the training and test datasets
X_total <- rbind(X_train, X_test)
y_total <- rbind(y_train, y_test)
subject_total <- rbind(subject_train, subject_test)

# Extract features related to mean and standard deviation
mean_std_features <- grep("(mean|std)\\(\\)", features$V2)
X_total <- X_total[, mean_std_features]

# Rename columns based on features
names(X_total) <- features[mean_std_features, 2]

# Assign descriptive activity names
y_total <- y_total %>%
        mutate(Activity = activity_labels[V1, 2]) %>%
        select(Activity)

# Rename subject variable
names(subject_total) <- "Subject"

# Combine subject, activity, and features into one dataset
combined_data <- cbind(subject_total, y_total, X_total)

# Create the tidy dataset with the average for each variable, activity, and subject
tidy_data <- combined_data %>%
        group_by(Subject, Activity) %>%
        summarise_all(mean)

# Write the tidy dataset to a txt file
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)