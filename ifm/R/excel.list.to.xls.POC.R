image.path.vector <- c("output/foo-1.png",
                       "output/foo-2.png", 
                       "output/foo-3.png", 
                       "output/foo-4.jpg",
                       "output/foo-5.jpg")

list.ifm.result <- list(cash.flow.series, image.path.vector)

file.path <- excel.list.to.xls(list.ifm.result)

print(file.path)