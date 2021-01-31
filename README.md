# Todoist API Assignment Exercise
This is a Exercise Test Automation Project for Todoist REST API.

## Test Automation Framework - Tools
The project used Karate BDD, JUnit as Test Runner, Java -  Maven Project, and Logback classic

## Test Run 
To run the whole project, you can execute a Maven Command
```bash
mvn clean test
```
Tags within the feature files can be run in particular.
```bash
mvn test "-Dkarate.options=--tags @api"
```
These commands are CI/CD ready and can be run using Jenkins/ Azure pipelines

## Cucumber Report
Cucumber report is generated every maven build. 
Location of the report : target\cucumber-html-reports\overview-features.html

## Log Files
For debugging purposes, log files are available on : \logs