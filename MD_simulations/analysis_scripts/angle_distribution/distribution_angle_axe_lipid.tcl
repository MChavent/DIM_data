# example for POPC and DOPE
# angle_dist top "resname POPC" "type PO4" 2500 3000 2  dist_angle_POPC_310K.dat
# angle_dist top "resname DOPE" "type PO4" 2500 3000 2  dist_angle_DOPE_310K.dat


proc create_file {filename list} {

    set data_file [open $filename w]   
    set list_length [llength $list]
  
  	for { set i 0 } { $i < $list_length } { incr i 1 } {
  	  
  		puts $data_file [lindex $list $i]  	
  	}
  	 	close $data_file
}

   proc plot_vec2 {molid coord_center vec} {

	set center_x [lindex $coord_center 0]
	set center_y [lindex $coord_center 1]
	set center_z [lindex $coord_center 2]

	set dir1_x [expr $center_x + 15*[lindex $vec 0]]
	set dir1_y [expr $center_y + 15*[lindex $vec 1]]
	set dir1_z [expr $center_z + 15*[lindex $vec 2]]

	graphics $molid color yellow
	graphics $molid sphere "$center_x $center_y $center_z" radius 0.5 resolution 20

	graphics $molid color red
	graphics $molid sphere "$dir1_x $dir1_y $dir1_z" radius 0.5 resolution 20
	graphics $molid line "$center_x $center_y $center_z" "$dir1_x $dir1_y $dir1_z" 


  }

proc principal_axe {molid sel_ref sel frame } {

	set selection [atomselect $molid $sel frame $frame]
	set ref [atomselect $molid $sel_ref frame $frame]

	set inertia [measure inertia $selection]

	set center_sel [measure center $selection]
	set center_ref [measure center $ref]

	set vector_temp [vecsub "[lindex $center_ref 0] [lindex $center_ref 1] [lindex $center_ref 2]" "[lindex $center_sel 0] [lindex $center_sel 1] [lindex $center_sel 2]"]
	set dir [lindex [lindex $inertia 1] 2] 	

	set dot [vecdot "[lindex $vector_temp 0] [lindex $vector_temp 1] [lindex $vector_temp 2]" "[lindex $dir 0] [lindex $dir 1] [lindex $dir 2]"]

	if {$dot  > 0} {
		#puts "neg"
		set vec0 [expr -1.0*[lindex $dir 0]]
		set vec1 [expr -1.0*[lindex $dir 1]]
		set vec2 [expr -1.0*[lindex $dir 2]]
		set dir "$vec0 $vec1 $vec2"
	}

	$selection delete
	$ref delete

	return $dir

}

proc angle_dist {molid sel sel_ref frame_start frame_end dt filename} {

	set list_angle ""	
	set x_vec_avg 0
	set PI_val 3.14159265359
	set resid_list [lsort -unique -integer [[atomselect $molid $sel] get resid]]
	

	for {set frame $frame_start} {$frame < $frame_end} {incr frame $dt} {
				
 

	    foreach resid $resid_list {	

		set vector [vecnorm [principal_axe $molid "$sel and resid $resid and $sel_ref" "$sel and resid $resid" $frame]]
		set sel_res [atomselect $molid "$sel and resid $resid" frame $frame]
		set center [measure center $sel_res]
		set costetha [vecdot "[lindex $vector 0] [lindex $vector 1] [lindex $vector 2]" "0 0 1"]
		set angle [expr acos($costetha)*(180.0/$PI_val)]	
		if {$angle > 90} {
			set angle [expr 180 -$angle]
		}
		#plot_vec2 $molid "[lindex $center 0] [lindex $center 1] [lindex $center 2]" "[lindex $vector 0] [lindex $vector 1] [lindex $vector 2]"
		#puts "$frame $angle"


		lappend list_angle $angle
		$sel_res delete
            }
 

		if {$frame%20 == 0} {
			puts $frame
		}
		
	} 
	
	create_file $filename $list_angle

  }
