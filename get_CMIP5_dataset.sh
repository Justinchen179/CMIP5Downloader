#!/bin/sh

model=GFDL-CM3
model_url=http://esgdata.gfdl.noaa.gov/thredds/fileServer/gfdl_dataroot/NOAA-GFDL/GFDL-CM3
ensemble_member=r1i1p1
version_number=v20110601
mip_table=Amon
mkdir $model

# experiment: 1pctCO2 1pctto2x 2xco2 amip commit historical piControl slabcntl sresa1b sresa2 sresb1
experiment=piControl

start_year=1	
start_mon=01     # mm(01-12) 
end_year=500	
end_mon=12       # mm(01-12) 
interval_years=5 # y(1-99)
start_year=$(($start_year))	
end_year=$(($end_year))	
diff_years=$(($interval_years-1))

# time_frequency: 3hr day fx mon yr
time_frequency=mon

# realm      : atmos 
# variable   : cdd cl clivi clt clwvi etr fd gsl hfls hfss hur hus huss hwdi pr prc prsn prw ps psl r10 r5d r95t rlds rldscs rlntp rlntpcs rlus rlut rlutcs rsds rsdscs rsdt rsntp rsntpcs rsus rsuscs rsut rsutcs rtmt sdii ta tas tasmax tasmin tauu tauv tn90 tro3 ts ua uas va vas wap zg
# realm      : ice 
# variable   : hfsib sbl sic sit sltfsib
# realm      : land 
# variable   : mrro mrros mrso mrsofc orog sftgif sftlf snd snm snw
# realm      : ocean 
# variable   : hfogo htovdiff htovgyre htovovrt rhopoto sltovdiff sltovgyre sltovovrt so stfbarot stfmmc stfmmcgm thetao tos uo usi vo vsi wfo wo zmlo zobt zos
realm=atmos


for variable in  ua va 
    do
        for year in $(seq $start_year $interval_years $end_year)
            do  
                star_year=$year
                end_year=$(($year + $diff_years))
                    start_zero=$(($diff_years-`expr length "$star_year"`)) 
                    end_zero=$(($diff_years-`expr length "$end_year"`)) 
                if [ $start_zero -eq 0 ]
                    then
                        loop_start_year=${star_year}
                elif [ $start_zero -eq 1 ]
                    then
                        loop_start_year=0${star_year}
                elif [ $start_zero -eq 2 ]
                    then
                        loop_start_year=00${star_year}
                elif [ $start_zero -eq 3 ]
                    then
                        loop_start_year=000${star_year}
                fi

                if [ $end_zero -eq 0 ]
                    then
                        loop_end_year=${end_year}
                elif [ $end_zero -eq 1 ]
                    then
                        loop_end_year=0${end_year}
                elif [ $end_zero -eq 2 ]
                    then
                        loop_end_year=00${end_year}
                elif [ $end_zero -eq 3 ]
                    then
                        loop_end_year=000${end_year}
                fi
                wget "${model_url}/${experiment}/${time_frequency}/${realm}/${mip_table}/${ensemble_member}/${version_number}/${variable}/${variable}_${mip_table}_${model}_${experiment}_${ensemble_member}_${loop_start_year}${start_mon}-${loop_end_year}${end_mon}.nc"
            done
    done
