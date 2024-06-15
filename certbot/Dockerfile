FROM certbot/certbot

# Set environment variables
ENV DOMAIN dockerprojekt.de
ENV EMAIL woelflenico@dv-schulen.de

# Set the working directory
WORKDIR /certbot
# Copy the script to the container
COPY script.sh ./

# Make the script executable
RUN chmod +x script.sh

# Run the script when the container starts
CMD ["./script.sh"]
