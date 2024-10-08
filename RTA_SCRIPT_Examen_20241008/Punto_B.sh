#!/bin/bash

$DISCO= sudo fdisk -l | grep "2 GiB" | awk '{print $2}' | awk -F: '{print $1}'

NUM_PARTICIONES=10
TAMANIO_PARTICION="+100M"

{
	echo n
	for ((i=1; i<=NUM_PARTICIONES; i++)); do
		echo p
		echo $i
		echo
		echo $TAMANIO_PARTICION
	done
	echo w

} | sudo fdisk "$DISCO"


for ((i=1; i<=NUM_PARTICIONES; i++)); do
	PARTICION="${DISCO}${i}"
	echo "Formatenado a ext4 particion ${PARTICION}"
	sudo mkfs.ext4 "$PARTICION"
done


echo "${DISCO}1 /Examenes-UTN/alumno1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a


echo "${DISCO}2 /Examenes-UTN/alumno1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a

echo "${DISCO}3 /Examenes-UTN/alumno1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a

echo "${DISCO}4 /Examenes-UTN/alumno2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a

echo "${DISCO}5 /Examenes-UTN/alumno2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a

echo "${DISCO}6 /Examenes-UTN/alumno2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a

echo "${DISCO}7 /Examenes-UTN/alumno3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a

echo "${DISCO}8 /Examenes-UTN/alumno3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a

echo "${DISCO}9 /Examenes-UTN/alumno3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a

echo "${DISCO}10 /Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a

echo "Se formatearon y montaron las particiones"
