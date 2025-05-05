// Asegurar que los modales estén ocultos al cargar la página
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".modal").forEach((modal) => {
        modal.style.display = "none"; // Ocultar todos los modales al inicio
    });

    // Agregar eventos a los inputs y botones
    const depositInput = document.getElementById("depositAmount");
    if (depositInput) depositInput.addEventListener("input", updateChips);

    const depositButton = document.getElementById("depositButton");
    if (depositButton) depositButton.addEventListener("click", depositMoney);

    // Cargar las fichas almacenadas (si existen)
    let storedChips = localStorage.getItem("chipsBalance");
    if (storedChips) {
        document.getElementById("chipsBalance").textContent = storedChips;
    }
});

// Función para abrir un modal
function openModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) modal.style.display = "flex";
}

// Función para cerrar un modal
function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) modal.style.display = "none";
}

// Cerrar el modal si el usuario hace clic fuera del contenido
document.addEventListener("click", function (event) {
    document.querySelectorAll(".modal").forEach((modal) => {
        if (event.target === modal) modal.style.display = "none";
    });
});

// ---------------- CONVERSIÓN DE MONEDA A FICHAS ----------------
function updateChips() {
    const depositInput = document.getElementById("depositAmount");
    const chipsDisplay = document.getElementById("chipsDisplay");

    let euros = parseFloat(depositInput.value) || 0;
    let chips = euros * 10;

    chipsDisplay.textContent = `🎲 Recibirás: ${chips} fichas`;
}

// ---------------- FUNCIÓN PARA PROCESAR EL DEPÓSITO ----------------
function depositMoney() {
    const depositInput = document.getElementById("depositAmount");
    let euros = parseFloat(depositInput.value) || 0;

    if (euros <= 0) {
        openModal("errorModal"); // Muestra un modal de error (puedes crearlo si quieres)
        return;
    }

    let chips = euros * 10; // Conversión

    // Obtener las fichas actuales
    let currentChips = parseInt(document.getElementById("chipsBalance").textContent) || 0;
    let newChipsBalance = currentChips + chips;

    // Actualizar el saldo de fichas
    document.getElementById("chipsBalance").textContent = newChipsBalance;

    // Guardar en localStorage para persistencia
    localStorage.setItem("chipsBalance", newChipsBalance);

    // Actualizar y mostrar el modal de confirmación
    document.getElementById("confirmationMessage").textContent = `Has recibido ${chips} fichas. ¡Sigue jugando! 🎰`;
    openModal("confirmationModal");

    // Limpiar el input y cerrar el modal de depósito
    depositInput.value = "";
    updateChips();
    closeModal("depositModal");
}

// ---------------- MENÚ DE USUARIO ----------------
// Alternar el menú desplegable del usuario
function toggleDropdown() {
    const dropdown = document.getElementById("userDropdown");
    dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
}

// Cerrar el menú si se hace clic fuera de él
document.addEventListener("click", function (event) {
    const dropdown = document.getElementById("userDropdown");
    const userIcon = document.querySelector(".user-icon");

    if (dropdown && !dropdown.contains(event.target) && !userIcon.contains(event.target)) {
        dropdown.style.display = "none";
    }
});

// Redirigir a la página de perfil
function goToProfile() {
    window.location.href = "perfil.html";
}

function goVIP() {
    alert("¡Bienvenido a la sección VIP!"); // O redirige a una página VIP
    // window.location.href = "vip.html"; // Descomenta esto si tienes una página VIP
}