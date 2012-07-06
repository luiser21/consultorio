<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,db.*"  import="javax.servlet.*" import="javax.servlet.http.*" import="java.util.*" errorPage="" pageEncoding="UTF-8"%>
<link rel='stylesheet' id='style-css'  href='css/diapo.css' type='text/css' media='all'> 
<!--[if !IE]><!--><script type='text/javascript' src='Scripts/jquery.mobile-1.0rc2.customized.min.js'></script><!--<![endif]-->
<script type='text/javascript' src='Scripts/jquery.easing.1.3.js'></script> 
<script type='text/javascript' src='Scripts/jquery.hoverIntent.minified.js'></script> 
<script type='text/javascript' src='Scripts/diapo.js'></script> 
<script>
$(function(){
	$('.pix_diapo').diapo();
	//$(".iframe").colorbox({iframe:true, width:"650px", height:"400px"});
});

</script>
<%
Calendar ahoraCal = Calendar.getInstance();
int d=0;
%>
<style>
.button {
	background: #014464;
	background: -moz-linear-gradient(top, #0D658E, #0C577A 50%, #014D71 51%, #003E5C);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #0E658E), color-stop(.5, #0C577A), color-stop(.5, #014D71), to(#003E5C)); 
	border: 1px solid #368DBE;
	border-top: 1px solid #c3d6df;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	-moz-box-shadow: 0 1px 3px black;
	-webkit-box-shadow: 0 1px 3px black;
	box-shadow: 0 1px 3px black;
	color: white;
	display: block;
	font-size: 12px;
	font-weight: bold;
	height: 30px;
	line-height: 30px;
	padding: 5px 20px;
	text-align: center;
	text-decoration: none;
	text-shadow: 1px 1px 1px black;
	text-transform: uppercase;
	width: auto;
}
.button2 {
	background: #d9ae00;
	background: -moz-linear-gradient(top, #b28b06, #9c7705 50%, #9c7705 51%, #5c4100);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #b28b06), color-stop(.5, #9c7705), color-stop(.5, #9c7705), to(#5c4100)); 
	border: 1px solid #c7a60c;
	border-top: 1px solid #e5d51f;
}
.button3 {
	background: #ffd838;
	background: -moz-linear-gradient(top, #edbf21, #c89b0f 50%, #9c7705 51%, #906706);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0, #edbf21), color-stop(.5, #c89b0f), color-stop(.5, #c89b0f), to(#906706)); 
	border: 1px solid #c7a60c;
	border-top: 1px solid #e5d51f;
}
.price_table {
    float: right;
	font-size: 12px;
    margin: 10px auto 0;
    padding: 20px 0;
	position: relative;
	width: 570px;
}
.price_table .price_column.highlighted {
	background: #ffd838;
    margin: -5px!important;
	padding: 10px;
    z-index: 2;
}
.price_table .price_column {
	display: block;
	margin: 5px;
    float: left;
    position: absolute;
	width: 180px;
    z-index: 1;
}
.price_table .price_column > div {
	background: #eeeeee;
}
.price_table .price_column > div > div {
	padding: 10px 15px;
    border-bottom: 1px solid #cccccc;
    border-top: 1px solid #f6f6f6;
}
.price_table .price_column > div > p {
	padding: 10px 15px;
    border-bottom: 1px solid #cccccc;
    border-top: 1px solid #f6f6f6;
}
.price_table .price_column > div > ul {
	padding: 10px 15px;
    border-bottom: 1px solid #cccccc;
    border-top: 1px solid #f6f6f6;
}
.price_table .price_title {
	background-color: #333333;
    border-top: 0!important;
    color: #ffffff;
    font-size: 14px;
}
.price_table .highlighted .price_title {
    font-size: 16px;
}
.price_table .price_price {
    font-size: 36px;
    line-height: 40px;
}
.price_table .highlighted  .price_price {
    font-size: 40px;
    line-height: 44px;
}
.price_table .price_explanation {
	font-size: 10px;
    line-height: 13px;
    text-transform: uppercase;
}
.price_table .cusButton {
	background-color: #333333;
	display: block;
    text-align: center;
}
.price_table li {
	padding: 5px 0;
}
.price_table div.pix_check {
	background: url(images/demo/list-check-green.png) no-repeat 15px center;
    padding-left: 38px!important;
}
.price_table div.pix_error {
	background: url(images/demo/list-error.png) no-repeat 15px center;
    padding-left: 38px!important;
}

</style> 
</head> 
<body> 
       <section>
    	<div style="overflow:hidden; width:590px; height:320px; margin: 0 auto 0; padding:0 20px;"> 
                <div class="pix_diapo">
<% 
if(((ahoraCal.get(Calendar.MONTH) == Calendar.NOVEMBER) && (ahoraCal.get(Calendar.DATE) >= 15)) ||  ((ahoraCal.get(Calendar.MONTH) == Calendar.DECEMBER) && (ahoraCal.get(Calendar.DATE) <= 31))){
d=1;
}
if(d==1){%>
					 <div data-thumb="images/thumbs/megamind_07.jpg" data-time="6000">
                        <img src="images/slides/25_de_diciembre.jpg"> 
                        <div class="caption elemHover fromRight" style="bottom:207px; padding-bottom:5px; color:#ff0; text-transform:uppercase; top:46%; width:559px;">
                            El Consultorio Jur&iacute;dico.
                        </div>
                        <div class="caption elemHover fromLeft" style="padding-top:5px; top:56%; bottom:137px; width:559px;">
                            Les Desea una F&eacute;liz Navidad y un Prospero A&ntilde;o Nuevo <%out.print(ahoraCal.get(Calendar.YEAR)+1);%>!!!......
                        </div>
                    </div>                      
                                             
                    <div data-thumb="images/thumbs/megamind1048.jpg">
                        <img src="images/slides/casa.jpg">
                        <div class="caption elemHover fromLeft" style="bottom:148px; top:56%; width:559px; ">
                            Bienvenido al Software de Gesti&oacute;n Documental del Consultorio Jur&iacute;dico.
                        </div>
                    </div>                    
                    <div data-thumb="images/thumbs/megamind_07.jpg" data-time="6000">
                        <img src="images/slides/Feliz_Navidad_Papa_Noel.jpg"> 
                        <div class="caption elemHover fromRight" style="bottom:207px; padding-bottom:5px; color:#ff0; text-transform:uppercase; top:46%; width:559px;">
                            El Consultorio Jur&iacute;dico.
                        </div>
                        <div class="caption elemHover fromLeft" style="padding-top:5px; top:56%; bottom:137px; width:559px;">
                            Esta orientado al desarrollo integral del futuro abogado en todas las &aacute;reas del Derecho.
                        </div>
                    </div>                    
                    <div data-thumb="images/thumbs/wall-e.jpg" data-time="6000">
                        <img src="images/slides/regalos.jpg">
                        <div class="caption elemHover fromRight" style="bottom:207px; padding-bottom:5px; color:#ff0; text-transform:uppercase; top:46%; width:559px;">
                          El Derecho es una de las carreras
                        </div>
                        <div class="caption elemHover fromLeft" style="padding-top:5px; bottom:137px;  top:56%; width:559px;">
                           Profesionales que mayores oportunidades ofrece a sus egresados para desempe&ntilde;arse en la vida laboral.
                        </div>                      
                    </div>     
                    
   <%}else{%>               
     <div data-thumb="images/thumbs/megamind1048.jpg">
                        <img src="images/slides/1_imagen.jpg">
                        <div class="caption elemHover fromLeft" style="bottom:148px; top:56%; width:559px; ">
                            Bienvenido al Software de Gesti&oacute;n Documental del Consultorio Jur&iacute;dico.
                        </div>
                    </div>                    
                    <div data-thumb="images/thumbs/megamind_07.jpg" data-time="6000">
                        <img src="images/slides/2_imagen.jpg"> 
                        <div class="caption elemHover fromRight" style="bottom:207px; padding-bottom:5px; color:#ff0; text-transform:uppercase; top:46%; width:559px;">
                            El Consultorio Jur&iacute;dico.
                        </div>
                        <div class="caption elemHover fromLeft" style="padding-top:5px; top:56%; bottom:137px; width:559px;">
                            Esta orientado al desarrollo integral del futuro abogado en todas las &aacute;reas del Derecho.
                        </div>
                    </div>                    
                    <div data-thumb="images/thumbs/wall-e.jpg" data-time="6000">
                        <img src="images/slides/3_imagen.jpg">
                        <div class="caption elemHover fromRight" style="bottom:207px; padding-bottom:5px; color:#ff0; text-transform:uppercase; top:46%; width:559px;">
                          El Derecho es una de las carreras
                        </div>
                        <div class="caption elemHover fromLeft" style="padding-top:5px; bottom:137px;  top:56%; width:559px;">
                           Profesionales que mayores oportunidades ofrece a sus egresados para desempe&ntilde;arse en la vida laboral.
                        </div>                      
                    </div>       
                    <div data-thumb="images/thumbs/up-official-trailer-fake.jpg">
                       <img src="images/slides/4_imagen.jpg">
                        <div class="elemHover caption fromLeft elemToHide" style="bottom: 350px; width:auto; -webkit-border-top-right-radius: 6px; -webkit-border-bottom-right-radius: 6px; -moz-border-radius-topright: 6px; -moz-border-radius-bottomright: 6px; border-top-right-radius: 6px; border-bottom-right-radius: 6px; left:0">
                            El Consultorio Jur&iacute;dico, es un laboratorio de Ense&ntilde;anza
                        </div>
                    </div>
                <%}%>                  
               </div>             
        </div></section> <br/>  <br/>
     
