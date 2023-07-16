#include <cmath>
#include <fstream>
#include <cstdio>
#include <cstring>
#include <string>
#include <thread>
#include <vector>
#include <iostream>
#include <stdio.h>
#include "lib/json/json.hpp"
using json = nlohmann::json;

char *jsonToChar(json jsonData)
{
    std::string result = jsonData.dump();
    char *ch = new char[result.size() + 1];
    strcpy(ch, result.c_str());
    return ch;
}

std::string charToString(char *value)
{
    std::string result(value);
    return result;
}

char *stringToChar(std::string value)
{
    char *ch = new char[value.size() + 1];
    strcpy(ch, value.c_str());
    return ch;
}

extern "C"
{
    void print(char *value)
    {
        std::cout << charToString(value) << std::endl;
    }
    int calculate(int num_1, int num_2)
    {
        return num_1 * num_2;
    }
    char *request(char *data)
    {
        json jsonBody = json::parse(data);
        return jsonToChar(jsonBody);
    }
    int main()
    {
        print(stringToChar("oke"));
        return 0;
    }
}