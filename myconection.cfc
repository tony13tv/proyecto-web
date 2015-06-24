<cfcomponent>

    <!--- A simple funcion 
    <cffunction name="showMyFirstInfo" access="remote" output="true" returntype="String">

        <cfset myVar="Hola Mundo! estoy usando coldfusion :)" >
        
            <cfmail from="" to="" cc="" subject="olakase">
              <h1></h1> 
            
            </cfmail>
            
            
        <cfreturn myVar>
    </cffunction> --->

  <!---  function with parameters --->
  <cffunction name="showEmployeeInfo" access="remote" output="true" returntype="boolean">
        <cfparam name="name" type="string">
        <cfparam name="id" type="numeric">
        
        <cfdump var="#Arguments.name#">  
            
        <cfreturn true>
    </cffunction>
   
  <!--- using database integration --->
  
  <cffunction name="setNewEmployeeInfo" access="remote" output="true" returntype="query">
        <cfparam name="emp_first_name" type="string">
        <cfparam name="emp_last_name" type="string">
        <cfparam name="date_of_birth" type="string">
        
        <cfstoredproc procedure="setNewEmployeeInfo" datasource="SQL_CONECTION_1" >
            <cfprocparam type="in"  dbvarname="@emp_first_name" value="#Arguments.emp_first_name#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocparam type="in"  dbvarname="@emp_last_name" value="#Arguments.emp_last_name#" cfsqltype="CF_SQL_VARCHAR"> 
                <cfprocparam type="in"  dbvarname="@date_of_birth" value="#Arguments.date_of_birth#" cfsqltype="CF_SQL_DATE"> 
            <cfprocresult name="theResult">
        </cfstoredproc>
            
            <cfdump var="#theResult#">  
            
        <cfreturn theResult>
    </cffunction> 
                
    
    <cffunction name="getEmployeeInfo" access="remote" output="true" returntype="query">
        <cfparam name="emp_code" type="numeric">
        
        <cfstoredproc procedure="getEmployeeInfo" datasource="SQL_CONECTION_1">
            <cfprocparam type="in"  dbvarname="@emp_code" value="#Arguments.emp_code#" cfsqltype="CF_SQL_INTEGER">
            
            <cfprocresult name="theResult2">
        </cfstoredproc>
            
            <cfdump var="#theResult2#">  
            
        <cfreturn theResult2>
    </cffunction>             
                
  //SELECT ALL FORM UDUARIO ID PARA LLENAR EL FORULARIO--------------------------------------------------
        <cffunction name="SelectUsuarioForm" access="remote" output="true" returntype="query" >
        <cfparam name="usuario_id" type="string">
        
        <cfstoredproc procedure="SelectUsuarioForm" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
            <cfprocparam type="in"  dbvarname="@usuario_id" value="#Arguments.usuario_id#" cfsqltype="CF_SQL_VARCHAR">
            
            <cfprocresult name="theResult2">
        </cfstoredproc>
            
             <cfscript>

                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResult2));
                abort;
                
            </cfscript>
            
        <cfreturn theResult2>
    </cffunction> 
                
                
 //INSERTAR USUARIO -----------------------------------------------------------------------------------
                
        <cffunction name="InsertUsuario" access="remote" output="true" returntype="any" >
        <cfparam name="usuario_nombre" type="string">
        <cfparam name="usuario_apellido" type="string">
        <cfparam name="usuario_email" type="string">
        <cfparam name="usuario_pais" type="string">
        <cfparam name="usuario_fnac" type="string">
        <cfparam name="usuario_intereses" type="string">
        <cfparam name="usuario_areat" type="string">
        <cfparam name="usuario_acerca" type="string">
            <cfparam name="usuario_sex" type="string">
        
        <cfstoredproc procedure="InsertUsuario" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
        <cfprocparam type="in"  dbvarname="@usuario_nombre" value="#Arguments.usuario_nombre#" cfsqltype="CF_SQL_VARCHAR">
        <cfprocparam type="in"  dbvarname="@usuario_apellido" value="#Arguments.usuario_apellido#" cfsqltype="CF_SQL_VARCHAR">
        <cfprocparam type="in"  dbvarname="@usuario_email" value="#Arguments.usuario_email#" cfsqltype="CF_SQL_VARCHAR">
        <cfprocparam type="in"  dbvarname="@usuario_pais" value="#Arguments.usuario_pais#" cfsqltype="CF_SQL_VARCHAR">
        <cfprocparam type="in"  dbvarname="@usuario_fnac" value="#Arguments.usuario_fnac#" cfsqltype="CF_SQL_VARCHAR">
        <cfprocparam type="in"  dbvarname="@usuario_intereses" value="#Arguments.usuario_intereses#" cfsqltype="CF_SQL_VARCHAR">
        <cfprocparam type="in"  dbvarname="@usuario_areat" value="#Arguments.usuario_areat#" cfsqltype="CF_SQL_VARCHAR">
        <cfprocparam type="in"  dbvarname="@usuario_acerca" value="#Arguments.usuario_acerca#" cfsqltype="CF_SQL_VARCHAR">
              <cfprocparam type="in"  dbvarname="@usuario_sex" value="#Arguments.usuario_sex#" cfsqltype="CF_SQL_VARCHAR">
            
            <cfprocresult name="theResult3">
        </cfstoredproc>
            
             <cfscript>

                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResult3));
                abort;
                
            </cfscript>
           
            
        <cfreturn theResult3>
    </cffunction> 
            
    //INSERTAR USUARIO 2-----------------------------------------------------------------------------------
                
        <cffunction name="InsertUsuario2" access="remote" output="true" returntype="any" >
        <cfparam name="usuario_nombre" type="string">
        <cfparam name="usuario_apellido" type="string">
        <cfparam name="usuario_pais" type="string">
        <cfparam name="usuario_fnac" type="string">
        <cfparam name="usuario_intereses" type="string">
        <cfparam name="usuario_areat" type="string">
        <cfparam name="usuario_acerca" type="string">
            <cfparam name="usuario_id" type="string">
                <cfparam name="usuario_sex" type="string">
                    <cfparam name="usuario_pass" type="string">
        
    <cfstoredproc procedure="InsertUsuario2" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
    <cfprocparam type="in"  dbvarname="@usuario_nombre" value="#Arguments.usuario_nombre#" cfsqltype="CF_SQL_VARCHAR">
    <cfprocparam type="in"  dbvarname="@usuario_apellido" value="#Arguments.usuario_apellido#" cfsqltype="CF_SQL_VARCHAR">
    <cfprocparam type="in"  dbvarname="@usuario_pais" value="#Arguments.usuario_pais#" cfsqltype="CF_SQL_VARCHAR">
    <cfprocparam type="in"  dbvarname="@usuario_fnac" value="#Arguments.usuario_fnac#" cfsqltype="CF_SQL_DATE">
    <cfprocparam type="in"  dbvarname="@usuario_intereses" value="#Arguments.usuario_intereses#" cfsqltype="CF_SQL_VARCHAR">
    <cfprocparam type="in"  dbvarname="@usuario_areat" value="#Arguments.usuario_areat#" cfsqltype="CF_SQL_VARCHAR">
    <cfprocparam type="in"  dbvarname="@usuario_acerca" value="#Arguments.usuario_acerca#" cfsqltype="CF_SQL_VARCHAR">
    <cfprocparam type="in"  dbvarname="@usuario_id" value="#Arguments.usuario_id#" cfsqltype="CF_SQL_VARCHAR">
<cfprocparam type="in"  dbvarname="@usuario_id" value="#Arguments.usuario_sex#" cfsqltype="CF_SQL_VARCHAR">
<cfprocparam type="in"  dbvarname="@usuario_id" value="#Arguments.usuario_pass#" cfsqltype="CF_SQL_VARCHAR">
            
            <cfprocresult name="theResult3">
        </cfstoredproc>
            
             <cfscript>

                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResult3));
                abort;
                
            </cfscript>
           
            
        <cfreturn theResult3>
    </cffunction> 
            
            
            
        //EMAIL A USUARIO--------------------------------------------------------------------------------------
            
        <cffunction name="SendEmail" access="remote" output="true" returntype="query" >
        <cfparam name="usuario_email" type="string">     
        
        <cfstoredproc procedure="SendEmail" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
             <cfprocparam type="in"  dbvarname="@usuario_email" value="#Arguments.usuario_email#" cfsqltype="CF_SQL_VARCHAR">
            
            
            <cfprocresult name="theResultM">
           
           
        </cfstoredproc>
                 
                   
            <cfmail subject="TurismoHN" from = "turismohn.info@gmail.com" to ="#Arguments.usuario_email#" >
                
                Gracias por formar parte de nestro sitio Turismo Hondura, su usuario se ha creado satisfactoriamente #Arguments.usuario_email# , su password de primer ingreso es: #theResultM.u_pass[1]#
                Click en el Link para ingresar a nuestro portal por primera vez http://127.0.0.1:8500/Prueba1/index.html
            
            </cfmail> 
            
             <cfscript>

                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResultM));
                abort;
                
            </cfscript>
            
        <cfreturn theResultM>
    </cffunction> 
                 
                 
        //VALIDAR USUARIO LOGUSUAIO-----------------------------------------------------------------------------------
        <cffunction name="LogUsuario" access="remote" output="true" returntype="query" >
        <cfparam name="usuario_email" type="string">
        <cfparam name="usuario_pass" type="string">
            
        
        <cfstoredproc procedure="LogUsuario" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
        <cfprocparam type="in"  dbvarname="@usuario_email" value="#Arguments.usuario_email#" cfsqltype="CF_SQL_VARCHAR">
        <cfprocparam type="in"  dbvarname="@usuario_pass" value="#Arguments.usuario_pass#" cfsqltype="CF_SQL_VARCHAR">
        
            
            <cfprocresult name="theResult5">
        </cfstoredproc>
            
             <cfscript>
                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResult5));
                abort;
                
            </cfscript>
            
        <cfreturn theResult5>
    </cffunction> 
                 
            
             //Retorna NOMBRE USUARIO--------------------------------------------------------------------------------------
            
        <cffunction name="GetName" access="remote" output="true" returntype="query" >
        <cfparam name="usuario_id" type="string">     
        
        <cfstoredproc procedure="GetName" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
             <cfprocparam type="in"  dbvarname="@usuario_id" value="#Arguments.usuario_id#" cfsqltype="CF_SQL_VARCHAR">
            
            
            <cfprocresult name="theResultN">
           
           
        </cfstoredproc>
            
             <cfscript>

                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResultN));
                abort;
                
            </cfscript>
            
        <cfreturn theResultN>
    </cffunction> 
                 
                 
                  //UPDATE PASS-----------------------------------------------------------------------------------
        <cffunction name="UpdatePass" access="remote" output="true" returntype="query" >
        <cfparam name="usuario_pass" type="string">
        <cfparam name="usuario_id" type="string">
            
        
        <cfstoredproc procedure="UpdatePass" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
        <cfprocparam type="in"  dbvarname="@usuario_pass" value="#Arguments.usuario_pass#" cfsqltype="CF_SQL_VARCHAR">
        <cfprocparam type="in"  dbvarname="@usuario_id" value="#Arguments.usuario_id#" cfsqltype="CF_SQL_VARCHAR">
        
            
            <cfprocresult name="theResult6">
        </cfstoredproc>
            
             <cfscript>

                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResult6));
                abort;
                
            </cfscript>
            
        <cfreturn theResult6>
    </cffunction> 
                 
            
          //GET FOTO DEL EMPLEADO------------------------------------------------------------------  
                            
     <cffunction name="getUfoto" access="remote" output="true" returntype="any">
        <cfparam name="usuario_id" type="numeric">
        
        <cfstoredproc procedure="getUfoto" datasource="DATA_SERVICE_1">
            <cfprocparam type="in"  dbvarname="@usuario_id" value="#Arguments.usuario_id#" cfsqltype="CF_SQL_INTEGER">
            
            <cfprocresult name="theResult7">
        </cfstoredproc>
            
         <cfscript>

                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResult7));
                abort;
                
            </cfscript>   
            
        <cfreturn theResult7>
    </cffunction>
                
                
    //INSERTAR NOTICIA 2--------------------------------------------------------------------------------
                
        <cffunction name="InsertNoticia" access="remote" output="true" returntype="any" >
        <cfparam name="noticia_titulo" type="string">
        <cfparam name="noticia_descripcion" type="string">
        <cfparam name="noticia_fecha" type="string">
        <cfparam name="usuario_id" type="string">
        <cfparam name="categoria" type="string">
        
        
<cfstoredproc procedure="InsertNoticia" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
<cfprocparam type="in"  dbvarname="@noticia_titulo" value="#Arguments.noticia_titulo#" cfsqltype="CF_SQL_VARCHAR">
<cfprocparam type="in"  dbvarname="@noticia_descripcion" value="#Arguments.noticia_descripcion#" cfsqltype="CF_SQL_VARCHAR">
<cfprocparam type="in"  dbvarname="@noticia_fecha" value="#Arguments.noticia_fecha#" cfsqltype="CF_SQL_VARCHAR">
    <cfprocparam type="in"  dbvarname="@usuario_id" value="#Arguments.usuario_id#" cfsqltype="CF_SQL_VARCHAR">
    <cfprocparam type="in"  dbvarname="@category" value="#Arguments.categoria#" cfsqltype="CF_SQL_VARCHAR">
    
            
            <cfprocresult name="theResultWHATEVER">
        </cfstoredproc>
            
             <cfscript>

                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResultWHATEVER));
                abort;
                
            </cfscript>
           
            
        <cfreturn theResultWHATEVER>
    </cffunction> 
        
        
        
         //SELECT ALL FORM UDUARIO ID PARA LLENAR EL FORULARIO-------------------------------------------
        
        <cffunction name="GetNoticia" access="remote" output="true" returntype="query" >
       <cfparam name="categoria" type="string">
        
        <cfstoredproc procedure="GetNoticias" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
            <cfprocparam dbvarname="@categoria" value="#Arguments.categoria#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocresult name="theResultNN">
        </cfstoredproc>
            
             <cfscript>

                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResultNN));
                abort;
                
            </cfscript>
            
        <cfreturn theResultNN>
    </cffunction> 
        
  
 //ValidateEmail-------------------------------------------
        
        <cffunction name="ValidateEmail" access="remote" output="true" returntype="query" >
       
        <cfparam name="usuario_email" type="string"/>
        <cfstoredproc procedure="ValidateEmail" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
            <cfprocparam type="in"  dbvarname="@usuario_email" value="#Arguments.usuario_email#" cfsqltype="CF_SQL_VARCHAR">
            
            <cfprocresult name="theResultW">
        </cfstoredproc>
            
             <cfscript>

                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResultW));
                abort;
                
            </cfscript>
            
        <cfreturn theResultW>
    </cffunction> 
                

      <cffunction name="viewNoticia" access="remote" output="true" returntype="query" >
            <cfparam name="noticia" type="integer"/>
          <cfstoredproc procedure="GetNoticia" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
            <cfprocparam type="in"  dbvarname="@noticia" value="#Arguments.noticia#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocresult name="theResultNN"></cfstoredproc>
             <cfscript>
                getpagecontext().getcfoutput().clearall();
                html = FileRead('C:\ColdFusion9\wwwroot\Prueba1\templates\noticia\view.html');
                html = Replace(html, '$Title', theResultNN["n_titulo"][1]);
                html = Replace(html, '$Content', theResultNN["n_descripcion"][1]);
                html = Replace(html, '$Image', 'Nimages/'&theResultNN["n_id"][1] & '/photos/' & theResultNN["n_foto"][1]);
                writeoutput(html);
                abort;
            </cfscript>
        <cfreturn theResultNN>
    </cffunction> 
                
    <cffunction name="thumbnailNoticia" access="remote" output="true" returntype="query" >
            <cfparam name="noticia" type="integer"/>
            <cfparam name="usuario" type="integer"/>
          <cfstoredproc procedure="GetNoticia" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
            <cfprocparam type="in"  dbvarname="@noticia" value="#Arguments.noticia#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocresult name="theResultNN"></cfstoredproc>
             <cfscript>
                getpagecontext().getcfoutput().clearall();
                html = FileRead('C:\ColdFusion9\wwwroot\Prueba1\templates\noticia\thumbnail.html');
                html = Replace(html, '$Title', theResultNN["n_titulo"][1]);
                html = Replace(html, '$Content', theResultNN["n_descripcion"][1]);
                 html = Replace(html, '$FechaS', theResultNN["n_fecha"][1]);
                 html = Replace(html, '$ID', theResultNN["n_id"][1], "ALL");
                 html = Replace(html, '$Likes', theResultNN["likes"][1], "ALL");
                 html = Replace(html, '$Usuario', usuario, "ALL");
                 html = Replace(html, '$Name', theResultNN["u_nombre"][1], "ALL");
                 image = '';
                 if (theResultNN["n_foto"][1] IS '') {
                    image = 'http://placehold.it/100x100';
                 }else{
                    image = 'Nimages/'&theResultNN["n_id"][1] & '/small/' & theResultNN["n_foto"][1];
                 }
                html = Replace(html, '$Image', image);
                writeoutput(html);
                abort;
            </cfscript>
        <cfreturn theResultNN>
    </cffunction> 
                
    <cffunction name="deleteNoticia" access="remote" output="true" returntype="query" >
            <cfparam name="noticia" type="integer"/>
        <cfparam name="usuario" type="integer"/>
          <cfstoredproc procedure="DeleteNoticia" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
            <cfprocparam type="in"  dbvarname="@noticia" value="#Arguments.noticia#" cfsqltype="CF_SQL_VARCHAR">
                <cfprocparam type="in"  dbvarname="@usuario" value="#Arguments.usuario#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocresult name="theResultNN"></cfstoredproc>
             <cfscript>
                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResultNN));
                abort;
            </cfscript>
        <cfreturn theResultNN>
    </cffunction>
                
    <cffunction name="likeNoticia" access="remote" output="true" returntype="query" >
            <cfparam name="noticia" type="integer"/>
            <cfparam name="usuario" type="integer"/>
          <cfstoredproc procedure="LikeNoticia" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
            <cfprocparam type="in"  dbvarname="@noticia" value="#Arguments.noticia#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocparam type="in"  dbvarname="@usuario" value="#Arguments.usuario#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocresult name="theResultNN"></cfstoredproc>
             <cfscript>
                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResultNN));
                abort;
            </cfscript>
        <cfreturn theResultNN>
    </cffunction>
                 
    <cffunction name="editNoticia" access="remote" output="true" returntype="query" >
            <cfparam name="noticia" type="integer"/>
            <cfparam name="usuario" type="integer"/>
          <cfstoredproc procedure="EditNoticia" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
            <cfprocparam type="in"  dbvarname="@noticia" value="#Arguments.noticia#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocparam type="in"  dbvarname="@usuario" value="#Arguments.usuario#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocresult name="theResultNN"></cfstoredproc>
             <cfscript>
                getpagecontext().getcfoutput().clearall();
                if(theResultNN.getRowCount()) {
                    html = FileRead('C:\ColdFusion9\wwwroot\Prueba1\templates\noticia\edit.html');
                    html = Replace(html, '$Title', theResultNN["n_titulo"][1], "ALL");
                    html = Replace(html, '$Content', theResultNN["n_descripcion"][1]);
                     html = Replace(html, '$FechaS', theResultNN["n_fecha"][1]);
                     html = Replace(html, '$ID', theResultNN["n_id"][1], "ALL");
                     html = Replace(html, '$Usuario', theResultNN["u_id"][1], "ALL");
                     image = '';
                     if (theResultNN["n_foto"][1] IS '') {
                        image = 'http://placehold.it/100x100';
                     }else{
                        image = 'Nimages/'&theResultNN["n_id"][1] & '/photos/' & theResultNN["n_foto"][1];
                     }
                    html = Replace(html, '$Image', image);
                 }else{
                    html = serializejson(theResultNN);
                 }
                writeoutput(html);
                abort;
            </cfscript>
        <cfreturn theResultNN>
    </cffunction> 
                
    <cffunction name="saveNoticia" access="remote" output="true" returntype="query" >
            <cfparam name="noticia" type="integer"/>
        <cfparam name="n_titulo" type="string"/>
        <cfparam name="n_descripcion" type="string"/>
          <cfstoredproc procedure="UpdateNoticia" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
            <cfprocparam type="in"  dbvarname="@noticia" value="#Arguments.noticia#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocparam type="in"  dbvarname="@titulo" value="#Arguments.n_titulo#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocparam type="in"  dbvarname="@descripcion" value="#Arguments.n_descripcion#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocresult name="theResultNN"></cfstoredproc>
             <cfscript>
                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResultNN));
                abort;
            </cfscript>
        <cfreturn theResultNN>
    </cffunction> 
                
    <cffunction name="markerForm" access="remote" output="true" returntype="query" >
            <cfparam name="usuario" type="integer"/>
            <cfparam name="lat" type="string"/>
            <cfparam name="lng" type="string"/>
             <cfscript>
                getpagecontext().getcfoutput().clearall();
                 html = FileRead('C:\ColdFusion9\wwwroot\Prueba1\templates\mapa\addMarker.html');
                 html = Replace(html, "$Usuario", usuario, 'ALL');
                 html = Replace(html, "$Lat", lat, 'ALL');
                 html = Replace(html, "$Lng", lng, 'ALL');
                writeoutput(html);
                abort;
            </cfscript>
        <cfreturn theResultNN>
    </cffunction> 
        
        <cffunction name="saveMarker" access="remote" output="true" returntype="query" >
            <cfparam name="usuario" type="integer"/>
            <cfparam name="titulo" type="string"/>
            <cfparam name="descripcion" type="string"/>
            <cfparam name="lat" type="string"/>
            <cfparam name="lng" type="string"/>
            <cfstoredproc procedure="SaveMarker" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
            <cfprocparam type="in"  dbvarname="@usuario" value="#Arguments.usuario#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocparam type="in"  dbvarname="@titulo" value="#Arguments.titulo#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocparam type="in"  dbvarname="@descripcion" value="#Arguments.descripcion#" cfsqltype="CF_SQL_VARCHAR">
                <cfprocparam type="in"  dbvarname="@lat" value="#Arguments.lat#" cfsqltype="CF_SQL_VARCHAR">
                    <cfprocparam type="in"  dbvarname="@lng" value="#Arguments.lng#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocresult name="theResultNN"></cfstoredproc>
             <cfscript>
                getpagecontext().getcfoutput().clearall();
                 html = FileRead('C:\ColdFusion9\wwwroot\Prueba1\templates\mapa\addMarker.html');
                 html = Replace(html, "$Usuario", usuario, 'ALL');
                writeoutput(html);
                abort;
            </cfscript>
        <cfreturn theResultNN>
    </cffunction> 
                        
    <cffunction name="loadMarkers" access="remote" output="true" returntype="query" >
            <cfstoredproc procedure="LoadMarkers" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
            <cfprocresult name="theResultNN"></cfstoredproc>
             <cfscript>
                getpagecontext().getcfoutput().clearall();
                writeoutput(serializejson(theResultNN));
                abort;
            </cfscript>
        <cfreturn theResultNN>
    </cffunction> 
                
    <cffunction name="viewMarker" access="remote" output="true" returntype="query" >
        <cfparam name="usuario" type="integer"/>
        <cfparam name="marker" type="integer"/>
        <cfstoredproc procedure="ViewMarker" datasource="DATA_SERVICE_1" username="sa" password="mayara87">
            <cfprocparam type="in"  dbvarname="@usuario" value="#Arguments.usuario#" cfsqltype="CF_SQL_VARCHAR">
                <cfprocparam type="in"  dbvarname="@marker" value="#Arguments.marker#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocresult name="theResultNN"></cfstoredproc>
             <cfscript>
                getpagecontext().getcfoutput().clearall();
                html = FileRead('C:\ColdFusion9\wwwroot\Prueba1\templates\mapa\marker.html');
                html = Replace(html, '$Title', theResultNN["titulo"][1]);
                html = Replace(html, '$Content', theResultNN["descripcion"][1]);
                writeoutput(html);
                abort;
            </cfscript>
        <cfreturn theResultNN>
    </cffunction> 
</cfcomponent>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                