# Use rocker/verse as the base image
FROM rocker/verse

# Accept build argument for USER_ID with a default value
ARG USER_ID=1000

# Conditional logic to update UID and home directory ownership if USER_ID is different from current rstudio UID
RUN current_uid=$(id -u rstudio) && \
    if [ "$USER_ID" != "$current_uid" ]; then \
        usermod -u $USER_ID rstudio && \
        chown -R rstudio:rstudio /home/rstudio; \
    fi

# HW2 Tasks
RUN apt update && apt install -y man-db && rm -rf /var/lib/apt/lists/*
RUN yes | unminimize

# Install R Packages
RUN Rscript -e "install.packages('tidyverse')"
RUN Rscript -e "install.packages('ggpubr')"


# Python Jupyter Lab
RUN apt update -y && apt install -y python3-pip
RUN pip3 install jupyter jupyterlab
