# Start with a base image containing Java runtime
FROM openjdk:8-jre-alpine

#Add a volume pointing to /tmp
#VOLUME /tmp

#
# Note: The following is done to be able to run both docker-compose and gradle task
#
# If this Dockerfile file is run by docker-compose, then we use the jar file specified as argument,
# If it is run from gradle(buildDocker task) task then there is no argument, so we use the 
# default jar name(payfacto-trx-1.0.0.jar)
#
ARG jar=s3batch-1.0-SNAPSHOT.jar

#Add the application's jar to the container
ADD $jar  s3batch-1.0-SNAPSHOT.jar

# Run the jar file
CMD ["java", "-jar", "s3batch-1.0-SNAPSHOT.jar -scan"]
