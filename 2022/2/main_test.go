package main

import (
	"testing"

	"github.com/stretchr/testify/require"
)

func TestScore(t *testing.T) {
	t.Run("when result is a win and I played rock", func(t *testing.T) {
		require.Equal(t, 7, score("win", "rock"))
	})

	t.Run("when result is a loss and I played paper", func(t *testing.T) {
		require.Equal(t, 2, score("loss", "paper"))
	})

	t.Run("when result is a draw and I played scissors", func(t *testing.T) {
		require.Equal(t, 6, score("draw", "scissors"))
	})
}

func TestHand(t *testing.T) {
	t.Run("when letter is A", func(t *testing.T) {
		require.Equal(t, "rock", hand("A"))
	})

	t.Run("when letter is B", func(t *testing.T) {
		require.Equal(t, "paper", hand("B"))
	})

	t.Run("when letter is C", func(t *testing.T) {
		require.Equal(t, "scissors", hand("C"))
	})

	t.Run("when letter is X", func(t *testing.T) {
		require.Equal(t, "rock", hand("X"))
	})

	t.Run("when letter is Y", func(t *testing.T) {
		require.Equal(t, "paper", hand("Y"))
	})

	t.Run("when letter is Z", func(t *testing.T) {
		require.Equal(t, "scissors", hand("Z"))
	})

	t.Run("when no letter is passed", func(t *testing.T) {
		require.Equal(t, "", hand(""))
	})

	t.Run("when a different letter is passed", func(t *testing.T) {
		require.Equal(t, "", hand("F"))
	})
}

func TestBattle(t *testing.T) {
	t.Run("when both hands are the same", func(t *testing.T) {
		require.Equal(t, []string{"draw", "rock"}, battle("rock", "rock"))
	})

	t.Run("when I played rock and the opponent played scissors", func(t *testing.T) {
		require.Equal(t, []string{"win", "rock"}, battle("scissors", "rock"))
	})

}
