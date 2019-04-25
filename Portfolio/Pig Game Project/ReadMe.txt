Ian Sime
Pig Project Write Up

Die.java
FourTurnsPlayer.java
PigGame.java
PigPlayer.java
SimpleHoldPlayer.java
StrategicPlayer.java
UserPigPlayer.java
WatchOpponent.java
PigGameProgram.java

I successfully completed the the project except my firstAdvantage method occasionally adds wins to a players win total even when it loses. During the project I learned how difficult it can be to debug code. My strategic player uses a similar strategy to the simple hold player in the sense that it has a hold value on each turn, but when it gets within a certain amount of the goal. I tried increasing the hold value with each turn, but the win percentage decreased with that strategy. I also tried a smaller close value. That also decreased the winning percentage. So, I made one hold value and a larger close to winning value. For the Four Turns Player I had it keep track of the number of scoring turns it has had and I used a hold value that change with each turn. The hold value was the score needed to get the goal divided by the number of turns left. For example it started with goal/4 then (goal-score)/3 and so on. The Watch Opponent Player uses the opponents score to determine wether or not to roll. 

The first player holds a slight advantage. The first player wins approximately 53% of the games. 
I found the best hold value to be approximately 26.
Four Turns Player wins approximately 53% of its games against every other player.

You can see these simulations in my simulations class.