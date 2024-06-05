document.addEventListener('DOMContentLoaded', function () {
    let cars = []; // Переменная для хранения списка автомобилей
    const carList = document.getElementById('carList');

    window.myModal = new bootstrap.Modal(document.getElementById('editCarModal'));
    function loadCars() {
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'http://localhost:8888/Servlet_OOP_l5_war/car', true);

        xhr.onload = function () {
            if (xhr.status === 200) {
                cars = JSON.parse(xhr.responseText);
                displayCars(cars);
            } else {
                console.error('Произошла ошибка при загрузке списка автомобилей:', xhr.statusText);
            }
        };

        xhr.send();
    }
    function displayCars(cars) {
        let tableHTML = `
    <table class="table table-striped table-bordered" style="width: 100%;">
        <thead class="thead-dark">
            <tr>
                <th style="width: 20%;">Марка</th>
                <th style="width: 20%;">Модель</th>
                <th style="width: 20%;">Кузов</th>
                <th style="width: 20%;">Год выпуска</th>
                <th style="width: 20%;">Объем</th>
                <th style="width: 30%;">Действия</th> 
            </tr>
        </thead>
        <tbody>
    `;

        cars.forEach(function (car) {
            tableHTML += `
            <tr>
                <td>${car.make}</td>
                <td>${car.model}</td>
                <td>${car.body}</td>
                <td>${car.year}</td>
                <td>${car.capacity}</td>
                <td>
                    <button onclick="editCar(${car.id})">Редактировать</button>
                    <button onclick="deleteCar(${car.id})">Удалить</button>
                </td>
            </tr>
        `;
        });

        tableHTML += `
        </tbody>
    </table>
    `;
        carList.innerHTML = tableHTML;
    }
    let currentCarId;
    window.editCar = function (carId) {
        const selectedCar = cars.find(car => car.id === carId);
        document.getElementById('editMake').value = selectedCar.make;
        document.getElementById('editModel').value = selectedCar.model;
        document.getElementById('editBody').value = selectedCar.body;
        document.getElementById('editYear').value = selectedCar.year;
        document.getElementById('editCapacity').value = selectedCar.capacity;
        currentCarId = carId;
        myModal.show(); // Показываем модальное окно
    }
    window.closeEdit = function () {
        myModal.hide();
    }
    window.saveChanges = function () {
        const make = document.getElementById('editMake').value;
        const model = document.getElementById('editModel').value;
        const body = document.getElementById('editBody').value;
        const year = document.getElementById('editYear').value;
        const capacity = document.getElementById('editCapacity').value;

        const xhr = new XMLHttpRequest();
        xhr.open('PUT', `http://localhost:8888/Servlet_OOP_l5_war/car?id=${currentCarId}`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');

        xhr.onload = function () {
            if (xhr.status === 200) {
                loadCars();
                myModal.hide(); // Закрываем модальное окно
            } else {
                console.error('Произошла ошибка при сохранении изменений:', xhr.statusText);
            }
        };

        xhr.send(JSON.stringify({
            make: make,
            model: model,
            body: body,
            year: year,
            capacity: capacity
        }));
    }
    window.deleteCar = function (carId) {
        const xhr = new XMLHttpRequest();
        xhr.open('DELETE', `http://localhost:8888/Servlet_OOP_l5_war/car?id=${carId}`, true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                loadCars(); // Обновляем список после успешного удаления
            } else {
                console.error('Произошла ошибка при удалении машины:', xhr.statusText);
            }
        };

        xhr.send();
    }
    loadCars(); // Вызываем загрузку списка при загрузке страницы
});