# DIM head
#get_xy "resname DIM and name O5 C93 C94 C95 C96 C97 C92 C91 C90 C89" 0 0 13930 1
# DIM tails
# get_xy "resname DIM and name O5 C80 C 79 C78 C77 C76 C61 C30 C29 C28 C27 C60 C57 C56 C55 C54" 0 0 13930 1
# POPC head
#get_xy "resname PC PA OL and residue 339 340 341 and name C21 C35 C34 N31 C33 O22 C32 C31 O32 P31 C11 O33 O34 C3 C2 O12 C1 O11 O21" 0 0 13930 1
# POPC tails
#get_xy "(resname OL and residue 339 340 341 and name C118 C117 C116 C115 C114 ) or (resname PA and residue 339 340 341 and name C112 C113 C114 C115 C116)" 0 0 13930 1

# DIM head CG (/data/DIM/DIM_CG_short_V3/run/DIM)
#get_xy "resname DIM and name GB1 C1A" 0 0 3000 1
# DIM tails (/data/DIM/DIM_CG_short_V3/run/DIM)
#get_xy "resname DIM and name C7A C7B C7C" 0 0 3000 1
# DIM z distance
#get_distance "resname DIM and name GB1 C1A" "resname DIM and name C7A C7B C7C" 0 0 3000 1  


# POPC head CG (/data/DIM/DIM_CG_short_V3/run/DIM)
#get_xy "resname POPC and resid 2 and name NC3" 0 0 3000 1
# POPC tails (/data/DIM/DIM_CG_short_V3/run/DIM)
#get_xy "resname POPC and resid 2 and name C4A C4B" 0 0 3000 1

# DOPE head (/data/hexagonal_phase/models/run/4_bilayers/PEPC_31_aniso_martini/310/)
#get_xy "resname DOPE and resid 10 and name NH3" 0 0 3000 1
# DOPE tails (/data/hexagonal_phase/models/run/4_bilayers/PEPC_31_aniso_martini/310/)
#get_xy "resname DOPE and resid 10 and name C4A C4B" 0 0 3000 1

# TAG head: 
#get_xy "resname TAG and name ES1 ES2 ES3" 0 0 3000 1
#get_xy "resname TAG and name C4A C4B C4C" 0 0 3000 1


# POPE: 
#get_xy "resname POPE" 0 0 2500 1

# POPC: 
#get_xy "resname POPE" 0 0 2500 1

# DIM: 
#get_xy "resname DIM" 0 0 2500 1

# create the ouput files to use for the python script
proc create_file {filename list} {

    set data_file [open $filename w]   
    set list_length [llength $list]
  
  	for { set i 0 } { $i < $list_length } { incr i 1 } {
  	  
  		puts $data_file [lindex $list $i]  	
  	}
  	 	close $data_file
}

# create the ouput files to use for the python script
proc get_xy {sel molid_sel frames_begin frames_end dt} {

	set list_x ""
	set list_y ""

	for { set f1 $frames_begin } { $f1 < $frames_end } { incr f1 $dt } {

		set sel1 [atomselect $molid_sel $sel frame $f1 ]
		set x_value [$sel1 get {x}]
		set y_value [$sel1 get {y}]
		lappend list_x $x_value
		lappend list_y $y_value

		puts $f1

	}
	set list_x [concat {*}$list_x]
	set list_y [concat {*}$list_y]
	

	create_file "density_x_DIM.dat" $list_x
	create_file "density_y_DIM.dat" $list_y

}

proc get_distance {sel1 sel2 molid_sel frames_begin frames_end dt} {

	set list_distance ""

	for { set f1 $frames_begin } { $f1 < $frames_end } { incr f1 $dt } {

		set selec1 [atomselect $molid_sel $sel1 frame $f1 ]
		set selec2 [atomselect $molid_sel $sel2 frame $f1 ]
		set center1 [measure center $selec1]
		set center2 [measure center $selec2]
		set z1 [lindex $center1 2]
		set z2 [lindex $center2 2]
		set distance [expr sqrt(($z1 -$z2)*($z1 -$z2))]
		lappend list_distance $distance
	

		puts $f1
		

	}
	set list_distance [concat {*}$list_distance]


	create_file "distance_dim.dat" $list_distance

}

