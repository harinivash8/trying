FROM amazoncorretto:17

# Install X11 and GUI dependencies
RUN yum install -y libXext libXrender libXtst xorg-x11-server-Xvfb

WORKDIR /app

# Copy the built JAR
COPY target/twig-${VERSION}-core.jar /app/twig.jar

# Set up X11 forwarding
ENV DISPLAY=:99

# Start Xvfb and run the app
CMD Xvfb :99 -screen 0 1024x768x16 & java -jar twig.jar
