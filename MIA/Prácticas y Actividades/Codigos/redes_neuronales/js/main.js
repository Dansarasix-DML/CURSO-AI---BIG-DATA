
// Inicializar la red neuronal
const net = new brain.NeuralNetwork();

/*
    Entrene la red neuronal con los datos de entrada y salida
    para que cambie el texto de color a blanco o negro
    dependiendo del color de fondo
*/

net.train([
    // Fondo negro (todos 0) -> texto blanco (salida 1)
    {input: {rojo: 0, verde: 0, azul: 0}, output: {color: 1}},

    // Fondo blanco (todos 1) -> texto negro (salida 0)
    {input: {rojo: 1, verde: 1, azul: 1}, output: {color: 0}},

    // Fondos básicos, texto en negro
    {input: {rojo: 0, verde: 0, azul: 1}, output: {color: 0}},
    {input: {rojo: 0, verde: 1, azul: 0}, output: {color: 0}},
    {input: {rojo: 1, verde: 0, azul: 0}, output: {color: 0}}
]);

function update(event) {
    let colorInput = event.target;
    let rgb = hexToRgb(colorInput.value);

    if (!rgb) {
        console.error("Color no válido");
        return;
    }

    let div = document.querySelector('.box');
    div.style.background = colorInput.value;

    /* 
        Tomar el fondo actual elegido por el usuario
        para usarlo de entrada para que la red nos dé
        la predicción del mejor color de texto a utilizar
    */
    let input = {
        rojo: rgb.r / 255,
        verde: rgb.g / 255,
        azul: rgb.b / 255
    };

    // Obtener predicción de la red
    let sol = net.run(input);

    // Si sol.color >= 0.5 -> texto blanco, si no negro
    div.style.color = sol.color >= 0.5 ? "white" : "black";
}

// Función auxiliar para convertir un color HEX a RGB
function hexToRgb(hex) {
    let shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
    hex = hex.replace(shorthandRegex, (m, r, g, b) => r + r + g + g + b + b);

    let result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } : null;
}

document.addEventListener("DOMContentLoaded", function () {
    let colorPicker = document.querySelector('input[name="color"]');

    if (colorPicker) {
        colorPicker.addEventListener("input", update);
    } else {
        console.error("No se encontró un input con name='color'");
    }
});
