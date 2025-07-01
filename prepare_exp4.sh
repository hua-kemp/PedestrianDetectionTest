#!/bin/bash

echo "Starting image conversion for pedestrians..."

## Convert pedestrian and non-pedestrian images
ls -1 /mnt/c/Users/joshu/Pictures/TestSet/OpensesameImages/NoPedestrians/*.png | parallel convert '{} -shave 2x2' '-resize 50% -quality 75% {.}.jpg'
ls -1 /mnt/c/Users/joshu/Pictures/TestSet/OpensesameImages/Pedestrians/*.png | parallel convert '{} -shave 2x2' '-resize 50% -quality 75% {.}.jpg'

# --- CSV CREATION MUST HAPPEN HERE, AFTER CONVERSION BUT BEFORE MOVING ---

## Create ordered list of image file names
ls -1 /mnt/c/Users/joshu/Pictures/TestSet/OpensesameImages/NoPedestrians/*.jpg > /mnt/c/Users/joshu/Pictures/TestSet/OpensesameImages/NoPedestrians/no_pedestrians-list.csv
ls -1 /mnt/c/Users/joshu/Pictures/TestSet/OpensesameImages/Pedestrians/*.jpg > /mnt/c/Users/joshu/Pictures/TestSet/OpensesameImages/Pedestrians/pedestrians-list.csv

## Move all JPGs into the single folder for use
mv /mnt/c/Users/joshu/Pictures/TestSet/OpensesameImages/NoPedestrians/*.jpg /mnt/c/Users/joshu/Pictures/TestSet/OpensesameImages/All_JPGs/NoPedestrians/
mv /mnt/c/Users/joshu/Pictures/TestSet/OpensesameImages/Pedestrians/*.jpg /mnt/c/Users/joshu/Pictures/TestSet/OpensesameImages/All_JPGs/Pedestrians/