# BIOS611 Project: Albums Analysis

## Overview

Hi! This is my BIOS611 Data Science Project. It is an analysis of album ratings/reviews data that aims to answer the following questions:

1. How do receptions differ between pop and rock albums?

2. How do critic and user ratings of albums differ?

3. How do album receptions change over the years? Does it differ between pop and rock albums?

4. Is there patterns to when albums are release in a calendar year?

## How to Build and Access the Docker Container

Note: I built this project through the BIOS VM. So before doing anything, I connect to my VM with the following:

```
ssh andong@bios611-18.bios.unc.edu -L 8787:localhost:8787
```

Step 1. Open your preferred Unix-shell command-line interface (switch to bash if necessary). Clone this repo.

```
git clone https://github.com/AndongW/611project
```

Step 2. Change your current directory as follows.

```
cd 611project
```

Step 3. Build the docker container.

```
docker build . --build-arg USER_ID=$(id -u) -t project
```

Step 4. Run the container you just built.

```
docker run --rm -v $(pwd):/home/rstudio/work -e PASSWORD=bios611 -p 8787:8787 -it project
```

Step 5. Open your preferred internet browser, and go to https://localhost:8787. Sign in with Username `rstudio` and Password `bios611`. You are now signed in the rstudio mirrored in a docker container. 

## How to Build the Report

Step 1. In the terminal of the rstudio in the docker container, change directory to working directory by executing the following.

```
cd work
```

Step 2. Clean the environment of preprocessed data, figures, report.

```
make clean
```

Step 3. Build the report. This should automatically build all artifacts the report dependent on, i.e. data and figures.

```
make report.html
```

Step 4. To view the report, locate and click the `report.html` file and choose "View in Web Browser".

(Step 5.) To build artifacts specifically, execute the same command as the one in Step 3, just replacing `report.html` with the artifact path. For example, to build the first plot in the report, execute the following. 

```
make figures/poprock.png
```

(Step 6.) To start over, repeat Step 1 to clean the environment. 

## Try-Catch

If you run into any errors or issues following my instructions, please feel free to contact me at `andong@unc.edu`. I worked really hard on this project and would love for you to be able to see it! Thank you!
