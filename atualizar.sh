#!/bin/bash

# Elaborado por Vinicius A Oliveira
# copiar arquivos do github
# para cirar o diret�rio local: git clone /caminho_do_reposit�rio

#opcao=$(dialog --stdout --title "Github" --menu "Escolha uma op��o" 0 0 0 1 'Upload' 2 'Dowload')

echo 'Fazer (U)pload ou (D)ownload?'
read opcao

# bloco principal
case $opcao in
	U)
		git add *
		echo "Qual o coment�rio?"
		read com
		git commit -m $com 
		git push origin master;;
	D)
		git pull;;
esac
