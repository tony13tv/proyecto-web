<CFOUTPUT>
    
    <cfset empCodePath ="C:\ColdFusion9\wwwroot\Prueba1\Nimages\#URL.noticia_id#">
	
    
    <cfif Not DirectoryExists(#empCodePath#)>
        <cfdirectory action="create" directory="#empCodePath#\">
        <cfdirectory action="create" directory="#empCodePath#\photos">
        <cfdirectory action="create" directory="#empCodePath#\small">
    </cfif>
    
    
    
<CFTRY>
<!-- upload the picture -->
<cffile action="upload" 
            filefield="file-0" 
            destination="#empCodePath#\photos" 
            nameConflict="makeUnique">
    
    
<!-- crear la version pequeña --> 
    <cfset thumbHeight = 200>

    <!--- set the desired image width --->
    <cfset thumbWidth = 200>

    <cfimage action="resize"
        height="#thumbHeight#"
        width="#thumbWidth#"
        source="#empCodePath#\photos\#cffile.serverFile#"
        destination="#empCodePath#\small\#cffile.serverFile#"
        overwrite="true"/>

    <cfcatch>
    #cfcatch.Message#
</cfcatch>
</cftry>
    
    <!--- insert in the database --->
    
        <cfstoredproc procedure="UpdateNfoto" datasource="DATA_SERVICE_1" >
    <cfprocparam type="in"  dbvarname="@noticia_id" value="#URL.noticia_id#" cfsqltype="CF_SQL_VARCHAR">
    <cfprocparam type="in"  dbvarname="@noticia_foto" value="#cffile.serverFile#" cfsqltype="CF_SQL_VARCHAR">
            <cfprocresult name="theResult">
        </cfstoredproc>
        
    
    <cfcontent reset="true" /> #cffile.serverFile#
</CFOUTPUT>