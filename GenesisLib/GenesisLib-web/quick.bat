@echo off
cd ..
call mvn clean install
cd C:\Users\Connor\Documents\NetBeansProjects\GenesisLib\GenesisLib\GenesisLib-web
call mvn jetty:run
cls