sudo apt -y install openjdk-9-jre git
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar -O BuildTools.jar
java -jar BuildTools.jar --rev 1.12.1
