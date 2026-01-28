const miniDB = [
    { id: 1, nombre: "producto 1" },
    { id: 2, nombre: "producto 2" },
    { id: 3, nombre: "producto 3" },
    { id: 4, nombre: "producto 4" },
    { id: 5, nombre: "producto 5" },
    { id: 6, nombre: "producto 6" },
    { id: 7, nombre: "producto 7" },
    { id: 8, nombre: "producto 8" },
    { id: 9, nombre: "producto 9" },

    { id: 10, nombre: "ordenador 1" },
    { id: 11, nombre: "ordenador 2" },
    { id: 12, nombre: "ordenador 3" },
    { id: 13, nombre: "ordenador 4" },

    { id: 20, nombre: "periferico 1" },
    { id: 21, nombre: "periferico 2" },
    { id: 22, nombre: "periferico 3" },
    { id: 23, nombre: "periferico 4" },

    { id: 30, nombre: "componente 1" },
    { id: 31, nombre: "componente 2" },
    { id: 32, nombre: "componente 3" },
    { id: 33, nombre: "componente 4" },

    { id: 40, nombre: "playstation" },
    { id: 41, nombre: "playstation pro" },
    { id: 42, nombre: "xbox" },
    { id: 43, nombre: "xbox series" },
    { id: 44, nombre: "nintendo" },
    { id: 45, nombre: "nintendo oled" }
];

const formBuscador = document.getElementById("form-buscador");
const inputBuscador = document.getElementById("buscador");
const sugerenciasDiv = document.getElementById("sugerencias");

if (formBuscador && inputBuscador) {
    formBuscador.addEventListener("submit", function (e) {
        e.preventDefault();

        const texto = inputBuscador.value.trim().toLowerCase();
        if (texto === "") return;

        const productoExacto = miniDB.find(
            p => p.nombre === texto
        );

        if (productoExacto) {
            window.location.href =
                "producto.html?id=" + productoExacto.id;
        } else {
            window.location.href =
                "listado.html?search=" + encodeURIComponent(texto);
        }
    });
}

if (inputBuscador && sugerenciasDiv) {
    inputBuscador.addEventListener("input", function () {
        const texto = inputBuscador.value.trim().toLowerCase();
        sugerenciasDiv.innerHTML = "";

        if (texto.length < 2) {
            sugerenciasDiv.style.display = "none";
            return;
        }

        const coincidencias = miniDB.filter(p =>
            p.nombre.includes(texto)
        );

        if (coincidencias.length === 0) {
            sugerenciasDiv.style.display = "none";
            return;
        }

        coincidencias.forEach(function (producto) {
            const div = document.createElement("div");
            div.className = "sugerencia-item";
            div.textContent = producto.nombre;

            div.addEventListener("click", function () {
                window.location.href =
                    "producto.html?id=" + producto.id;
            });

            sugerenciasDiv.appendChild(div);
        });

        sugerenciasDiv.style.display = "block";
    });

    document.addEventListener("click", function (e) {
        if (!e.target.closest(".header-buscador")) {
            sugerenciasDiv.style.display = "none";
        }
    });
}

const params = new URLSearchParams(window.location.search);
const busqueda = params.get("search");

if (busqueda) {
    const productos = document.querySelectorAll(".producto-item");

    productos.forEach(function (producto) {
        const nombre = producto.textContent.toLowerCase();

        producto.style.display =
            nombre.includes(busqueda.toLowerCase())
                ? "flex"
                : "none";
    });
}