FROM eclipse-temurin:21-jdk-jammy
WORKDIR /app
EXPOSE 8080
ENV APP_JAR=""
COPY $APP_JAR /app
# Entry point script
CMD sh -c '\
  ls -la /app \
  if [ -n "$APP_JAR" ]; then \
    JAR_FILE="$APP_JAR"; \
    echo "📦 Using JAR specified by APP_JAR: $JAR_FILE"; \
  else \
    JAR_FILE=$(find /app -maxdepth 1 -type f -name "*.jar" | head -n 1); \
    echo "🔍 Auto-detected JAR: $JAR_FILE"; \
  fi; \
  \
  if [ ! -f "$JAR_FILE" ]; then \
    echo "❌ No valid JAR found (looked for $JAR_FILE). Mount or set APP_JAR correctly."; \
    exit 1; \
  fi; \
  \
  echo "🚀 Starting Spring Boot app..."; \
  exec java -jar "$JAR_FILE" --server.port=8080'

