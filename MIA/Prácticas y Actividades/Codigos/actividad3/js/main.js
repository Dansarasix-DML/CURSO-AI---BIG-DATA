/***
 Daniel Marín López
 version: 1.00a
***/

/**
 * Red Neuronal para que pase un número complejo a su forma polar
 */
const net = new brain.NeuralNetwork();

// Datos de entrenamiento corregidos
net.train([
    { input: { x: 1, y: 0 }, output: { modulo: 1, arg: 0 / 360 } },
    { input: { x: 0, y: 1 }, output: { modulo: 1, arg: 90 / 360 } },
    { input: { x: -1, y: 0 }, output: { modulo: 1, arg: 180 / 360 } },
    { input: { x: 0, y: -1 }, output: { modulo: 1, arg: 270 / 360 } },
    { input: { x: 1, y: 1 }, output: { modulo: Math.sqrt(2), arg: 45 / 360 } },
    { input: { x: -1, y: 1 }, output: { modulo: Math.sqrt(2), arg: 135 / 360 } },
    { input: { x: 1, y: -1 }, output: { modulo: Math.sqrt(2), arg: 315 / 360 } },
    { input: { x: -1, y: -1 }, output: { modulo: Math.sqrt(2), arg: 225 / 360 } },
    { input: { x: 2, y: 0 }, output: { modulo: 3, arg: 0 / 360 } },
    { input: { x: 3, y: 0 }, output: { modulo: 3, arg: 0 / 360 } },
    { input: { x: 4, y: 0 }, output: { modulo: 3, arg: 0 / 360 } },
    { input: { x: 5, y: 0 }, output: { modulo: 3, arg: 0 / 360 } },
]);

/**
 * Función para actualizar la predicción de la red neuronal y mostrar los resultados
 */
function update() {
    // Obtener valores de entrada
    let x = parseFloat(document.querySelector("input[name='x']").value);
    let y = parseFloat(document.querySelector("input[name='y']").value);

    let forma_polar_red = document.querySelector("h4[name='forma_polar_red']");
    let forma_polar_calculo = document.querySelector("h4[name='forma_polar_calculo']");
    let error = document.querySelector("h4[name='errores']");

    // Normalizar las entradas (factor de escalado opcional si x e y son grandes)
    const maxInput = Math.max(Math.abs(x), Math.abs(y));
    const input = {
        x: x / maxInput,
        y: y / maxInput,
    };

    // Predicción con la red neuronal
    let sol = net.run(input);
    
    // Desnormalizar la salida
    const modulo = sol.modulo * maxInput;
    let arg = sol.arg * 360; // Escalar el ángulo de vuelta al rango [0, 360)

    // Corregir ángulo al rango [0, 360)
    if (arg < 0) arg += 360;

    // Cálculo directo para comparación
    const modulo_calculado = Math.sqrt(x * x + y * y);
    let arg_calculado = Math.atan2(y, x) * 180 / Math.PI;
    if (arg_calculado < 0) arg_calculado += 360;

    // Mostrar resultados
    forma_polar_red.innerHTML = `(${modulo.toFixed(3)}, ${arg.toFixed(2)}º)`;
    forma_polar_calculo.innerHTML = `(${modulo_calculado.toFixed(3)}, ${arg_calculado.toFixed(2)}º)`;

    let E_M = Math.sqrt((modulo - modulo_calculado) ** 2);
    let E_Arg = Math.sqrt((arg - arg_calculado) ** 2);

    // Mostrar errores
    error.innerHTML = `(E_M: ${E_M.toFixed(3)}, E_Arg: ${E_Arg.toFixed(2)})`;
}


/**
 * Llamada a la función update al cargar la página
 */
document.addEventListener("DOMContentLoaded", function(){
    let boton = document.getElementsByName("iniciar")[0]

    boton.addEventListener("click", update)
    
});