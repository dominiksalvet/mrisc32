----------------------------------------------------------------------------------------------------
-- Copyright (c) 2018 Marcus Geelnard
--
-- This software is provided 'as-is', without any express or implied warranty. In no event will the
-- authors be held liable for any damages arising from the use of this software.
--
-- Permission is granted to anyone to use this software for any purpose, including commercial
-- applications, and to alter it and redistribute it freely, subject to the following restrictions:
--
--  1. The origin of this software must not be misrepresented; you must not claim that you wrote
--     the original software. If you use this software in a product, an acknowledgment in the
--     product documentation would be appreciated but is not required.
--
--  2. Altered source versions must be plainly marked as such, and must not be misrepresented as
--     being the original software.
--
--  3. This notice may not be removed or altered from any source distribution.
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- Increment a PC by 4.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.common.all;

entity pc_plus_4 is
  port(
      i_pc : in std_logic_vector(C_WORD_SIZE-1 downto 0);
      o_pc_plus_4 : out std_logic_vector(C_WORD_SIZE-1 downto 0)
    );
end pc_plus_4;

architecture rtl of pc_plus_4 is
  signal s_carry : unsigned(0 downto 0);
  signal s_result : unsigned(C_WORD_SIZE-3 downto 0);
begin
  s_carry(0) <= '1';
  s_result <= resize(unsigned(i_pc(C_WORD_SIZE-1 downto 2)), C_WORD_SIZE-2) +
              s_carry;
  o_pc_plus_4(C_WORD_SIZE-1 downto 2) <= std_logic_vector(s_result(C_WORD_SIZE-3 downto 0));
  o_pc_plus_4(1 downto 0) <= "00";
end rtl;

