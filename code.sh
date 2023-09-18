#--------------------------------------------------------------------------------------------------------------#
# Descrição: Script Syspdv_linux V_0_12  (08/12/2021)                                                         #
#--------------------------------------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------------------------------------#
# Autor: Pedro Olveira                                                                                         #
#--------------------------------------------------------------------------------------------------------------#
#!/bin/bash
#--------------------------------------------------------------------------------------------------------------#

#!/bin/bash
DATA=$(date +'%H:%M-%d-%m-%Y')

# MENU PRINCIPAL
show_menu(){
item=$(whiptail --title "Vesão 0.15 by Pedro Oliveira" --menu "Seja Bem vindo. Escolha uma opção na lista abaixo" --fb 33 80 22 \
"01" "Instação SysPDV PDV"  \
"02" "Instação VPN Comnect (Em Teste)" \
"03" "Mostra chave VPN (Comnect)" \
"04" "Remover VPN" \
"05" "Copiar arquivo de outro PDV" \
"06" "Exibir IP da maquina" \
"07" "Instalação Docgate V2" \
"08" "Instalação Docgate V3" \
"09" "Vizualizar Logs PDV (sysnet.err, PDV.log, syserro.err e CFe/Log)" \
"10" "Instalar Driver MFE v02.05.18" \
"11" "Remover Driver MFE" \
"12" "Vizualizar SAT.log (MFE)" \
"13" "Repara CAD e MOV" \
"14" "Atualizar Dlls do TefDll" \
"15" "Aplicar Permissão 777" \
"16" "Vizualizar Ultimo Xml Venda (NFCe) " \
"17" "Corrigir data e hora" \
"18" "Nota da Versão" \
"00" "Sair"  3>&1 1>&2 2>&3)
 
status=$?
if [ $status = 0 ]; then
   echo "Você escolheu a opção:" $item
else
   echo "Opção cancelada."
fi
case $item in
    01)
    # Instação SysPDV PDV
        build=$(whiptail --title "Digite a Build:" --inputbox "Qual Build você deseja:" --nocancel --fb 10 60 3>&1 1>&2 2>&3)
        exitstatus=$?
    if [ $exitstatus = 0 ]; then
        echo "A build Digitada foi:" $build
    fi
        wget -nc https://objectstorage.us-ashburn-1.oraclecloud.com/n/casamagalhaes/b/syspdv/o/b$build/InstaladorSysPDV19_0_0_$build.exe &&        chmod 777 *.* 
        sudo wine InstaladorSysPDV19_0_0_$build.exe &&
        chmod 777 -R /opt/Syspdv &&
        cd /opt/Syspdv &&
        sudo wine /opt/Syspdv/SysPDVTools.exe &&
        sudo wine /opt/Syspdv/AtualizaSysPDV_PDV.exe &&
        cd $DIR_PATH
        clear
        echo "=========================================================="
        echo "     ****** Instalação do SysPDV PDV Realizada ******     "
        echo "=========================================================="
        show_menu;
       ;;

    02)
     # Instação VPN Comnect (Em Teste) - wnbtlscli_1.0.3.f-i386"
        clear
        # sudo apt update && \
        # sudo apt install nmap curl netcat bc bash coreutils gawk grep net-tools perl wget ca-certificates && \
        wget http://github.com/MatheusWesley/files/blob/main/wnbupdate-i386 && \
        sudo chmod 777 wnbupdate-i386 && sudo sh wnbupdate-i386 -i \
        
        # clear
        whiptail --title "Tudo Certo" --msgbox "$(\   
        echo "=========================================================="
        echo "    ****** VPN Connect Instalado com Sucesso  ******      "
        echo "=========================================================="
        )" --fb 15 65
        show_menu;
        ;;  

    03)
    # Mostra chave VPN (Comnect)
       whiptail --title "Chave Registrada" --textbox /etc/wnbtlscli/registry 20 65 --fb 33 80 22
       clear
       show_menu;
       ;;
    
    04)
    # Remover VPN
        clear
        dpkg --purge wnbtlscli
        rm -rf /etc/wnbtlscli &&
        clear
          whiptail --title "Você que pediu " --msgbox "$(\   
       echo "=========================================================="
       echo "       ****** VPN Removida    ******                      "
       echo "=========================================================="
       )" --fb 15 65
        show_menu;
       ;;

    05)
    # Copiar arquivo de outro PDV
        IP=$(whiptail --title "Digite o Ip do caixa onde vc que pegar o arquivo:" --inputbox "Qual o IP da Maquina?" --nocancel --fb 10 60 3>&1 1>&2 2>&3)
        exitstatus=$?
        if [ $exitstatus = 0 ]; then
           echo "O IP Digitado foi:" $IP
        fi
    
            local=$(whiptail --title "Digite o caminho de onde esta o aquivo" --inputbox "Ex: /opt/Syspdv/TefDll"  --nocancel --fb 10 60 3>&1 1>&2 2>&3)
         exitstatus=$?
        if [ $exitstatus = 0 ]; then
            echo "caminho digitado foi:" $local
        fi      
            scp -r root@$ip:$local $local &&
            chmod 777 -R /$local &&
            ls /$local &&
            cd $DIR_PATH
            clear
        show_menu;
       ;;

    06)
    # Exibir ip da Maquina
       whiptail --title "IP da Maquina é:" --msgbox "$(ifconfig | head -n 2 | cut -d: -f1)" 10 80 --fb 15 65
       clear
       show_menu;
       ;;
     
    07)
    # Instalação Docgate V2
        clear
        # sudo apt-get install curl -y &&
        # sudo apt-get install git -y &&
        # sudo curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - &&
        # sudo apt-get install nodejs -y &&
        # sudo curl -O https://cmaga.s3.us-east-2.amazonaws.com/Docgate_V2/docgate_v2.tar.gz &&
        # sudo tar -xvzf docgate_v2.tar.gz &&
        # cp -r docgate/ /opt &&
        # cd /opt/docgate/ &&
        # sudo npm install &&
        # sudo npm install pm2 -g &&
        # sudo pm2 startup &&
        # sudo pm2 start /opt/docgate/bin/www -i 0 --name "docgate" -x &&
        # sudo pm2 save &&
        # sudo chmod +x /opt/docgate/cmd/SATGateway* &&
        # sudo chmod 0755 /opt/docgate/devices/mfe/* &&
        # sudo chmod 0755 /opt/docgate/devices/dsat/* &&
        # sudo chmod 0755 /opt/docgate/devices/gertec/* &&
        # sudo chmod 0755 /opt/docgate/devices/epson/* &&
        # sudo chmod 0755 /opt/docgate/devices/rb1000/* &&
        # sudo chmod 0755 /opt/docgate/devices/rb2000/* &&
        # sudo chmod 0755 /opt/docgate/devices/sweda/* &&
        # sudo chmod 0755 /opt/docgate/devices/ts1000/* &&
        # sudo chmod 0755 /opt/docgate/devices/urano/* &&
        # sudo chmod 0755 /opt/docgate/bin/* &&
        # sudo chmod 0755 /opt/docgate/cmd/* &&
        # sudo chmod 0755 /opt/docgate/data/* &&
        # sudo chmod 0755 /opt/docgate/lib/* &&
        # cd /$DIR_PATH
        # clear
        # echo "=========================================================="
        # echo "       ****** DocGate - V2 Instalado com Sucesso ******   "
        # echo "=========================================================="
        whiptail --title "ATENÇÃO" --msgbox "$(\   
        echo "=========================================================="
        echo "          ****** Link de Download fora ******             "
        echo "=========================================================="
        )" --fb 15 65
        show_menu;
       ;;
    08)
    # Instalação Docgate V3
        clear
        # sudo apt-get install curl -y &&
        # sudo apt-get install git -y &&
        # sudo curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - &&
        # sudo apt-get install nodejs -y &&
        # URL="https://casamagalhaes.box.com/shared/static/musxsgbo5vqtibjgoa7comm3cebh5xbi.gz" &&
        # wget -O docgate_v3.tar.gz  "$URL" 2>&1 | \
        # stdbuf -o0 awk '/[.] +[0-9][0-9]?[0-9]?%/ { print substr($0,63,3) }' | \
        # dialog --gauge "Download em Andamento" 10 100 &&
        # sudo tar -xvzf docgate_v3.tar.gz &&
        # cp -r docgate/ /opt &&
        # cd /opt/docgate/ &&
        # sudo npm install &&
        # sudo npm install pm2 -g &&
        # sudo pm2 startup &&
        # sudo pm2 start /opt/docgate/bin/www -i 0 --name "docgate" -x &&
        # sudo pm2 save &&
        # sudo chmod +x /opt/docgate/cmd/SATGateway* &&
        # sudo chmod 0755 /opt/docgate/devices/mfe/* &&
        # sudo chmod 0755 /opt/docgate/devices/dsat/* &&
        # sudo chmod 0755 /opt/docgate/devices/gertec/* &&
        # sudo chmod 0755 /opt/docgate/devices/epson/* &&
        # sudo chmod 0755 /opt/docgate/devices/rb1000/* &&
        # sudo chmod 0755 /opt/docgate/devices/rb2000/* &&
        # sudo chmod 0755 /opt/docgate/devices/sweda/* &&
        # sudo chmod 0755 /opt/docgate/devices/ts1000/* &&
        # sudo chmod 0755 /opt/docgate/devices/urano/* &&
        # sudo chmod 0755 /opt/docgate/bin/* &&
        # sudo chmod 0755 /opt/docgate/cmd/* &&
        # sudo chmod 0755 /opt/docgate/data/* &&
        # sudo chmod 0755 /opt/docgate/lib/* &&
        # cd /$DIR_PATH
        # clear
        # echo "=========================================================="
        # echo "       ****** DocGate - V2 Instalado com Sucesso ******   "
        # echo "=========================================================="
        whiptail --title "ATENÇÃO" --msgbox "$(\   
        echo "=========================================================="
        echo "          ****** Link de Download fora ******             "
        echo "=========================================================="
        )" --fb 15 65
        show_menu;
       ;;

    09)
    # Vizualizar Logs PDV (sysnet.err, PDV.log, syserro.err e CFe/Log)
        dia=$(whiptail  --inputbox "Qual data você deseja:" --title "Digite a data EX DDMMAA:" --nocancel --fb 10 60 3>&1 1>&2 2>&3)
            exitstatus=$?
        if [ $exitstatus = 0 ]; then
           echo "A data Digitada foi:" $dia
        else
         echo "Opção cancelada."
        fi
            subl /opt/Syspdv/sysnet.err &&
            subl /opt/Syspdv/syserro.err &&
            subl /opt/Syspdv/pdv$dia.log &&
            subl /opt/Syspdv/CFe/Logs/$dia.log &&
            cd $DIR_PATH
            clear
            echo "=========================================================="
            echo "       ****** Log Execultado ******                       "
            echo "=========================================================="
        show_menu;
       ;;

    10)
      # Instalar Driver MFE v02.05.18
        clear
        wget http://servicos.sefaz.ce.gov.br/internet/download/projetomfe/instalador-ce-sefaz-driver-linux-x86-02.05.18.tar.gz
        tar -xvzf instalador-ce-sefaz-driver-linux-x86-02.05.18.tar.gz &&
        clear &&
        cd /home/pdv/Downloads/instalador-ce-sefaz-driver-linux-x86-02.05.18 &&
        ./instala-driver.sh 
        chmod 777 -R /opt/sefaz
        clear
        whiptail --title "ATENÇÃO" --msgbox "$(\   
        echo "=========================================================="
        echo "      ****** Drive MFE Versão 02-05-18  ******            "
        echo "        ****** Instalado com sucesso  ******              "
        echo "=========================================================="
        )" --fb 15 65
        show_menu;
       ;;

    11)
    # Remover Driver MFE
        clear
        cd /opt/sefaz/cco &&
        ./remove-driver.sh &&
        cd /opt &&
        rm -rf /opt/sefaz
        chmod 777 -R /opt/sefaz
        cd $DIR_PATH
        clear
        whiptail --title "Você que pediu! " --msgbox "$(\   
        echo "=========================================================="
        echo "       ****** Driver MFE Removido ******            "
        echo "=========================================================="
        )" --fb 15 65
        show_menu;
       ;;

    12)
    # Vizualizar SAT.log (MFE)
        subl /opt/docgate/devices/mfe/sat.log &&	
        cd $DIR_PATH
        clear
        echo "=========================================================="
        echo "       ****** Log Execultado ******                       "
        echo "=========================================================="
        show_menu;
       ;;

    13)
    # Backup pasta Debug
        cd $DIR_PATH
        cp /opt/Syspdv/syspdv_mov.fdb /opt/Syspdv/syspdv_mov"$DATA".fdb  &&
        cp /opt/Syspdv/syspdv_cad.fdb /opt/Syspdv/syspdv_cad"$DATA".fdb  &&
    # Reparar CAD E MOV
       sudo mkdir /opt/Syspdv/RESTORE_FIREBIRD/ &&
       sudo chmod 777 -R /opt/Syspdv/RESTORE_FIREBIRD/ &&
       sudo cp /opt/Syspdv/syspdv_mov.fdb /opt/Syspdv/syspdv_mov_Original.fdb && 
       sudo mv /opt/Syspdv/syspdv_mov.fdb /opt/Syspdv/RESTORE_FIREBIRD/syspdv_mov.fdb &&
       sudo chmod 777 -R /opt/Syspdv/RESTORE_FIREBIRD/ &&
       sudo /opt/firebird/bin/./gbak -b -g -l -v -user sysdba -password masterkey /opt/Syspdv/RESTORE_FIREBIRD/syspdv_mov.fdb /opt/Syspdv/RESTORE_FIREBIRD/syspdv_mov.fbk &&
       sudo /opt/firebird/bin/./gbak -R -c -v -user sysdba -password masterkey /opt/Syspdv/RESTORE_FIREBIRD/syspdv_mov.fbk /opt/Syspdv/RESTORE_FIREBIRD/syspdv_mov_restaurado.fdb &&
       sudo mv /opt/Syspdv/RESTORE_FIREBIRD/syspdv_mov_restaurado.fdb /opt/Syspdv/syspdv_mov.fdb &&
       sudo chown root:root /opt/Syspdv/syspdv_mov.fdb &&
       sudo chmod 777 /opt/Syspdv/syspdv_mov.fdb &&
       sudo cp /opt/Syspdv/syspdv_cad.fdb /opt/Syspdv/syspdv_cad_Original.fdb && 
       sudo mv /opt/Syspdv/syspdv_cad.fdb /opt/Syspdv/RESTORE_FIREBIRD/syspdv_cad.fdb &&
       sudo chmod 777 -R /opt/Syspdv/RESTORE_FIREBIRD/syspdv_cad.fdb &&
       sudo /opt/firebird/bin/./gbak -b -v -user sysdba -password masterkey /opt/Syspdv/RESTORE_FIREBIRD/syspdv_cad.fdb /opt/Syspdv/RESTORE_FIREBIRD/syspdv_cad.fbk &&
       sudo /opt/firebird/bin/./gbak -R -v -user sysdba -password masterkey /opt/Syspdv/RESTORE_FIREBIRD/syspdv_cad.fbk /opt/Syspdv/RESTORE_FIREBIRD/syspdv_cad_restaurado.fdb &&
       sudo mv /opt/Syspdv/RESTORE_FIREBIRD/syspdv_cad_restaurado.fdb /opt/Syspdv/syspdv_cad.fdb &&
       sudo chown root:root /opt/Syspdv/syspdv_cad.fdb &&
       sudo chmod 777 /opt/Syspdv/syspdv_cad.fdb &&
       sudo rm -rf /opt/Syspdv/RESTORE_FIREBIRD/ &&
       sudo chmod 777 -R /opt/Syspdv &&
       sudo rm -f /opt/Syspdv/syspdv_mov_Original.fdb /opt/Syspdv/syspdv_cad_Original.fdb
       sudo cd /opt/Syspdv/wine AtualizaSysPDV_PDV.exe &&
       cd $DIR_PATH
       clear
       whiptail --title "Que a Força esteja com você" --msgbox "$(\   
       echo "=========================================================="
       echo "       ****** Syspdv Reparado ******                      "
       echo "=========================================================="
       )" --fb 15 65
       show_menu;
       ;;

    14)
    # Atualizar Dlls do TEF
    # Backup pasta TefDll
        cd $DIR_PATH
        tar -cvzf /opt/Syspdv/TefDll/TEF"$DATA".tar.gz /opt/Syspdv/TefDll/*.* &&
        clear
    # Downloads das DLLs #
        URL="https://portaldocliente.softwareexpress.com.br/distri/aplicativos/vrs6/clisitefwin32.zip" &&
        wget -c "$URL" 2>&1 | \
        stdbuf -o0 awk '/[.] +[0-9][0-9]?[0-9]?%/ { print substr($0,63,3) }' | \
        dialog --gauge "Download em Andamento" 10 100 &&
        clear
        chmod 777 clisitefwin32.zip &&
        cp clisitefwin32.zip /opt/Syspdv/TefDll/ &&
        cd /opt/Syspdv/TefDll/ &&
        unzip clisitefwin32.zip &&
        chmod 777 -R /opt/Syspdv/TefDll/ &&
        cd $DIR_PATH
        clear
        whiptail --title "Você nunca chegará a 100% se se contentar com 99%" --msgbox "$(\   
        echo "=========================================================="
        echo "    ****** Atualização Concluida com Sucesso ******       "
        echo "=========================================================="
        )" --fb 15 65
        show_menu;
       ;;
       
    15) 
    # Aplicar Permissao na Pasta
    PER=$(whiptail  --inputbox "Digite o caminho ex: /opt/Syspdv" --title "Aplicar Permissão 777" --nocancel --fb 10 60 3>&1 1>&2 2>&3)
        exitstatus=$?
    if [ $exitstatus = 0 ]; then
        echo "A caminho Digitado foi:" $PER
    else
        echo "Opção cancelada."
    fi
        chmod 777 -R $PER
        cd $DIR_PATH
        clear
        whiptail --title $PER --msgbox "$(\ 
        echo "=========================================================="
        echo "       ****** Permissão Aplicada ******                   "
        echo "=========================================================="
        )" --fb 15 65
        show_menu;
       ;;
    
    16)
    # Abrir ultimo Xml do cupom CFe
        chmod 777 -R /opt/Syspdv/UltimoXmlNFCe.xml &&
        su pdv firefox /opt/Syspdv/UltimoXmlNFCe.xml &&
        cd $DIR_PATH
        show_menu;
       ;;
	
    17)
    # Corrigir data e hora
        sudo dpkg-reconfigure tzdata 
        cd $DIR_PATH
        clear
        whiptail --title "Tenha um Bom dia." --msgbox "$( date )" --fb 10 50  
        echo "=========================================================="
        echo "       ****** Hora Corrigida ******                       "
        echo "=========================================================="
        show_menu;
       ;;
      
    18)
    # Nota da versão
       whiptail --title "Nota da Versão 0.15" --msgbox "$(\" 

       echo "1 - Atualizado o link de instalação VPN Comnect."
       echo "2 - Atualizado o link de instalação do Drive MFe v02.05.18."
       echo "3 - Melhorias e correções de alguns bugs."
       echo ""
       echo "Sugestões, duvidas, melhorias ou bugs enviar nos contatos:"
       echo "e-mail: matheus.w.santos@casamagalhaes.com.br"
       echo "slack:  @Matheus Wesley - 68038."
       echo ""
       echo "Script criado pelo Pedro Oliveira"
       echo "Mantido por Matheus Wesley"
       )" --fb 20 85 10
       clear
       #echo "=========================================================="
       #echo "    ****** VPN Connect Instalado com Sucesso  ******      "
       #echo "=========================================================="
       show_menu;
       ;; 

    0)
  # Finaliza Script
        clear
        echo "=========================================================="
        echo "           ********** Finalizado **********               "
        echo "=========================================================="
        exit
        show_menu;
       ;;
      esac 
}
clear
show_menu
