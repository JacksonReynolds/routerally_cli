# Route Rally CLI README

## Overview

Route Rally is a command line interface that uses the Mountain Project API to list the climbing routes in an area that is defined by the user. The user can also define the selection of routes presented by giving a range of difficulties, a maxiumum distance from the location they specified, a maximum number of routes presented and finally they can sort the routes by name, rating (difficulty) or stars (popularity). After the routes have been listed, the user then has the option to define another selection of routes, resort the current selection, or look up any individual route in the current selection by the ID provided. 

## Prerequisites

Make sure you have installed bundler. You can check using your terminal to navigate to your root directory and running `gem install bundler`

## Install

Once you have downloaded the repository, navigate the terminal into the routerally_cli directory. Run `bundler install` to download the necessary gems for the application.

## Running Route Rally

In order to run Route Rally, you must first make sure that the executable file in the bin/ directory has executable permissions. You can do this my running `chmod -x bin/routerally`. Once that is taken care of, Route Rally is good to go! You can execute from the cli directory by running `bin/routerally`

NOTE: you will need the latitude and longitude of the locations in decimal format. 

## Contributors Guide

Refer to CONTRIBUTING.md in the parent directory for this application for guidelines on contributing.

## Authors

Jackson Reynolds - [GitHub](https://github.com/JacksonReynolds)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details