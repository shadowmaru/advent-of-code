package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	contents, err := os.ReadFile("input.txt")

	if err != nil {
		fmt.Println("File reading error", err)
		return
	}

	lines := strings.Split(string(contents), "\n")

	var elves [241]int = caloriesByElf(lines)

	var max int = top1(elves)

	fmt.Println("Max calories: ", max)
}

func caloriesByElf(lines []string) [241]int {
	var elf int = 0
	var elves [241]int

	for i := 0; i < len(lines); i++ {
		if lines[i] != "" {
			calories, err := strconv.Atoi(lines[i])
			if err != nil {
				panic(err)
			}
			elves[elf] += calories
		} else {
			elf += 1
		}
	}

	return elves
}

func top1(elves [241]int) int {
	var max int = 0
	for i := 0; i < len(elves); i++ {
		if elves[i] > max {
			max = elves[i]
		}
	}
	return max
}
