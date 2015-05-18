# prefann
`prefann` is an R package with functions and classes to forecast missing precipitation 
values using a daily precipitation serie. It support the following forecast methods:

* Generalized Linear Regression (GLM)
* Multilayer Perceptron Artificial Neural Network (MLP)

To install:

* the latest development version: `install_github("lucasvenez/prefann")`

Getting start:

```R
require(prefann)

serie <- read.data("<csv_file_path>", sep = ",", dec = ".") # loading serie

missing.dates(serie) # showing missing dates into the serie

serie <- completes.dates(serie, method = "mlp") # completing serie using the MLP method

export.data(serie) # exporting serie to a CSV file
```
