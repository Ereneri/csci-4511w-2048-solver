#ifndef MONTECARLO_H
#define MONTECARLO_H

#include <iostream>
#include "Game.hpp"

// using namespace std::chrono;

std::pair<int, int> simulateOneRun(Game game);
std::tuple<int, int, int> monteCarloSimulateGame(int runs, int display_level, Game game);
int monteCarloSolve(int n, int runs, int display_level, 
    std::vector<int> &scores, std::vector<int> &highest_tiles, std::vector<int> &moves);

#endif