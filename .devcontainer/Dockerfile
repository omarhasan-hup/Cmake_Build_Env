# Start with a Debian-based image
FROM ubuntu

# Update the package manager and install necessary dependencies
RUN apt-get update && apt-get install -y \
    make \
    cmake \
    git\
    g++

# Clean up to reduce the image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

#make a new directory called scripts in the home directory
RUN mkdir AVR_Tool_Chain
RUN echo "Before copy"
# Copy the required toolcahin and the trial scripts
COPY AVR_Tool_Chain /opt/AVR_Tool_Chain
COPY .gitrc /root/
RUN echo "After copy"
RUN echo "source /root/.gitrc" >> /root/.bashrc

# Make the script executable

# Run the script continuously using Bash
CMD ["/bin/bash", "-c", "/scripts/my_script.sh && tail -f /dev/null"]
