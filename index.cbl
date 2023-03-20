identification division.
program-id. guessing-game.

data division.
working-storage section.
01 random-number pic 99.
01 user-guess pic 99.
01 time-guessed pic 99 value 0.
01 correct-message pic x(40) value "Congratulations, you guessed the number!".
01 higher-message pic x(37) value "The number is higher than your guess.".
01 lower-message pic x(36) value "The number is lower than your guess.".

procedure division.
main.
    perform initialize-random-number.
    perform prompt-user-guess until user-guess = random-number.
    display correct-message.
    display "It tooks you " time-guessed " turns"
    stop run.

initialize-random-number.
    call "time" returning random-number.

prompt-user-guess.
    display "Guess the number between 1 and 100: " with no advancing.
    accept user-guess.
    add 1 to time-guessed
    evaluate true
        when user-guess < random-number
            display higher-message
        when user-guess > random-number
            display lower-message
    end-evaluate.
    display " ".
    