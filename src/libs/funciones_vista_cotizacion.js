// JavaScript Document

function soloNumeros(evt)
{
     var charCode = ( evt.which ) ? evt.which : evt.keyCode;
   return ( (charCode >= 48 && charCode <= 57) || (charCode>=8 && charCode<=11) ||
       charCode==14 || charCode==15);
}

function calcularTotal()
{
    var cantItems = document.getElementById("total_items").value;
    var totalCotizacion = 0;
    var i = 0;
    for (i = 0; i < cantItems; i++)
    {
        if(document.getElementById("chck_"+i).checked)
            {
                totalCotizacion = parseFloat(totalCotizacion) + (parseFloat(document.getElementById("cost_"+i).value)*parseInt(document.getElementById("cant_"+i).value));
            }
    }
    document.getElementById("total_cotizacion").value = totalCotizacion;
    calcularData();
}

function adicionarCompras()
{
    if(document.getElementById('data_id').value.length!=0)
        document.getElementById('send_form').click();
    else
        alert("Favor seleccione algun servicio para adicionar");
}

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

function calcularData()
{
    try{
    var cantItems = document.getElementById("total_items").value;    
    var data = "";
    var i = 0;
    for (i = 0; i < cantItems; i++)
    {
        if(document.getElementById("chck_"+i).checked)
            {
                if(data=="")
                    data = document.getElementById("id_"+i).value+";"+document.getElementById("cant_"+i).value+";"+
                                document.getElementById("fecha_"+i).value+";"+document.getElementById("cost_"+i).value+";"+
                                (parseInt(document.getElementById("cost_"+i).value)*parseInt(document.getElementById("cant_"+i).value)); 
                else 
                    data = data+"%%"+document.getElementById("id_"+i).value+";"+document.getElementById("cant_"+i).value+";"+
                                document.getElementById("fecha_"+i).value+";"+document.getElementById("cost_"+i).value+";"+
                                (parseInt(document.getElementById("cost_"+i).value)*parseInt(document.getElementById("cant_"+i).value));                                
            }
    }
    document.getElementById("data_id").value = data;
    }catch(e){};
}


function calcularDataR()
{
    try{
    var cantItems = document.getElementById("total_servicios").value;    
    var data = "";
    var i = 0;
    for (i = 0; i < cantItems; i++)
    {
        if(document.getElementById("chck_"+i).checked)
            {
                if(data=="")
                    data = document.getElementById("servicio_"+i).value+";"+document.getElementById("cant_"+i).value+";"+
                           document.getElementById("fecha_"+i).value+";"+document.getElementById("costou_"+i).value+";"+
                           document.getElementById("costot_"+i).value;
                else
                data = data+"%%"+document.getElementById("servicio_"+i).value+";"+document.getElementById("cant_"+i).value+";"+
                                document.getElementById("fecha_"+i).value+";"+document.getElementById("costou_"+i).value+";"+
                                document.getElementById("costot_"+i).value;                                
            }
    }
    document.getElementById("dataR_id").value = data;
    }catch(e){};
}

function calcularTotalServicios()
{
    try{
    var cantItems = document.getElementById("total_servicios").value;
    var totalCotizacion = 0;
    var i = 0;
    for (i = 0; i < cantItems; i++)
    {
        if(document.getElementById("chck_"+i).checked)
        {
            totalCotizacion = totalCotizacion + (parseFloat(document.getElementById("costot_"+i).value));
        }
    }
    document.getElementById("total_cotizacionR").value = totalCotizacion;
    if(document.getElementById("form_type").value=='form_reservar_servicios')
        calcularDataR();
    else
        calcularDataConfirm();
    }catch(e){};
}

function calcularDataConfirm()
{
    try{
    var cantItems = document.getElementById("total_servicios").value;    
    var data = "";
    var i = 0;
    for (i = 0; i < cantItems; i++)
    {
        if(document.getElementById("chck_"+i).checked)
            {
                if(data=="")
                    data = document.getElementById("servicio_"+i).value;                                
                else 
                    data = data+","+document.getElementById("servicio_"+i).value;
            }
    }
    document.getElementById("dataC_id").value = data;
    }catch(e){};
}


function calcularDataDelete()
{
    try{
    var cantItems = document.getElementById("total_servicios").value;    
    var data = "";
    var i = 0;
    for (i = 0; i < cantItems; i++)
    {
        if(document.getElementById("chckd_"+i).checked)
            {
                if(data=="")
                    data = document.getElementById("servicio_"+i).value;                                
                else 
                    data = data+","+document.getElementById("servicio_"+i).value;
            }
    }
    document.getElementById("dataD_id").value = data;
    }catch(e){};
}