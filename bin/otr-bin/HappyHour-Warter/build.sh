#!/bin/sh

set -xe

javac HHWarter.java && jar cfm ../HappyHour-Warter.jar manifest *.class
