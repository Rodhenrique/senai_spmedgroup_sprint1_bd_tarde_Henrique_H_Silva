window.onload = function() {
    overlay.addEventListener('click', () => {
        this.fecha('pesquisa')
    })
    overlay.addEventListener('click', () => {
        this.fecha('plaza')
    })
    overlay.addEventListener('click', () => {
        this.fecha('shot')
    })
    overlay.addEventListener('click', () => {
        this.fecha('pop')
    })
    overlay.addEventListener('click', () => {
        this.fecha('super')
    })
    overlay.addEventListener('click', () => {
        this.fecha('mega')
    })
    overlay.addEventListener('click', () => {
        this.fecha('atmega')
    })
    overlay.addEventListener('click', () => {
        this.fecha('ruber')
    })
    overlay.addEventListener('click', () => {
        this.fecha('rox')
    })
    overlay.addEventListener('click', () => {
        this.fecha('huk')
    })
    overlay.addEventListener('click', () => {
        this.fecha('silve')
    })
    overlay.addEventListener('click', () => {
        this.fecha('falcon')
    })
    overlay.addEventListener('click', () => {
        this.fecha('chilo')
    })
    overlay.addEventListener('click', () => {
        this.fecha('net')
    })
    overlay.addEventListener('click', () => {
        this.fecha('hero')
    })
    overlay.addEventListener('click', () => {
        this.fecha('rubo')
    })
}

function abrir(modal, rob) {
    if (modal == "atmega") {
        fecha('shot')
    } else if (modal == "net") {
        fecha('huk')
    }
    var pop = document.getElementsByClassName(modal)
    pop[0].style.display = "block"
    var element = document.getElementById("overlay");
    element.classList.add("active");
    var root = document.getElementById(rob);
    root.classList.add("active");
    document.body.style.overflow = "hidden";
}

function fecha(modal) {
    if (modal == "super" || modal == "ruber" || modal == "rox") {
        fecha('pop')
    } else if (modal == "mega" || modal == "atmega") {
        fecha('shot')
    } else if (modal == "silve" || modal == "net") {
        fecha('huk')
    }
    var pop = document.getElementsByClassName(modal)
    pop[0].style.display = "none"

    var element = document.getElementById("overlay");
    element.classList.remove("active");

    document.body.style.overflow = "visible";
}