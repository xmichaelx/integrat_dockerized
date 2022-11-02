# Introduction

This project was setup to automatize process of building [Integrat](https://www.projectpluto.com/pluto/integrat.htm) using Docker.

# Install

Clone this repository

`docker build  -t integrat - < Dockerfile`

# Sample usage

Download [MPCORB.dat](https://www.minorplanetcenter.net/iau/MPCORB/MPCORB.DAT)

In order to integrate orbits to 02 November 2022 use following command:

`docker run -v $PWD:/app/data -w /app/data integrat  MPCORB.DAT 20221002.mpc 20221002`

# TODO

- adding to docker hub?
