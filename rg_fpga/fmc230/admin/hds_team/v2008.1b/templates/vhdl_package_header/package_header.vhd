FILE_NAMING_RULE: %(entity_name)_pkg.vhd
DESCRIPTION_START
This is the default template used for the creation of VHDL Package Header files.
Template supplied by Mentor Graphics.
DESCRIPTION_END
-------------------------------------------------------------------------------
-- Title      : 
-- Project    : 
-------------------------------------------------------------------------------
-- File       : 
-- Author     : %(user)
-- Company    : Rohde & Schwarz
-- Last update: 
-- Platform   : PC
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date     Version     Author      Description
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package %(entity_name) is


end %(entity_name);