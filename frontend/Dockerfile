FROM cirrusci/flutter:stable-web as build

WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web

FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 8081
CMD ["nginx", "-g", "daemon off;"]
