# Use Nginx as base image
FROM nginx:stable-bookworm

# Create the HTML file with "Hello World" and Kaliop logo
RUN mkdir -p /usr/share/nginx/html

COPY assets/logo-Kaliop.svg /usr/share/nginx/html/assets/logo-Kaliop.svg

# Add the HTML content
RUN echo '\
<!DOCTYPE html>\
<html lang="en">\
<head>\
    <meta charset="UTF-8">\
    <meta name="viewport" content="width=device-width, initial-scale=1.0">\
    <title>Labs - Kaliop</title>\
    <style>\
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }\
        img { max-width: 300px; margin: 20px auto; }\
    </style>\
</head>\
<body>\
    <h1>Kaliop Labs</h1>\
    <img src="../assets/logo-Kaliop.svg" alt="Kaliop Logo">\
</body>\
</html>' > /usr/share/nginx/html/index.html

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
