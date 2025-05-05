

var canvas, ctx;

function init() {
    //1 - Se obtiene el canvas.
    canvas = document.getElementById('mycanvas');

    //2 - Se obtiene el contexto.
    ctx = canvas.getContext('2d');

    //3 - Dibujar.
    dibujar();
}

function dibujar() {
    //Dibujar un rectangulo rojo.
    ctx.fillStyle='#FF0000';
    ctx.fillRect(10,10,180,180);
}