// JavaScript Document

function getXMLHTTP() 
{ 
    var xmlHttp = false;
   try {
     xmlHttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
   }
   catch (e) {
     try {
       xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
     }
     catch (e2) {
       xmlHttp = false   // No Browser accepts the XMLHTTP Object then false
     }
   }
   if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
     xmlHttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
   }
   return xmlHttp; 
}

function realizar_busqueda()
{   
   document.getElementById('send_form').click();   
}

function obtenerDepartamentoSucursal(strVal,num)
{
    var req = getXMLHTTP();
    if (req)
    {
        req.open("POST", strVal, true);
        req.onreadystatechange = function(){
                                    if (req.readyState == 4)
                                    {
                                        if (req.status == 200)
                                        {
                                            if(num==0){
                                                document.getElementById('div_depto').innerHTML=req.responseText;}
                                            else if(num==1){
                                                document.getElementById('div_ciudad').innerHTML=req.responseText;}
                                        }
                                        else
                                        {
                                            alert("Error al realizar solicitud HTTP XMLHTTP:\n");
                                        }
                                    }
                                }
        req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        if(num==0)
            req.send("origin=sucursal&cod_pais=" + document.getElementById('nom_pais').value);
        else if(num==1)
            req.send("origin=sucursal&cod_depto=" + document.getElementById('nom_depto').value+"&cod_pais="+ document.getElementById('nom_pais').value);
    }
}

function soloLetrasNum(evt)
{

   var charCode = ( evt.which ) ? evt.which : evt.keyCode;
   return ( (charCode >= 65 && charCode <= 90) ||
            (charCode >= 97 && charCode <= 122) ||
            (charCode>=8 && charCode<=11) ||
            charCode==46 || charCode==14 || charCode==15 || charCode==32 ||(charCode >= 48 && charCode <= 57) || (charCode>=8 && charCode<=11) ||
            charCode==14 || charCode==15);
}


function reservar()
{
    try{
    var cantItems = document.getElementById("total_servicios").value;
    var i =0;
    var checked=0;
    for (i = 0; i < cantItems; i++)
    {
        if(document.getElementById("chck_"+i).checked)
            {
                checked=checked+1;
            }
    }
    if(checked==0)
        alert('favor seleccione los servicios que desea reservar');
    else
    {        
        if(confirm('¿Después de aqui no podra adicionar mas servicios, desea continuar?'))
            document.getElementById('send_form').click();
    }
    }catch(e){};
}

function confirmar_reserva()
{
    try{
        document.getElementById('tarea_id').value ='C';
    var cantItems = document.getElementById("total_servicios").value;
    var i =0;
    var checked=0;
    for (i = 0; i < cantItems; i++)
    {
        if(document.getElementById("chck_"+i).checked)
            {
                checked=checked+1;
            }
    }
    if(checked==0)
        alert('Favor seleccione los servicios que desea reservar');
    else
    {        
        if(confirm('Una vez confirmadas las reservas se dara por aceptado el cobro posterior del servicio.\n Desea Continuar'))
            document.getElementById('send_form').click();
    }
    }catch(e){};
}

function realizar_busqueda_reserva()
{
    if(document.getElementById('codigo_reserva').value.length!=0)
        document.getElementById('send_form').click();
    else
        alert('Favor complete el código de reserva');
}

function borrar_reserva()
{
    try{
        document.getElementById('tarea_id').value ='D';
    var cantItems = document.getElementById("total_servicios").value;
    var i =0;
    var checked=0;
    for (i = 0; i < cantItems; i++)
    {
        if(document.getElementById("chckd_"+i).checked)
            {
                checked=checked+1;
            }
    }
    if(checked==0)
        alert('Favor seleccione los servicios que desea eliminar');
    else
    {        
        if(confirm('Esta seguro que desea eliminar las reservas'))
            document.getElementById('send_form').click();
    }
    }catch(e){};
}