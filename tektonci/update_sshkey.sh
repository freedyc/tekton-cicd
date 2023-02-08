kubectl -n cicd patch secrets ssh-key -p "{\"data\":{\"ssh-privatekey\":\"$(cat ~/.ssh/webbot |base64 -w0)\"}}"
