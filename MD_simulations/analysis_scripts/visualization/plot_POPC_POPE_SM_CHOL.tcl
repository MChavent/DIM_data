
#plot_lip top "resname POPC" POPC red Opaque 0.1 0.2
#plot_lip top "resname POPE" POPE blue Opaque 0.1 0.2
#plot_lip top "resname DPSM" DPSM purple Opaque 0.1 0.2
#plot_lip top "resname CHOL" CHOL green Opaque 0.3 0.4

proc plot_POPC {molid resid color material radius_bond radius_sphere} {

	#set list_name [[atomselect $molid "resid $resid"] get name]
	set coord_NC3 [measure center [atomselect $molid "resid $resid and name NC3"]]
	set coord_PO4 [measure center [atomselect $molid "resid $resid and name PO4"]]
	set coord_GL1 [measure center [atomselect $molid "resid $resid and name GL1"]]
	set coord_GL2 [measure center [atomselect $molid "resid $resid and name GL2"]]
	set coord_C1A [measure center [atomselect $molid "resid $resid and name C1A"]]
	set coord_D2A [measure center [atomselect $molid "resid $resid and name D2A"]]
	set coord_C3A [measure center [atomselect $molid "resid $resid and name C3A"]]
	set coord_C4A [measure center [atomselect $molid "resid $resid and name C4A"]]
	set coord_C1B [measure center [atomselect $molid "resid $resid and name C1B"]]
	set coord_C2B [measure center [atomselect $molid "resid $resid and name C2B"]]
	set coord_C3B [measure center [atomselect $molid "resid $resid and name C3B"]]
	set coord_C4B [measure center [atomselect $molid "resid $resid and name C4B"]]

	graphics $molid color $color
	graphics $molid material $material		

	#create spĥere
	graphics $molid sphere $coord_NC3 radius $radius_sphere resolution 23
	graphics $molid sphere $coord_PO4 radius $radius_sphere resolution 23
	graphics $molid sphere $coord_GL1 radius $radius_sphere resolution 23
	graphics $molid sphere $coord_GL2 radius $radius_sphere resolution 23

	graphics $molid sphere $coord_C1A radius $radius_sphere resolution 23
	graphics $molid sphere $coord_D2A radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C3A radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C4A radius $radius_sphere resolution 23

	graphics $molid sphere $coord_C1B radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C2B radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C3B radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C4B radius $radius_sphere resolution 23

	#create bonds
	set distance [veclength [vecsub $coord_NC3 $coord_PO4 ]]
	if {$distance < 40} {	graphics $molid cylinder $coord_NC3 $coord_PO4 radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_PO4 $coord_GL1]]
	if {$distance < 40} {	graphics $molid cylinder $coord_PO4 $coord_GL1 radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_GL2 $coord_GL1]]
	if {$distance < 40} {	graphics $molid cylinder $coord_GL1 $coord_GL2 radius $radius_bond resolution 23 filled yes}

	set distance [veclength [vecsub $coord_GL1 $coord_C1A]]
	if {$distance < 40} {	graphics $molid cylinder $coord_GL1 $coord_C1A radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_D2A $coord_C1A]]
	if {$distance < 40} {	graphics $molid cylinder $coord_C1A $coord_D2A radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_D2A $coord_C3A]]
	if {$distance < 40} {	graphics $molid cylinder $coord_D2A $coord_C3A radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C3A $coord_C4A]]
	if {$distance < 40} {	graphics $molid cylinder $coord_C3A $coord_C4A radius $radius_bond resolution 23 filled yes}
	
	set distance [veclength [vecsub $coord_GL2 $coord_C1B]]
	if {$distance < 40} {	graphics $molid cylinder $coord_GL2 $coord_C1B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C2B $coord_C1B]]
	if {$distance < 40} {	graphics $molid cylinder $coord_C1B $coord_C2B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C2B $coord_C3B]]
	if {$distance < 40} {	graphics $molid cylinder $coord_C2B $coord_C3B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C4B $coord_C3B]]
	if {$distance < 40} {	graphics $molid cylinder $coord_C3B $coord_C4B radius $radius_bond resolution 23 filled yes}


}


proc plot_POPE {molid resid color material radius_bond radius_sphere} {

	#set list_name [[atomselect $molid "resid $resid"] get name]
	set coord_NH3 [measure center [atomselect $molid "resname POPE and resid $resid and name NH3"]]
	set coord_PO4 [measure center [atomselect $molid "resname POPE and resid $resid and name PO4"]]
	set coord_GL1 [measure center [atomselect $molid "resname POPE and resid $resid and name GL1"]]
	set coord_GL2 [measure center [atomselect $molid "resname POPE and resid $resid and name GL2"]]
	set coord_C1A [measure center [atomselect $molid "resname POPE and resid $resid and name C1A"]]
	set coord_D2A [measure center [atomselect $molid "resname POPE and resid $resid and name D2A"]]
	set coord_C3A [measure center [atomselect $molid "resname POPE and resid $resid and name C3A"]]
	set coord_C4A [measure center [atomselect $molid "resname POPE and resid $resid and name C4A"]]
	set coord_C1B [measure center [atomselect $molid "resname POPE and resid $resid and name C1B"]]
	set coord_C2B [measure center [atomselect $molid "resname POPE and resid $resid and name C2B"]]
	set coord_C3B [measure center [atomselect $molid "resname POPE and resid $resid and name C3B"]]
	set coord_C4B [measure center [atomselect $molid "resname POPE and resid $resid and name C4B"]]

	graphics $molid color $color
	graphics $molid material $material		

	#create spĥere
	graphics $molid sphere $coord_NH3 radius $radius_sphere resolution 23
	graphics $molid sphere $coord_PO4 radius $radius_sphere resolution 23
	graphics $molid sphere $coord_GL1 radius $radius_sphere resolution 23
	graphics $molid sphere $coord_GL2 radius $radius_sphere resolution 23

	graphics $molid sphere $coord_C1A radius $radius_sphere resolution 23
	graphics $molid sphere $coord_D2A radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C3A radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C4A radius $radius_sphere resolution 23

	graphics $molid sphere $coord_C1B radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C2B radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C3B radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C4B radius $radius_sphere resolution 23

	#create bonds
	set distance [veclength [vecsub $coord_NH3 $coord_PO4 ]]
	if {$distance < 40} {graphics $molid cylinder $coord_NH3 $coord_PO4 radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_PO4 $coord_GL1]]
	if {$distance < 40} {	graphics $molid cylinder $coord_PO4 $coord_GL1 radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_GL2 $coord_GL1]]
	if {$distance < 40} {	graphics $molid cylinder $coord_GL1 $coord_GL2 radius $radius_bond resolution 23 filled yes}

	set distance [veclength [vecsub $coord_GL1 $coord_C1A]]
	if {$distance < 40} {graphics $molid cylinder $coord_GL1 $coord_C1A radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_D2A $coord_C1A]]
	if {$distance < 40} {graphics $molid cylinder $coord_C1A $coord_D2A radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_D2A $coord_C3A]]
	if {$distance < 40} {graphics $molid cylinder $coord_D2A $coord_C3A radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C3A $coord_C4A]]
	if {$distance < 40} {graphics $molid cylinder $coord_C3A $coord_C4A radius $radius_bond resolution 23 filled yes}
	
	set distance [veclength [vecsub $coord_GL2 $coord_C1B]]
	if {$distance < 40} {graphics $molid cylinder $coord_GL2 $coord_C1B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C2B $coord_C1B]]
	if {$distance < 40} {graphics $molid cylinder $coord_C1B $coord_C2B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C2B $coord_C3B]]
	if {$distance < 40} {graphics $molid cylinder $coord_C2B $coord_C3B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C4B $coord_C3B]]
	if {$distance < 40} {graphics $molid cylinder $coord_C3B $coord_C4B radius $radius_bond resolution 23 filled yes}


}


proc plot_DPSM {molid resid color material radius_bond radius_sphere} {

	#set list_name [[atomselect $molid "resid $resid"] get name]
	set coord_NC3 [measure center [atomselect $molid "resname DPSM and resid $resid and name NC3"]]
	set coord_PO4 [measure center [atomselect $molid "resname DPSM and resid $resid and name PO4"]]
	set coord_AM1 [measure center [atomselect $molid "resname DPSM and resid $resid and name AM1"]]
	set coord_AM2 [measure center [atomselect $molid "resname DPSM and resid $resid and name AM2"]]
	set coord_T1A [measure center [atomselect $molid "resname DPSM and resid $resid and name T1A"]]
	set coord_C2A [measure center [atomselect $molid "resname DPSM and resid $resid and name C2A"]]
	set coord_C3A [measure center [atomselect $molid "resname DPSM and resid $resid and name C3A"]]
	set coord_C1B [measure center [atomselect $molid "resname DPSM and resid $resid and name C1B"]]
	set coord_C2B [measure center [atomselect $molid "resname DPSM and resid $resid and name C2B"]]
	set coord_C3B [measure center [atomselect $molid "resname DPSM and resid $resid and name C3B"]]
	set coord_C4B [measure center [atomselect $molid "resname DPSM and resid $resid and name C4B"]]

	graphics $molid color $color
	graphics $molid material $material		

	#create spĥere
	graphics $molid sphere $coord_NC3 radius $radius_sphere resolution 23
	graphics $molid sphere $coord_PO4 radius $radius_sphere resolution 23
	graphics $molid sphere $coord_AM1 radius $radius_sphere resolution 23
	graphics $molid sphere $coord_AM2 radius $radius_sphere resolution 23

	graphics $molid sphere $coord_T1A radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C2A radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C3A radius $radius_sphere resolution 23

	graphics $molid sphere $coord_C1B radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C2B radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C3B radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C4B radius $radius_sphere resolution 23

	#create bonds
	set distance [veclength [vecsub $coord_NC3 $coord_PO4 ]]
	if {$distance < 40} {graphics $molid cylinder $coord_NC3 $coord_PO4 radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_PO4 $coord_AM1]]
	if {$distance < 40} {	graphics $molid cylinder $coord_PO4 $coord_AM1 radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_AM2 $coord_AM1]]
	if {$distance < 40} {	graphics $molid cylinder $coord_AM1 $coord_AM2 radius $radius_bond resolution 23 filled yes}

	set distance [veclength [vecsub $coord_AM1 $coord_T1A]]
	if {$distance < 40} {graphics $molid cylinder $coord_AM1 $coord_T1A radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C2A $coord_T1A]]
	if {$distance < 40} {graphics $molid cylinder $coord_T1A $coord_C2A radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C2A $coord_C3A]]
	if {$distance < 40} {graphics $molid cylinder $coord_C2A $coord_C3A radius $radius_bond resolution 23 filled yes}
	
	set distance [veclength [vecsub $coord_AM2 $coord_C1B]]
	if {$distance < 40} {graphics $molid cylinder $coord_AM2 $coord_C1B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C2B $coord_C1B]]
	if {$distance < 40} {graphics $molid cylinder $coord_C1B $coord_C2B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C2B $coord_C3B]]
	if {$distance < 40} {graphics $molid cylinder $coord_C2B $coord_C3B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C4B $coord_C3B]]
	if {$distance < 40} {graphics $molid cylinder $coord_C3B $coord_C4B radius $radius_bond resolution 23 filled yes}


}

proc plot_CHOL {molid resid color material radius_bond radius_sphere} {

	set coord_ROH [measure center [atomselect $molid "resid $resid and name ROH"]]
	set coord_R2 [measure center [atomselect $molid "resid $resid and name R2"]]
	set coord_R3 [measure center [atomselect $molid "resid $resid and name R3"]]
	set coord_C1 [measure center [atomselect $molid "resid $resid and name C1"]]
	set coord_C2 [measure center [atomselect $molid "resid $resid and name C2"]]

	graphics $molid color $color
	graphics $molid material $material		

	#create spĥere
	graphics $molid sphere $coord_ROH radius $radius_sphere resolution 23
	graphics $molid sphere $coord_R2 radius $radius_sphere resolution 23
	graphics $molid sphere $coord_R3 radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C1 radius $radius_sphere resolution 23
	graphics $molid sphere $coord_C2 radius $radius_sphere resolution 23

	#create bonds
	set distance [veclength [vecsub $coord_ROH $coord_R2 ]]
	if {$distance < 40} {	graphics $molid cylinder $coord_ROH $coord_R2 radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_ROH $coord_R3]]
	if {$distance < 40} {	graphics $molid cylinder $coord_ROH $coord_R3 radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_R2 $coord_R3]]
	if {$distance < 40} {	graphics $molid cylinder $coord_R2 $coord_R3 radius $radius_bond resolution 23 filled yes}
	
	set distance [veclength [vecsub $coord_R2 $coord_C1]]
	if {$distance < 40} {	graphics $molid cylinder $coord_R2 $coord_C1 radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_R3 $coord_C1]]
	if {$distance < 40} {	graphics $molid cylinder $coord_C1 $coord_R3 radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C1 $coord_C2]]
	if {$distance < 40} {	graphics $molid cylinder $coord_C2 $coord_C1 radius $radius_bond resolution 23 filled yes}


}



proc plot_lip {molid sel lip color material radius_bond radius_sphere} {

	set list_res [lsort -integer -unique [[atomselect top $sel] get resid]]

	if {$lip=="POPE"} {
		foreach resid $list_res {
			plot_POPE $molid $resid $color $material $radius_bond $radius_sphere
		}
	}

	if {$lip=="POPC"} {
		foreach resid $list_res {
			plot_POPC $molid $resid $color $material $radius_bond $radius_sphere
		}
	}

	if {$lip=="DPSM"} {
		foreach resid $list_res {
			plot_DPSM $molid $resid $color $material $radius_bond $radius_sphere
		}
	}

	if {$lip=="CHOL"} {
		foreach resid $list_res {
			plot_CHOL $molid $resid $color $material $radius_bond $radius_sphere
		}
	}
}

