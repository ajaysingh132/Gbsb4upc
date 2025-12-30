@echo off
:: Apache License 2.0 (Gradle Wrapper script)

SETLOCAL
set DIR=%~dp0

IF NOT "%JAVA_HOME%"=="" (
  set JAVA_EXE=%JAVA_HOME%\bin\java.exe
) ELSE (
  set JAVA_EXE=java.exe
)

set CLASSPATH=%DIR%\gradle\wrapper\gradle-wrapper.jar

set DEFAULT_JVM_OPTS=-Xmx1g -Dfile.encoding=UTF-8

"%JAVA_EXE%" %DEFAULT_JVM_OPTS% -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*
ENDLOCAL
