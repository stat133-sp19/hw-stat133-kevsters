## Data Dictionary for Shot Descriptions for a Player

Here's the description of the data variables (each row describes a single shot):

- `team_name`: the name of the NBA team of the player who took this shot (there are 32 teams).
- `game_date`: The date of the game in which this shot was taken.
- `season`: The year in which this shot was taken.
- `period`: The quarter in which this shot was taken (there are 4 quarters in a basketball game).
- `miuntes_remaining`: The amount of minutes left in the period when the shot was taken (rounded down).
- `seconds_remaining`: The amount of seconds (after counting the minutes above) left in the period when the shot was taken.
- `shot_made_flag`: Either 'y', if the shot was made, or 'n' if the shot was missed.
- `action_type`: The type of action done to take the shot (e.g. Cutting Dunk Shot).
- `shot_type`:  Either '2PT Field Goal' or '3PT Field Goal' depending on whether the shot was taken behind the 3PT line.
- `shot_distance`: The player's distance from the basket while taking this shot (in feet).
- `opponent`: The name of the opposing team while this shot was taken.
- `x`: The x coordinate on the basketball court at which this shot was taken (coordinates are measured in inches).
- `y`: The y coordinate on the basketball court at which this shot was taken (coordinates are measured in inches).

