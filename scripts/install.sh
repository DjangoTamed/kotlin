#!/bin/sh
sudo chmod -R a+rwx /usr/local/
if ! [[ -x "$(command -v kotlinc)" ]]; then
    echo "Installing kotlin compiler 1.3.50"
    curl -o kotlin-compiler.zip -L https://github.com/JetBrains/kotlin/releases/download/v1.3.50/kotlin-compiler-1.3.50.zip
    unzip -d /usr/local/ kotlin-compiler.zip
    echo 'PATH=/usr/local/kotlinc/bin:$PATH' >> ~/.bash_profile
    rm -rf kotlin-compiler.zip
fi
if ! [[ -x "$(command -v gradle)" ]]; then
    echo "Installing gradle 5.6.2"
    curl -o gradle.zip -L https://downloads.gradle-dn.com/distributions/gradle-5.6.2-bin.zip
    mkdir /opt/gradle
    unzip -d /opt/gradle gradle.zip
    echo 'export PATH=/opt/gradle/gradle-5.6.2/bin:$PATH' >> ~/.bash_profile
    rm -rf gradle.zip
fi
git clone https://github.com/danger/kotlin.git --single-branch --depth 1 _danger-kotlin
cd _danger-kotlin && make install
cd ..
rm -rf _danger-kotlin
