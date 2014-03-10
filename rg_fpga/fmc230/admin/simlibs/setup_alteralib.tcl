global env

set path_to_quartus $env(QUARTUS_ROOTDIR)
set target_path $env(SIMLIB_ROOTDIR)

cd $target_path/altera

vlib altera_ver
vmap altera_ver altera_ver
vlog -work altera_ver $path_to_quartus/eda/sim_lib/altera_primitives.v

vlib lpm_ver
vmap lpm_ver lpm_ver
vlog -work lpm_ver $path_to_quartus/eda/sim_lib/220model.v

vlib sgate_ver
vmap sgate_ver sgate_ver
vlog -work sgate_ver $path_to_quartus/eda/sim_lib/sgate.v

vlib altera_mf_ver
vmap altera_mf_ver altera_mf_ver
vlog -work altera_mf_ver $path_to_quartus/eda/sim_lib/altera_mf.v

vlib altera_lnsim_ver
vmap altera_lnsim_ver altera_lnsim_ver
vlog -sv -work altera_lnsim_ver $path_to_quartus/eda/sim_lib/altera_lnsim.sv


vlib altera
vmap altera altera
vcom -work altera -2002 -explicit $path_to_quartus/eda/sim_lib/altera_syn_attributes.vhd
vcom -work altera -2002 -explicit $path_to_quartus/eda/sim_lib/altera_standard_functions.vhd
vcom -work altera -2002 -explicit $path_to_quartus/eda/sim_lib/alt_dspbuilder_package.vhd
vcom -work altera -2002 -explicit $path_to_quartus/eda/sim_lib/altera_europa_support_lib.vhd
vcom -work altera -2002 -explicit $path_to_quartus/eda/sim_lib/altera_primitives_components.vhd
vcom -work altera -2002 -explicit $path_to_quartus/eda/sim_lib/altera_primitives.vhd

vlib lpm
vmap lpm lpm
vcom -work lpm -2002 -explicit $path_to_quartus/eda/sim_lib/220pack.vhd
vcom -work lpm -2002 -explicit $path_to_quartus/eda/sim_lib/220model.vhd

vlib sgate
vmap sgate sgate
vcom -work sgate -2002 -explicit $path_to_quartus/eda/sim_lib/sgate_pack.vhd
vcom -work sgate -2002 -explicit $path_to_quartus/eda/sim_lib/sgate.vhd

vlib altera_mf
vmap altera_mf altera_mf
vcom -work altera_mf -2002 -explicit $path_to_quartus/eda/sim_lib/altera_mf_components.vhd
vcom -work altera_mf -2002 -explicit $path_to_quartus/eda/sim_lib/altera_mf.vhd

vlib altera_lnsim
vmap altera_lnsim altera_lnsim
vcom -work altera_lnsim $path_to_quartus/eda/sim_lib/altera_lnsim_components.vhd
vlog -sv -work altera_lnsim $path_to_quartus/eda/sim_lib/mentor/altera_lnsim_for_vhdl.sv


vlib arriaii
vmap arriaii arriaii
vcom -work arriaii -2002 -explicit $path_to_quartus/eda/sim_lib/arriaii_atoms.vhd
vcom -work arriaii -2002 -explicit $path_to_quartus/eda/sim_lib/arriaii_components.vhd

vlib arriaii_ver
vmap arriaii_ver arriaii_ver
vlog -work arriaii_ver $path_to_quartus/eda/sim_lib/arriaii_atoms.v

vlib arriaii_hssi
vmap arriaii_hssi arriaii_hssi
vcom -work arriaii_hssi -2002 -explicit $path_to_quartus/eda/sim_lib/arriaii_hssi_components.vhd
vcom -work arriaii_hssi -2002 -explicit $path_to_quartus/eda/sim_lib/arriaii_hssi_atoms.vhd

vlib arriaii_hssi_ver
vmap arriaii_hssi_ver arriaii_hssi_ver
vlog -work arriaii_hssi_ver $path_to_quartus/eda/sim_lib/arriaii_hssi_atoms.v

vlib arriaii_pcie_hip
vmap arriaii_pcie_hip arriaii_pcie_hip
vcom -work arriaii_pcie_hip -2002 -explicit $path_to_quartus/eda/sim_lib/arriaii_pcie_hip_components.vhd
vcom -work arriaii_pcie_hip -2002 -explicit $path_to_quartus/eda/sim_lib/arriaii_pcie_hip_atoms.vhd

vlib arriaii_pcie_hip_ver
vmap arriaii_pcie_hip_ver arriaii_pcie_hip_ver
vlog -work arriaii_pcie_hip_ver $path_to_quartus/eda/sim_lib/arriaii_pcie_hip_atoms.v

vlib cycloneiv
vmap cycloneiv cycloneiv
vcom -work cycloneiv -2002 -explicit $path_to_quartus/eda/sim_lib/cycloneiv_atoms.vhd
vcom -work cycloneiv -2002 -explicit $path_to_quartus/eda/sim_lib/cycloneiv_components.vhd

vlib cycloneiv_ver
vmap cycloneiv_ver cycloneiv_ver
vlog -work cycloneiv_ver $path_to_quartus/eda/sim_lib/cycloneiv_atoms.v

vlib cycloneiv_hssi
vmap cycloneiv_hssi cycloneiv_hssi
vcom -work cycloneiv_hssi -2002 -explicit $path_to_quartus/eda/sim_lib/cycloneiv_hssi_components.vhd
vcom -work cycloneiv_hssi -2002 -explicit $path_to_quartus/eda/sim_lib/cycloneiv_hssi_atoms.vhd

vlib cycloneiv_hssi_ver
vmap cycloneiv_hssi_ver cycloneiv_hssi_ver
vlog -work cycloneiv_hssi_ver $path_to_quartus/eda/sim_lib/cyclonev_hssi_atoms.v

vlib stratixiv
vmap stratixiv stratixiv
vcom -work stratixiv -2002 -explicit $path_to_quartus/eda/sim_lib/stratixiv_atoms.vhd
vcom -work stratixiv -2002 -explicit $path_to_quartus/eda/sim_lib/stratixiv_components.vhd

vlib stratixiv_ver
vmap stratixiv_ver stratixiv_ver
vlog -work stratixiv_ver $path_to_quartus/eda/sim_lib/stratixiv_atoms.v

vlib stratixiv_hssi
vmap stratixiv_hssi stratixiv_hssi
vcom -work stratixiv_hssi -2002 -explicit $path_to_quartus/eda/sim_lib/stratixiv_hssi_components.vhd
vcom -work stratixiv_hssi -2002 -explicit $path_to_quartus/eda/sim_lib/stratixiv_hssi_atoms.vhd

vlib stratixiv_hssi_ver
vmap stratixiv_hssi_ver stratixiv_hssi_ver
vlog -work stratixiv_hssi_ver $path_to_quartus/eda/sim_lib/stratixiv_hssi_atoms.v


vlib stratixv_ver
vmap stratixv_ver stratixv_ver
vlog -work stratixv_ver $path_to_quartus/eda/sim_lib/mentor/stratixv_atoms_ncrypt.v
vlog -work stratixv_ver $path_to_quartus/eda/sim_lib/stratixv_atoms.v

vlib stratixv_hssi_ver
vmap stratixv_hssi_ver stratixv_hssi_ver
vlog -work stratixv_hssi_ver $path_to_quartus/eda/sim_lib/mentor/stratixv_hssi_atoms_ncrypt.v
vlog -work stratixv_hssi_ver $path_to_quartus/eda/sim_lib/stratixv_hssi_atoms.v

vlib stratixv_pcie_hip_ver
vmap stratixv_pcie_hip_ver stratixv_pcie_hip_ver
vlog -work stratixv_pcie_hip_ver $path_to_quartus/eda/sim_lib/mentor/stratixv_pcie_hip_atoms_ncrypt.v
vlog -work stratixv_pcie_hip_ver $path_to_quartus/eda/sim_lib/stratixv_pcie_hip_atoms.v

vlib arriav
vmap arriav arriav
vcom -work arriav -2002 -explicit $path_to_quartus/eda/sim_lib/arriav_atoms.vhd
vcom -work arriav -2002 -explicit $path_to_quartus/eda/sim_lib/arriav_components.vhd

vlib arriav_ver
vmap arriav_ver arriav_ver
vlog -work arriav_ver $path_to_quartus/eda/sim_lib/mentor/arriav_atoms_ncrypt.v
vlog -work arriav_ver $path_to_quartus/eda/sim_lib/mentor/arriav_hmi_atoms_ncrypt.v
vlog -work arriav_ver $path_to_quartus/eda/sim_lib/mentor/arriav_atoms_for_vhdl.v
vlog -work arriav_ver $path_to_quartus/eda/sim_lib/arriav_atoms.v

vlib arriav_hssi_ver
vmap arriav_hssi_ver arriav_hssi_ver
vlog -work arriav_hssi_ver $path_to_quartus/eda/sim_lib/mentor/arriav_hssi_atoms_ncrypt.v
vlog -work arriav_hssi_ver $path_to_quartus/eda/sim_lib/mentor/arriav_hssi_atoms_for_vhdl.v
vlog -work arriav_hssi_ver $path_to_quartus/eda/sim_lib/arriav_hssi_atoms.v

vlib arriav_pcie_hip_ver
vmap arriav_pcie_hip_ver arriav_pcie_hip_ver
vlog -work arriav_pcie_hip_ver $path_to_quartus/eda/sim_lib/mentor/arriav_pcie_hip_atoms_ncrypt.v
vlog -work arriav_pcie_hip_ver $path_to_quartus/eda/sim_lib/mentor/arriav_pcie_hip_atoms_for_vhdl.v
vlog -work arriav_pcie_hip_ver $path_to_quartus/eda/sim_lib/arriav_pcie_hip_atoms.v

exit

   