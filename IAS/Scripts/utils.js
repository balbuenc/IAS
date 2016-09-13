function format(input) {
    var num = input.value.replace(/\./g, '');
    if (!isNaN(num) || num == ',') {
        num = num.toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g, '$1.');
        num = num.split('').reverse().join('').replace(/^[\.]/, '');
        input.value = num;
    }
    else {
        alert('Solo se permiten numeros');
        input.value = input.value.replace(/[^\d\.]*/g, '');
    }
}

/**
 * Da formato a un número para su visualización
 *
 * @param {(number|string)} numero Número que se mostrará
 * @param {number} [decimales=null] Nº de decimales (por defecto, auto); admite valores negativos
 * @param {string} [separadorDecimal=","] Separador decimal
 * @param {string} [separadorMiles=""] Separador de miles
 * @returns {string} Número formateado o cadena vacía si no es un número
 *
 * @version 2014-07-18
 */
function formatoNumero(numero, decimales, separadorDecimal, separadorMiles) {
    var partes, array;
    var num = numero.value;

    if (!isFinite(num) || isNaN(num = parseFloat(num))) {

        return "";
    }
    if (typeof separadorDecimal === "undefined") {
        separadorDecimal = ",";
    }
    if (typeof separadorMiles === "undefined") {
        separadorMiles = ".";
    }

    // Redondeamos
    if (!isNaN(parseInt(decimales))) {
        if (decimales >= 0) {
            num = num.toFixed(decimales);
        } else {
            num = (
                Math.round(num / Math.pow(10, Math.abs(decimales))) * Math.pow(10, Math.abs(decimales))
            ).toFixed();
        }
    } else {
        num = num.toString();
    }

    // Damos formato
    partes = num.split(".", 2);
    array = partes[0].split("");
    for (var i = array.length - 3; i > 0 && array[i - 1] !== "-"; i -= 3) {
        array.splice(i, 0, separadorMiles);
    }
    num = array.join("");

    if (partes.length > 1) {
        num += separadorDecimal + partes[1];
    }
    numero.value = num;
    //return numero;
}

/**
    * Funcion que devuelve un numero separando los separadores de miles
    * Puede recibir valores negativos y con decimales
*/
function numberFormat(obj) {

    var numero = obj.value;

    // Variable que contendra el resultado final
    var resultado = "";

    // Cogemos el numero eliminando los posibles puntos que tenga
    nuevoNumero = numero.replace(/\./g, '');

    // Si tiene decimales, se los quitamos al numero
    if (numero.indexOf(",") >= 0)
        nuevoNumero = nuevoNumero.substring(0, nuevoNumero.indexOf(","));

    console.log(nuevoNumero);

    // Ponemos un punto cada 3 caracteres
    for (var j, i = nuevoNumero.length, j = 0; i >= 0; i--, j++) {
        resultado = nuevoNumero.charAt(i) + ((j > 0) && (j % 3 == 0) ? "." : "") + resultado;
    }

    // Si tiene decimales, se lo añadimos al numero una vez forateado con 
    // los separadores de miles
    if (numero.indexOf(",") >= 0)
        resultado += numero.substring(numero.indexOf(","));

    obj.value = resultado;

}