# Assumptions:

- Rover starts at Room0.
- The travel plan sequence will always contain valid binary values (0 or 1).
- There is a wireless communication mechanism in place to receive the travel plan sequence.
- The travel plan sequence will be provided as input to the FSM in a sequential manner.
- Figo will move to the specified next room based on the travel plan sequence, following the defined state transitions and rules.
- The FSM will operate in a synchronous manner, where the state transitions occur on clock edges.
- The FSM will not have any error handling or recovery mechanisms. It assumes that the travel plan sequence will be valid and the wireless communication will work as intended.
- The FSM is solely responsible for tracking rover's current location based on the received travel plan sequence and state transitions. It does not handle any physical movement or control of the rover.


# Inputs

In this design, the possible inputs are binary values (0 or 1) that make up the travel plan sequence for rover. Since the travel plan sequence can vary in length, the number of possible inputs depends on the length of the sequence.

For a travel plan sequence of length N, the possible inputs are all the binary sequences of length N. Each binary digit (0 or 1) in the sequence represents the instruction for Figo's movement at a particular step.

If the travel plan sequence has a length of 4, the possible inputs are:

- 0000
- 0001
- 0010
- 0011
- 0100


Each of these binary sequences represents a unique set of instructions for rover's movement, determining its path through the rooms.


# Outputs

The possible outcomes, or outputs, in this design correspond to rover's current location after following the travel plan sequence. The current location is represented by a 3-bit binary code, indicating which room Figo is in.

Based on the state transitions and rules defined in the problem statement, the possible outcomes (current locations) for different travel plan inputs are as follows:


Input: 0000
Output: 000 (Room0)

Input: 0001
Output: 001 (Room1)

Input: 0010
Output: 010 (Room2)

Input: 0011
Output: 011 (Room3)

Input: 0100
Output: 100 (Room4)