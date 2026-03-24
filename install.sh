#!/bin/bash
# Controllo se l'utente ha i privilegi di root
if [ "$EUID" -ne 0 ]; then 
  echo "Per favore, esegui lo script come root (usa sudo)."
  exit
fi
echo "--- Aggiornamento del sistema in corso... ---"
apt update && apt upgrade -y
echo "--- Installazione di Samba, Node.js e NPM... ---"
apt install samba samba-common samba-common-bin samba-libs samba-vfs-modules nodejs npm micro -y
echo "--- Installazione completata con successo! ---"
if [ -d "/ezsrvshare" ]; then
  echo "Share's directory already exist!"
else
  sudo mkdir /ezsrvshare
fi
