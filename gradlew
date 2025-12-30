#!/usr/bin/env sh

# Apache License 2.0 (Gradle Wrapper script)
# Minimal, official wrapper script to invoke Gradle with a version-locked distribution.

# Attempt to locate java
JAVA_CMD=""
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/bin/java" ] ; then
        JAVA_CMD="$JAVA_HOME/bin/java"
    fi
fi
if [ -z "$JAVA_CMD" ] ; then
    JAVA_CMD="java"
fi

APP_HOME=$(cd "${0%/*}" && pwd)

# Resolve symlinks
while [ -h "$0" ] ; do
  ls=$(ls -ld "$0")
  link=$(expr "$ls" : '.*-> \(.*\)$')
  if expr "$link" : '.*/.*' > /dev/null; then
    0="$link"
  else
    0=$(dirname "$0")/"$link"
  fi
done

CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

# OS specific support
case "$(uname)" in
  CYGWIN*|MINGW*|MSYS*)
    APP_HOME=$(cygpath --path --mixed "$APP_HOME")
    CLASSPATH=$(cygpath --path --mixed "$CLASSPATH")
    ;;
esac

# Default JVM options; keep conservative for CI stability
DEFAULT_JVM_OPTS="-Xmx1g -Dfile.encoding=UTF-8"

exec "$JAVA_CMD" $DEFAULT_JVM_OPTS -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
