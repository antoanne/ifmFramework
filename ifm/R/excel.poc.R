image.path.vector <- c("c:\\afilcosta\\git\\ifm\\output\\foo-1.png",
                       "c:\\afilcosta\\git\\ifm\\output\\foo-2.png", 
                       "c:\\afilcosta\\git\\ifm\\output\\foo-3.png", 
                       "c:\\afilcosta\\git\\ifm\\output\\foo-4.jpg",
                       "c:\\afilcosta\\git\\ifm\\output\\foo-5.jpg")

list.ifm.result <- list(cash.flow.series, image.path.vector)

file.path <- excel.list.to.xls(list.ifm.result)

print(file.path)