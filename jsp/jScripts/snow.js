<script language="javascript">
// Nevando en la pagina por Eloi Gallés Villaplana
//
// Este script y otros muchos pueden
// descarse on-line de forma gratuita
// en El Código: www.elcodigo.net


//configuracion
var numero = 12 ;				//numero de copos
var velocidad = 4 ;				//velocidad a la que caen
var imagennieve = "http://www.elcodigo.net/images/bg_WhitePaper.gif";	//imagen para el copito de nieve

//deteccion navegadores
var ns4arriba = (document.layers) ? 1 : 0;
var ie4arriba = (document.all) ? 1 : 0;

var dx, xp, yp;
var am, stx, sty;
var i, doc_ancho = 1024, doc_alto = 768;

function nieva() {
     if (ns4arriba) {
     	doc_ancho = self.innerWidth;
     	doc_alto = self.innerHeight;
     } else if (ie4arriba) {
     	doc_ancho = document.body.clientWidth;
     	doc_alto = document.body.clientHeight;
     }
     
     dx = new Array();
     xp = new Array();
     yp = new Array();
     am = new Array();
     stx = new Array();
     sty = new Array();
     
     for (i = 0; i < numero; ++ i) {
     	dx[i] = 0;
     	xp[i] = Math.random()*(doc_ancho-50);
     	yp[i] = Math.random()*doc_alto;
     	am[i] = Math.random()*20;
     	stx[i] = 0.02 + Math.random()/10;
     	sty[i] = 0.7 + Math.random();
     	if (ns4arriba) {
     		if (i == 0) {
     			document.write("<layer name=\"dot"+ i +"\" left=\"15\" ");
     			document.write("top=\"15\" visibility=\"show\"><img src=\"");
     			document.write(imagennieve + "\" border=\"0\"></layer>");
     		} else {
     			document.write("<layer name=\"dot"+ i +"\" left=\"15\" ");
     			document.write("top=\"15\" visibility=\"show\"><img src=\"");
     			document.write(imagennieve + "\" border=\"0\"></layer>");
     		}
     	} else if (ie4arriba) {
     		if (i == 0) {
     			document.write("<div id=\"dot"+ i +"\" style=\"POSITION: ");
     			document.write("absolute; Z-INDEX: "+ i +"; VISIBILITY: ");
     			document.write("visible; TOP: 15px; LEFT: 15px;\"><img src=\"");
     			document.write(imagennieve + "\" border=\"0\"></div>");
     		} else {
     			document.write("<div id=\"dot"+ i +"\" style=\"POSITION: ");
     			document.write("absolute; Z-INDEX: "+ i +"; VISIBILITY: ");
     			document.write("visible; TOP: 15px; LEFT: 15px;\"><img src=\"");
     			document.write(imagennieve + "\" border=\"0\"></div>");
     		}
     	}
     }
     
     if (ns4arriba) {
	nieve_netscape();
     } else if (ie4arriba) {
	nieve_explorer();
     } 
}

function nieve_netscape() {
	for (i = 0; i < numero; ++ i) {
		yp[i] += sty[i];
		if (yp[i] > doc_alto) {
			xp[i] = Math.random()*(doc_ancho-am[i]-30);
			yp[i] = 0;
			stx[i] = 0.02 + Math.random()/10;
			sty[i] = 0.7 + Math.random();
			doc_ancho = self.innerWidth;
			doc_alto = self.innerHeight;
		}
		dx[i] += stx[i];
		document.layers["dot"+i].top = yp[i];
		document.layers["dot"+i].left = xp[i] + am[i]*Math.sin(dx[i]);
	}
	setTimeout("nieve_netscape()", velocidad);
}

function nieve_explorer() {
	for (i = 0; i < numero; ++ i) {
		yp[i] += sty[i];
		if (yp[i] > doc_alto-10) {
			xp[i] = Math.random()*(doc_ancho-am[i]-30);
			yp[i] = 0;
			stx[i] = 0.02 + Math.random()/10;
			sty[i] = 0.7 + Math.random();
			doc_ancho = document.body.clientWidth;
			doc_alto = document.body.clientHeight;
		}
		dx[i] += stx[i];
		document.all["dot"+i].style.pixelTop = yp[i];
		document.all["dot"+i].style.pixelLeft = xp[i] + am[i]*Math.sin(dx[i]);
	}
	setTimeout("nieve_explorer()", velocidad);
}

</script>
