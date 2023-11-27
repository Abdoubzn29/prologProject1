# prologProject1



Report: Managing Public Transportation Routes in Prolog

Objective: The Prolog program aims to assist in managing a public transportation network by enabling functionalities such as checking line connections between stops, determining routes within specified schedules, and handling delays or late departures.

1. Time Manipulation:
Two predicates are implemented to handle time-related operations:

add_minutes/3: Adds minutes to a given time in the format [H1, M1] and returns the result in [H2, M2].
display_time/1: Formats and displays time in HH:MM format.
2. Line Connections between Stops:

line_passes_stop/3: Checks if a line passes between two specified stops.
3. Checking Line Schedules:
Predicates to verify if a line between two stops operates within schedule after adding time:

line_within_schedule/4: Checks the schedule for trips between stops in the forward direction.
line_within_schedule_return/4: Checks the schedule for return trips between stops.
4. Determining Routes:

determine_routes_within_schedule/4: Determines routes between stops within specified schedules.
determine_routes_with_delay/4: Determines routes considering delays or late departures.
Conclusion:
The Prolog program successfully provides functionalities for managing a public transportation network. It allows users to check line connections between stops, verify schedules for trips between stops in both directions, and determine routes within specified schedules or considering delays.

This program forms a foundational structure for creating an efficient and reliable system to assist travelers in planning routes within a public transportation network.
