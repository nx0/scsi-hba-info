#!/bin/bash

echo "<======= `hostname` ======>"
z=1
for i in `cat /proc/scsi/qla2xxx/* | grep -E "adapter-port|adapter-node"`; do

      HBA=`echo $i | cut -d "-" -f 2`

      if (( $z%2 )); then
         echo "= $HBA ="

      fi


      if [ "`echo $i | grep 'adapter-port'`" ]; then
         echo -n "WWN: "
         echo "$i" | cut -d "=" -f 2 | tr -d ";"
      else
         echo -n "endpoint: "
         echo "$i" | cut -d "=" -f 2 | tr -d ";"
      fi
   let z=$z+1
done

