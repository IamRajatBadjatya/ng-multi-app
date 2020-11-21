FROM node:10-alpine3.11
LABEL maintainer="Rajat Badjatya"
WORKDIR /home/app/
# Creating a new user "app"
RUN mkdir -p /run/nginx && chmod 777 -R /run/nginx
RUN apk update \
    && apk add shadow==4.7-r1 nginx==1.16.1-r6 curl==7.67.0-r1 vim==8.2.0-r0 gettext==0.20.1-r2
# Copying the files
COPY . .
# Installing the node modules
# Building the service
# Copying the certificates
# Moving the start up script to the according location and Giving read and execution permissions
# Giving permissons to run apache server as non root user

# Install npm packages
# RUN npm install -g @angular/cli --unsafe-perm \
#    && npm i

# RUN npm run build-libraries \
#     && ng build --project=before-login-app \
#     && ng build --project=after-login-app --base-href /after-login-app/
# Copying conf files of apache server changing the default ports
# Copying the build files and chaging the permissions && deleting the source code        
RUN  mv startup_UI.sh /home/app/startup_UI.sh \
#    && mv generate_*.sh /home/app/generate_env_js.sh \
#    && chmod 755 /home/app/generate_env_js.sh \
    && chmod 755 /home/app/startup_UI.sh \
    && rm -rf /usr/share/nginx/html/* \
    && mkdir -p /usr/share/nginx/html \
    && mv dist/* /usr/share/nginx/html \
    && mv nginx/nginx.conf /etc/nginx/nginx.conf \
    && mv nginx/nginx /etc/init.d/nginx \
    && mkdir -p /var/lib/nginx/logs \
    && chmod 777 -R /var/log/nginx \
    && chmod 777 -R /var/lib/nginx \
    && chmod 777 -R /usr/share/nginx/html \
#    && chmod 777 -R /etc/nginx/certs \
    && chmod 777 -R /etc/nginx/ \
    && chmod 777 -R /etc/init.d/
EXPOSE 80  
CMD ["/home/app/startup_UI.sh"]