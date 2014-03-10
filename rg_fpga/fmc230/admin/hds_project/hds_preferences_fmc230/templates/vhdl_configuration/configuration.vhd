FILE_NAMING_RULE: %(entity_name)_%(arch_name)_config.vhd
DESCRIPTION_START
This is the default template used for the creation of VHDL Configuration files.
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
CONFIGURATION %(entity_name)_config OF %(entity_name) IS
   FOR %(arch_name)
   END FOR;
END %(entity_name)_config;

