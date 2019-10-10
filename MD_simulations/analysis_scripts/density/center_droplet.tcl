
proc center_droplet {molid frames_begin frames_end dt} {

	
	set sel "resname DIM"

	
	for { set f1 $frames_begin } { $f1 < $frames_end } { incr f1 $dt } {
		set drop_sel [atomselect top $sel frame $f1]
		set center [measure center $drop_sel]
		set center_x [expr 0- [lindex $center 0]]
		set center_y [expr 0- [lindex $center 1]]
		set center_z [expr 0- [lindex $center 2]]
		set M [transoffset "$center_x $center_y $center_z"]
		set all [atomselect top "all" frame $f1]
		$all move $M
		puts "frame $f1"
		
		$all delete
		$drop_sel delete
		
		
	}
		
}
