package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {

	rounds := readFile("input.txt")
	// A for Rock, B for Paper, and C for Scissors

	// X for Rock, Y for Paper, and Z for Scissors
	var total int = 0

	for i, round := range rounds {
		codes := strings.Split(round, " ")
		result := battle(hand(codes[0]), hand(codes[1]))
		x := score(result[0], hand(codes[1]))
		total += x
		fmt.Println(i, result, x, total)
		fmt.Println(total)
	}

	fmt.Println(len(rounds))
}

func score(result string, hand string) int {
	var total int = 0
	if result == "win" {
		total += 6
	}
	if result == "loss" {
		total += 0
	}
	if result == "draw" {
		total += 3
	}

	if hand == "rock" {
		total += 1
	}
	if hand == "paper" {
		total += 2
	}
	if hand == "scissors" {
		total += 3
	}

	return total
}

func hand(letter string) string {
	if letter == "A" || letter == "X" {
		return "rock"
	}
	if letter == "B" || letter == "Y" {
		return "paper"
	}
	if letter == "C" || letter == "Z" {
		return "scissors"
	}
	return ""
}

func battle(hand1 string, hand2 string) []string {
	if hand1 == hand2 {
		return []string{"draw", hand1}
	}

	if hand1 == "rock" {
		if hand2 == "paper" {
			return []string{"win", hand2}
		}
		if hand2 == "scissors" {
			return []string{"loss", hand1}
		}
	}

	if hand1 == "paper" {
		if hand2 == "rock" {
			return []string{"loss", hand1}
		}
		if hand2 == "scissors" {
			return []string{"win", hand2}
		}
	}

	if hand1 == "scissors" {
		if hand2 == "rock" {
			return []string{"win", hand2}
		}
		if hand2 == "paper" {
			return []string{"loss", hand1}
		}
	}

	return []string{"", ""}
}

func readFile(filename string) []string {
	contents, err := os.ReadFile(filename)

	if err != nil {
		fmt.Println("File reading error", err)
		return []string{}
	}

	lines := strings.Split(string(contents), "\n")

	return lines
}
