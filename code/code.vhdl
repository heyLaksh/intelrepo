library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rover is
  port (
    clk          : in  std_logic;
    reset        : in  std_logic;
    travel_plan  : in  std_logic;
    current_loc  : out std_logic_vector(2 downto 0)
  );
end entity rover;

architecture behavioral of rover is
  type state_type is (Room0, Room1, Room2, Room3, Room4, Room5, Room6, Room7);
  signal current_state, next_state : state_type;
begin
  process (clk, reset)
  begin
    if (reset = '1') then
      current_state <= Room0;
    elsif rising_edge(clk) then
      current_state <= next_state;
    end if;
  end process;

  process (current_state, travel_plan)
  begin
    next_state <= current_state;
    case current_state is
      when Room0 =>
        if (travel_plan = '1') then
          next_state <= Room1;
        end if;
      when Room1 =>
        if (travel_plan = '0') then
          next_state <= Room2;
        else
          next_state <= Room4;
        end if;
      when Room2 =>
        if (travel_plan = '0') then
          next_state <= Room3;
        else
          next_state <= Room4;
        end if;
      when Room3 =>
        if (travel_plan = '1') then
          next_state <= Room0;
        end if;
      when Room4 =>
        if (travel_plan = '0') then
          next_state <= Room7;
        else
          next_state <= Room5;
        end if;
      when Room5 =>
        if (travel_plan = '0') then
          next_state <= Room3;
        else
          next_state <= Room6;
        end if;
      when Room6 =>
        if (travel_plan = '0') then
          next_state <= Room7;
        end if;
      when Room7 =>
        if (travel_plan = '0') then
          next_state <= Room1;
        else
          next_state <= Room5;
        end if;
      when others =>
        next_state <= Room0;
    end case;
  end process;

  process (current_state)
  begin
    case current_state is
      when Room0 =>
        current_loc <= "000";
      when Room1 =>
        current_loc <= "001";
      when Room2 =>
        current_loc <= "010";
      when Room3 =>
        current_loc <= "011";
      when Room4 =>
        current_loc <= "100";
      when Room5 =>
        current_loc <= "101";
      when Room6 =>
        current_loc <= "110";
      when Room7 =>
        current_loc <= "111";
      when others =>
        current_loc <= "000";
    end case;
  end process;

end architecture behavioral;