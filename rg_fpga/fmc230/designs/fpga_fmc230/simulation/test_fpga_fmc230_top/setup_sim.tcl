puts {
  ModelSim Compile Script
  Version 1.0
  Project: FMC230
  Rohde & Schwarz
}

global env

set script_path [pwd] 
set workdir     [file join $env(WORK) work_fpga_fmc230_top]
set wave_file   [file join $script_path wave.do] 
set cc_rootdir  [file join .. .. .. .. ..]

cd $cc_rootdir
set cc_rootdir [pwd]

# Change to Working Directory..
if [catch {cd $workdir}] {
  puts "Workdir doesn't exist. Creating.."
  file mkdir $workdir
  cd $workdir
}

eval {transcript file [file join $workdir transcript]}
file delete [file join $script_path transcript]

set library_file_list {    
                        fpga_fmc230 {
                        fmc230/designs/fpga_fmc230/scripts/sim_source_files.txt
                        }
}

set top_level fpga_fmc230.fpga_fmc230_top_tb
set vsim_opt ""

puts "Mapping Vendor Specific Libraries..";
vmap unisim         [file join $env(SIMLIB_ROOTDIR) xilinx unisim]
vmap xilinxcorelib  [file join $env(SIMLIB_ROOTDIR) xilinx xilinxcorelib]

# --
# Here starts the generic script part. There should be no need to change this section..
# --
#
# Prefer a fixed point font for the transcript
set PrefMain(font) {Verdana 10 roman normal}

if [catch {set last_compile_time}] {
  set last_compile_time 0
}

set menu_string "
    Script commands are:
    
       tc_1 = Test FPGA Top

          c = Recompile changed and dependent files
         cc = Recompile everything
          r = run -all (with runtime measure)
          s = Store current waveform file
          a = Log all signals in simulation
          q = Quit without confirmation";

proc make {} {

    global script_path
    global workdir
    global cc_rootdir
    global wave_file
    global library_file_list
    global top_level
    global last_compile_time
    global vsim_opt
    global menu_string
    
    # Compile out of date files
    set time_now [clock seconds]
    # Walk through external file lists..
    foreach {library file_list_name} $library_file_list {
        vlib $library
        vmap work $library    
        foreach file $file_list_name {
            puts "test $file test"
            set file_path [file join $cc_rootdir $file]
            puts "Invoke Filelist: $file_path"
            set f_file_list [open $file_path r]
            puts "File $file_path opened.."
            while {[gets $f_file_list line] >= 0} {
                set cc_file [file join $cc_rootdir $line]
                if { $last_compile_time < [file mtime $cc_file] } {
                    puts "Compile $cc_file.."
                    if [regexp "vh." $cc_file] {
                        vcom +acc=v $cc_file
                    } elseif [regexp ".sv" $cc_file] {
                        vlog -sv +incdir+.. +define+FUNC_SIM +acc -timescale "1 ns / 1 ps" $cc_file
                    } else {
                        vlog +incdir+.. +define+FUNC_SIM +acc -timescale "1 ns / 1 ps" $cc_file
                    }
                } else {
                    puts "$cc_file is up to date.."
                }
            }
            close $f_file_list
        }
    }
    set last_compile_time $time_now
    # Load the simulation
    eval vsim $vsim_opt $top_level
    
    # load waveforms
    if [file exists wave.do] {
        puts "wave present. loading from wave.do"
        source wave.do
    } else {
        puts "wave not present. creating.."
        source $wave_file
        write format wave -window .main_pane.wave.interior.cs.body.pw.wf wave.do
    }
    # Print Simulation Menu
    puts $menu_string  
}

proc tc_1 {} {
    
    global script_path
    global cc_rootdir
    global wave_file
    global vsim_opt
    global top_level
    
    set vsim_opt "-t ps -novopt "
    
    set wave_file [file join $script_path tc_1_wave.do]
    # Delete possibly present wave.do
    if [file exists wave.do] {
        puts "Deleting old wave.do.."
        file delete wave.do
    }

    # Load Simulation
    cc
    } 


proc c  {} {
            if [file exists wave.do] {
              write format wave -window .main_pane.wave.interior.cs.body.pw.wf wave.do
            } 
            #recompile über make
            uplevel #0 make
            }
            
proc cc {} {
            global last_compile_time
            set last_compile_time 0
            c                            }
proc s  {} {
            global wave_file
            write format wave -window .main_pane.wave.interior.cs.body.pw.wf wave.do $wave_file}
            
proc q  {} {
            quit -force        
           }
proc a {}  {add log -r /*}

proc m {} {
		global menu_string
	  puts $menu_string
}
proc lw {wave_num} {
	                global script_path
	                set wave_file_name "tc_$wave_num\_wave.do"
	                do [file join $script_path $wave_file_name]
}

proc dw {} {
	        delete wave / *
}

proc w {} {
        	global  StdArithNoWarnings
        	global  NumericStdNoWarnings
        	set     StdArithNoWarnings 1
        	set     NumericStdNoWarnings 1
}	

proc r  {} {
	time {run -all}
	}    