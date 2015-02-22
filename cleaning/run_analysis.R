#unzip("getdata_projectfiles_UCI HAR Dataset.zip")  ## extract contents

#load data from files.
subject.test=readLines("UCI HAR Dataset/test/subject_test.txt")
subject.train=readLines("UCI HAR Dataset/train/subject_train.txt")

features=strsplit(readLines("UCI HAR Dataset/features.txt")," ")

auxi=unlist(features)
features=auxi[2*1:(length(auxi)/2)]

#load the test data, and read your names of variables from the features 
X.test=strsplit(gsub("  "," ",readLines("UCI HAR Dataset/test/X_test.txt"))," ")

linhas=length(X.test)
numcol=length(X.test[[1]])-1
auxi=matrix(nrow=linhas,ncol=numcol)

for (i in 1: linhas){
  auxi[i,]=X.test[[i]][-1]
}
X.test=data.frame(auxi)
names(X.test)=features

#load the train data, and read your names of variables from the features 

X.train=strsplit(gsub("  "," ",readLines("UCI HAR Dataset/train/X_train.txt"))," ")

linhas=length(X.train)
numcol=length(X.train[[1]])-1
auxi=matrix(nrow=linhas,ncol=numcol)

for (i in 1: linhas){
  auxi[i,]=X.train[[i]][-1]
}
X.train=data.frame(auxi)


#load the column of activities from the files y_test 

Y.test=unlist(strsplit(gsub("  "," ",readLines("UCI HAR Dataset/test/y_test.txt"))," "))
Y.train=unlist(strsplit(gsub("  "," ",readLines("UCI HAR Dataset/train/y_train.txt"))," "))


test=data.frame(subject.test,Y.test,X.test)
train=data.frame(subject.train,Y.train,X.train)



names(test)=c("subject","activity",features)
names(train)=c("subject","activity",features)

#merge de test and train data
union=rbind(train,test)


#extract the variables with mean() and sd() values
union=union[c(1:8,43:48,83:88,123:128,163:168,203:204
    ,216:217,229:230,242:243,255:256,268:273
    ,347:352,426:431,505:506,518:519,531:532,544:545)]

#change the number of variable for comprensible labels
actividades=strsplit(readLines("UCI HAR Dataset/activity_labels.txt")," ")
auxi=unlist(actividades)
actividades=auxi[2*1:(length(auxi)/2)]

auxi=union[[2]]
auxi=factor(auxi,labels=actividades)
union[[2]]=auxi

#the new names of the variables
names(union)=c("subject","activity","mean.of.timein.coord.X.of.body.accelerometer"
,"mean.of.timein.coord.Y.of.body.accelerometer","mean.of.timein.coord.Z.of.body.accelerometer"
,"sd.of.timein.coord.X.of.body.accelerometer","sd.of.timein.coord.Y.of.body.accelerometer"
,"sd.of.timein.coord.Z.of.body.accelerometer","mean.of.timein.coord.X.of.gravity.accelerometer"
,"mean.of.timein.coord.Y.of.gravity.accelerometer","mean.of.timein.coord.Z.of.gravity.accelerometer"
,"sd.of.timein.coord.X.of.gravity.accelerometer","sd.of.timein.coord.Y.of.gravity.accelerometer"
,"sd.of.timein.coord.Z.of.gravity.accelerometer","mean.of.timein.coord.X.of.Jerk.signals.body.accelerometer"
,"mean.of.timein.coord.Y.of.Jerk.signals.body.accelerometer","mean.of.timein.coord.Z.of.Jerk.signals.body.accelerometer"
,"sd.of.timein.coord.X.of.Jerk.signals.body.accelerometer","sd.of.timein.coord.Y.of.Jerk.signals.body.accelerometer"
,"sd.of.timein.coord.Z.of.Jerk.signals.body.accelerometer","mean.of.timein.coord.X.of.body.giroscope"
,"mean.of.timein.coord.Y.of.body.giroscope","mean.of.timein.coord.Z.of.body.giroscope"
,"sd.of.timein.coord.X.of.body.giroscope","sd.of.timein.coord.Y.of.body.giroscope"
,"sd.of.timein.coord.Z.of.body.giroscope","mean.of.timein.coord.X.of.Jerk.signals.body.giroscope"
,"mean.of.timein.coord.Y.of.Jerk.signals.body.giroscope","mean.of.timein.coord.Z.of.Jerk.signals.body.giroscope"
,"sd.of.timein.coord.X.of.Jerk.signals.body.giroscope","sd.of.timein.coord.Y.of.Jerk.signals.body.giroscope"
,"sd.of.timein.coord.Z.of.Jerk.signals.body.giroscope","mean.of.timein.body.accelerometer.magnitude"
,"sd.of.timein.body.accelerometer.magnitude","mean.of.timein.gravity.accelerometer.magnitude"
,"sd.of.timein.gravity.accelerometer.magnitude","mean.of.timein.Jerk.signals.body.accelerometer.magnitude"
,"sd.of.timein.Jerk.signals.body.accelerometer.magnitude","mean.of.timein.body.giroscope.magnitude"
,"sd.of.timein.body.giroscope.magnitude","mean.of.timein.Jerk.signals.body.giroscope.magnitude"
,"sd.of.timein.Jerk.signals.body.giroscope.magnitude","mean.of.frequency.in.coord.X.of.body.accelerometer"
,"mean.of.frequency.in.coord.Y.of.body.accelerometer","mean.of.frequency.in.coord.Z.of.body.accelerometer"
,"sd.of.frequency.in.coord.X.of.body.accelerometer","sd.of.frequency.in.coord.Y.of.body.accelerometer"
,"sd.of.frequency.in.coord.Z.of.body.accelerometer","mean.of.frequency.in.coord.X.of.Jerk.signals.body.accelerometer"
,"mean.of.frequency.in.coord.Y.of.Jerk.signals.body.accelerometer","mean.of.frequency.in.coord.Z.of.Jerk.signals.body.accelerometer"
,"sd.of.frequency.in.coord.X.of.Jerk.signals.body.accelerometer","sd.of.frequency.in.coord.Y.of.Jerk.signals.body.accelerometer"
,"sd.of.frequency.in.coord.Z.of.Jerk.signals.body.accelerometer","mean.of.frequency.in.coord.X.of.body.giroscope"
,"mean.of.frequency.in.coord.Y.of.body.giroscope","mean.of.frequency.in.coord.Z.of.body.giroscope"
,"sd.of.frequency.in.coord.X.of.body.giroscope","sd.of.frequency.in.coord.Y.of.body.giroscope"
,"sd.of.frequency.in.coord.Z.of.body.giroscope","mean.of.frequency.in.body.accelerometer.magnitude"
,"sd.of.frequency.in.body.accelerometer.magnitude","mean.of.frequency.in.Jerk.signals.body.accelerometer.magnitude"
,"sd.of.frequency.in.Jerk.signals.body.accelerometer.magnitude","mean.of.frequency.in.body.giroscope.magnitude"
,"sd.of.frequency.in.body.giroscope.magnitude","mean.of.frequency.in.Jerk.signals.body.giroscope.magnitude"
,"sd.of.frequency.in.Jerk.signals.body.giroscope.magnitude")


#the averages for each variable, for each subject and activity
subject=names(table(union[[1]]))
activity=names(table(union[[2]]))

numvar=length(union)-2
medias=matrix(ncol = numvar,nrow = length(subject)*length(activity))
identification=c()

cnt=0
for (i in subject){
  for (j in activity){
    cnt=1+cnt
    auxi=union[union[[1]]==i & union[[2]]==j,]
    identification[cnt]=paste(i,"-",j)
    for (k in 1:numvar){
      medias[cnt,k]=mean(as.numeric(auxi[[k+2]]))
    }
    
  }
}

medias=data.frame(medias)
names(medias)=names(union)[1:numvar+2]
datos=data.frame(identification,medias)

#write data file
write.table(datos,file="project.cleaning.data.txt",row.name=FALSE)
