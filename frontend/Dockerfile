FROM ghcr.io/cirruslabs/flutter:3.27.1 as build

WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web

FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 8081
CMD ["nginx", "-g", "daemon off;"]
