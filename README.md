Daily Fantasy Sports App
======

## Synopsis
**Daily Fantasy Sports** is a small rails app that takes fantasy football data and returns lineup permutations with the highest scoring potential.

## How to Run

```
git clone git@github.com:gxespino/daily_fantasy_sports.git
cd daily_fantasy_sports
bin/setup
```

Then you can open the application at [localhost:3000](http://localhost:3000)

## Motivation

To not lose as much money playing daily fantasy football leagues. 

## Tests

Tests are using RSpec. Acceptance tests can be found in the features folder while more specific unit tests are found in the decorators, lib, and models folders.

## To do

1. Refactor
2. Consider edge cases in testing
3. Add option to use scraped ESPN data for rankings/projected_points
4. Add lineup permutation based on values
5. Player sorting via attributes

