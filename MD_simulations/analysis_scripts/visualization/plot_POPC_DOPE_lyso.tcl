
#plot_lip top "resname POPC" POPC red Opaque 0.1 0.2
#plot_lip top "resname DOPE" DOPE blue Opaque 0.1 0.2
#plot_lip top "resname PPC" PPC orange Opaque 0.6 0.8

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


proc plot_DOPE {molid resid color material radius_bond radius_sphere} {

	#set list_name [[atomselect $molid "resid $resid"] get name]
	set coord_NH3 [measure center [atomselect $molid "resname DOPE and resid $resid and name NH3"]]
	set coord_PO4 [measure center [atomselect $molid "resname DOPE and resid $resid and name PO4"]]
	set coord_GL1 [measure center [atomselect $molid "resname DOPE and resid $resid and name GL1"]]
	set coord_GL2 [measure center [atomselect $molid "resname DOPE and resid $resid and name GL2"]]
	set coord_C1A [measure center [atomselect $molid "resname DOPE and resid $resid and name C1A"]]
	set coord_D2A [measure center [atomselect $molid "resname DOPE and resid $resid and name D2A"]]
	set coord_C3A [measure center [atomselect $molid "resname DOPE and resid $resid and name C3A"]]
	set coord_C4A [measure center [atomselect $molid "resname DOPE and resid $resid and name C4A"]]
	set coord_C1B [measure center [atomselect $molid "resname DOPE and resid $resid and name C1B"]]
	set coord_D2B [measure center [atomselect $molid "resname DOPE and resid $resid and name D2B"]]
	set coord_C3B [measure center [atomselect $molid "resname DOPE and resid $resid and name C3B"]]
	set coord_C4B [measure center [atomselect $molid "resname DOPE and resid $resid and name C4B"]]

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
	graphics $molid sphere $coord_D2B radius $radius_sphere resolution 23
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
	set distance [veclength [vecsub $coord_D2B $coord_C1B]]
	if {$distance < 40} {graphics $molid cylinder $coord_C1B $coord_D2B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_D2B $coord_C3B]]
	if {$distance < 40} {graphics $molid cylinder $coord_D2B $coord_C3B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C4B $coord_C3B]]
	if {$distance < 40} {graphics $molid cylinder $coord_C3B $coord_C4B radius $radius_bond resolution 23 filled yes}


}


proc plot_PPC {molid resid color material radius_bond radius_sphere} {


	#set list_name [[atomselect $molid "resid $resid"] get name]
	set coord_NC3 [measure center [atomselect $molid "resid $resid and name NC3"]]
	set coord_PO4 [measure center [atomselect $molid "resid $resid and name PO4"]]
	set coord_GL1 [measure center [atomselect $molid "resid $resid and name GL1"]]
	set coord_GL2 [measure center [atomselect $molid "resid $resid and name GL2"]]
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
	
	set distance [veclength [vecsub $coord_GL2 $coord_C1B]]
	if {$distance < 40} {	graphics $molid cylinder $coord_GL2 $coord_C1B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C2B $coord_C1B]]
	if {$distance < 40} {	graphics $molid cylinder $coord_C1B $coord_C2B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C2B $coord_C3B]]
	if {$distance < 40} {	graphics $molid cylinder $coord_C2B $coord_C3B radius $radius_bond resolution 23 filled yes}
	set distance [veclength [vecsub $coord_C4B $coord_C3B]]
	if {$distance < 40} {	graphics $molid cylinder $coord_C3B $coord_C4B radius $radius_bond resolution 23 filled yes}


}



proc plot_lip {molid sel lip color material radius_bond radius_sphere} {

	set list_res [lsort -integer -unique [[atomselect top $sel] get resid]]

	if {$lip=="DOPE"} {
		foreach resid $list_res {
			plot_DOPE $molid $resid $color $material $radius_bond $radius_sphere
		}
	}

	if {$lip=="POPC"} {
		foreach resid $list_res {
			plot_POPC $molid $resid $color $material $radius_bond $radius_sphere
		}
	}

	if {$lip=="PPC"} {
		foreach resid $list_res {
			plot_PPC $molid $resid $color $material $radius_bond $radius_sphere
		}
	}
}

