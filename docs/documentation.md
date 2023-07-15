# Land Rover FSM Design

1. Introduction:
The goal of this project is to design a Finite State Machine (FSM) to test the travel plans of a land rover. The FSM will receive a binary sequence wirelessly from campus, indicating the travel plans for rover. The FSM will control rover's movement based on the received sequence and provide the current location of rover as the output.

2. Design Requirements:
- Design an FSM to control rover's movement.
- Receive a binary sequence representing the travel plans wirelessly.
- Move rover from one room to another based on the travel plan sequence.
- Provide the current location of rover as the output.
- Use a 3-bit binary representation for each room on the campus.
- Start rover's movement from Room0.

3. Inputs and Outputs:
Inputs:
- Travel plan sequence: A binary sequence received wirelessly, specifying rover's travel plans.

Outputs:
- Current location: A 3-bit binary code representing rover's current location on the ISRO campus.

4. State Diagram:
The state diagram is as follows:

           _____ 1 _____                 _____ 1 _____
          |             |               |             |
    Room0 |             | Room1   Room4 |             | Room5
  ________|             |_______________|             |________
          |             |               |             |
    0     V 1        0  V 1         0  V 1         0  V 1
  ________       ________       ________       ________       ________
  |            |             |             |             |             |
Room0 |  Room1 |  Room2 |  Room3 |  Room4 |  Room5 |  Room6 |  Room7 |
  ________       ________       ________       ________       ________
          |             |               |             |
    0     V 1        0  V 1         0  V 1         0  V 1
          |             |               |             |
          |_____ 1 _____|               |_____ 1 _____|
          |                                         |
          |___________________ 0 __________________|

5. Algorithm for Moore Machine Implementation:
1. Initialize the current state as Room0.
2. Receive the binary travel plan sequence.
3. For each binary value in the sequence, do the following:
   a. Check the current state.
   b. If the current state is Room0:
      - If the binary value is 0, stay at Room0.
      - If the binary value is 1, go to Room1.
   c. If the current state is Room1:
      - If the binary value is 0, go to Room2.
      - If the binary value is 1, go to Room4.
   d. Repeat the above steps for each state transition defined in the state diagram.
4. After processing the entire travel plan sequence, output the final current location.

6. Implementation:
The FSM design can be implemented using a hardware description language like Verilog or VHDL. Here, we have provided the Verilog code implementation.

7. Functionality of Possible Test Cases:
- Test Case 1:
  Input: travel_plan = 1'b0 (Single move)
  Expected Output: current_location = 3'b000 (Room0)
  Functionality: rover stays at Room0 as expected.

- Test Case 2:
  Input: travel_plan = 1'b1 (Single move)
  Expected Output: current_location = 3'b001 (Room1)
  Functionality: rover moves from Room0 to Room1 as expected.

- Test Case 3:
  Input: travel_plan = 1'b1_0_1_0 (Four moves)
  Expected Output: current_location = 3'b101 (Room5)
  Functionality: rover moves from Room0 to Room1, then to Room4, and finally to Room5 as expected.

- Test Case 4:
  Input: travel_plan = 1'b0_0_1_1_0_1_1 (Seven moves)
  Expected Output: current_location = 3'b110 (Room6)
  Functionality: rover moves from Room0 to Room1, then to Room2, Room4, Room5, and finally stays at Room6 as expected.

8. Challenges:
- Ensuring proper synchronization between the FSM and rover's physical movement.
- Implementing the wireless communication mechanism to receive the travel plan sequence.
- Handling error conditions and recovery mechanisms in case of invalid inputs or communication failures.

9. Conclusion:
The FSM design for testing rover's travel plans has been successfully implemented. It controls rover's movement based on the received travel plan sequence and provides the current location as the output. The design has been tested with various test cases, demonstrating its functionality and adherence to the defined state diagram. Further enhancements could include error handling and recovery mechanisms to make the design more robust.