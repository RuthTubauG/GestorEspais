// Funció per alternar la visibilitat de la informació addicional
function toggleDetails(button, elementId) {
    const hiddenDetails = document.getElementById(elementId);
    console.log(`Button clicked: ${button.id}, Element ID: ${elementId}`);
    if (hiddenDetails) {
        // Toggle la classe 'show-details' per mostrar o amagar els detalls
        hiddenDetails.classList.toggle('show-details');
        
        // Canvia el text del botó a "+" o "-"
        const buttonText = hiddenDetails.classList.contains('show-details') ? '-' : '+';
        button.textContent = buttonText;
    } else {
        console.error("Element amb l'ID proporcionat no trobat.");
    }
}

// Funció per obtenir i mostrar tots els espais
function obtenirEspais() {
    fetch('/salas')
    .then(response => response.json())
    .then(salas => {
        console.log('Dades obtingudes:', salas);

        // Itera sobre cada adreça i actualitza el contingut dels div corresponents
        for (let j = 1; j <= 4; j++) {
            for (let i = 1; i <= 4; i++) {
                const salaDiv = document.getElementById(`sala${j}_${i}`);
                const aulaDiv = document.getElementById(`aula${j}_${i}`);
                const despatxDiv = document.getElementById(`despatx${j}_${i}`);

                const salaIndex = (j - 1) * 16 + (i - 1);
                const aulaIndex = (j - 1) * 16 + 4 + (i - 1);
                const despatxIndex = (j - 1) * 16 + 8 + (i - 1);

                if (salaDiv && salas[salaIndex]) {
                    salaDiv.innerHTML = 
                    `
                    <ul>
                        <li>Estat: ${salas[salaIndex].disponibilitat}</li>
                        <li>Metros: ${salas[salaIndex].metros_cuadrats}</li> 
                        <li>Homologació: ${salas[salaIndex].homologacio}</li>
                    </ul>
                    `;
                }

                if (aulaDiv && salas[aulaIndex]) {
                    aulaDiv.innerHTML = 
                    `
                    <ul>
                        <li>Estat: ${salas[aulaIndex].disponibilitat}</li> 
                        <li>Metros: ${salas[aulaIndex].metros_cuadrats}</li> 
                        <li>Homologació: ${salas[aulaIndex].homologacio}</li> 
                    </ul>
                    `;
                }

                if (despatxDiv && salas[despatxIndex]) {
                    despatxDiv.innerHTML = 
                    `
                    <ul>
                        <li>Estat: ${salas[despatxIndex].disponibilitat}</li> 
                        <li>Metros: ${salas[despatxIndex].metros_cuadrats}</li> 
                        <li>Homologació: ${salas[despatxIndex].homologacio}</li> 
                    </ul>
                    `;
                }
            }
        }
    })
    .catch(error => {
        console.error('Error al obtenir tots els espais:', error);
    });
}

// Cridem la funció per mostrar tots els espais en carregar la pàgina
obtenirEspais();

// Funció per crear una reserva
function crearReserva() {
    const data_inici = document.getElementById("data_inici").value;
    const data_fi = document.getElementById("data_fi").value;
    const horari = document.getElementById("horari").value;
    const disponibilitat = document.getElementById("disponibilitat").value;
    const id = document.getElementById("id").value;
    const id_salas = document.getElementById("id_salas").value;
    const id_usuaris = document.getElementById("id_usuaris").value;

    // Validar camps del formulari aquí
    fetch('/reservas', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
        data_inici,
        data_fi,
        horari,
        disponibilitat,
        id,
        id_salas,
        id_usuaris,
        }),
        })
        .then(response => {
            if (response.status === 201) {
            return response.json();
            } else {
            throw new Error('Error al crear la reserva');
            }
        })
        .then(data => {
            alert('Reserva creada amb èxit');
            console.log('Nova reserva:', data);
        })
        .catch(error => {
            console.error('Error al crear reserva:', error);
            alert('Error al crear la reserva');
        });
}