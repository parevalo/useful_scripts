#!/bin/bash

bs=(batch1 batch2 batch3 batch4 batch9 batch10 batch11 batch16 batch17 batch18)
mt=(h13v09 h12v09 h11v09 h10v09 h12v08 h11v08 h10v08 h12v10 h11v10 h10v10)

for i in $(seq 0 9); do
    for yr in $(seq 2003 2008); do
        oldpt="users/parevalo_bu/biomass/features/selectedprops_v5_"$yr"_pointvalue_"${bs[$i]}
	newpt="users/parevalo_bu/biomass/features/selectedprops_v5_"$yr"_pointvalue_"${mt[$i]} 
        oldpoly="users/parevalo_bu/biomass/features/selectedprops_v5_"$yr"_polymean_"${bs[$i]}
	newpoly="users/parevalo_bu/biomass/features/selectedprops_v5_"$yr"_polymean_"${mt[$i]} 
	
	
	echo "Renaming from $oldpt to $newpt"
	earthengine mv $oldpt $newpt
	
	echo "Renaming from $oldpoly to $newpoly"
	earthengine mv $oldpoly $newpoly
    done
done

