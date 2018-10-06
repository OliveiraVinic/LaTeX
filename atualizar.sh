#!/bin/bash

# Elaborado por Vinicius A Oliveira
# copiar arquivos do github
# para cirar o diretório local: git clone /caminho_do_repositório

#opcao=$(dialog --stdout --title "Github" --menu "Escolha uma opção" 0 0 0 1 'Upload' 2 'Dowload')

echo 'Fazer (U)pload ou (D)ownload?'
read opcao

# bloco principal
case $opcao in
	U)
		git add *
		echo "Qual o comentário?"
		read com
		git commit -m $com 
		git push origin master;;
	D)
		git pull;;
esac
