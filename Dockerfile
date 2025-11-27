# Use an official lightweight Nginx image
FROM nginx:alpine

# Copy application build files into Nginx web root
COPY build/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
