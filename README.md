# Route Rally CLI README

# Overview

Route Rally is a command line interface that uses the Mountain Project API to list the climbing routes in an area that is defined by the user. The user can also define the selection of routes presented by giving a range of difficulties, a maxiumum distance from the location they specified, a maximum number of routes presented and finally they can sort the routes by name, rating (difficulty) or stars (popularity). After the routes have been listed, the user then has the option to define another selection of routes, resort the current selection, or look up any individual route in the current selection by the ID provided. 

## Prerequisites

Make sure you have bundler installed bundler. You cna check using your terminal to navigate to your root directory and running `gem install bundler`. 

### Installing Route Rally

Once you have downloaded or forked the repository, navigate the terminal into the routerally_cli directory. Run `bundler install` to download the necessary gems for the application.

#### 