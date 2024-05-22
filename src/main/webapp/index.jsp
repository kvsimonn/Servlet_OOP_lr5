<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Список автомобилей</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 5rem;
        }

        .custom-navbar {
            background-color: #8a0000;
            color: #fff;
        }

        h1 {
            text-align: center;
            margin-bottom: 3rem;
        }

        .container {
            max-width: 600px;
            margin: auto;
        }

        form {
            background-color: #f9f9f9;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .btn-primary, .btn-back {
            background-color: #8a0000; /* Красный цвет */
            color: #fff; /* Белый текст */
            margin-right: 10px; /* Добавляем отступ между кнопками */
        }
    </style>
</head>
<body>

<div class="container">
    <form id="carForm" class="px-4">
        <div class="row mb-3">
            <div class="col-md-12">
                <label for="make" class="form-label">Марка:</label>
                <input type="text" class="form-control" id="make" name="make" required>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-12">
                <label for="model" class="form-label">Модель:</label>
                <input type="text" class="form-control" id="model" name="model" required>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-12">
                <label for="body" class="form-label">Кузов:</label>
                <input type="text" class="form-control" id="body" name="body" required>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-12">
                <label for="year" class="form-label">Год выпуска:</label>
                <input type="number" class="form-control" id="year" name="year" required>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-12">
                <label for="capacity" class="form-label">Объем двигател, л.:</label>
                <input type="text" class="form-control" id="capacity" name="capacity" required>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">ЗАПИСЬ</button>
        <button type="submit" class="btn btn-back" onclick="window.location.href='carList.html'">ЧТЕНИЕ</button>
    </form>

</div>

<div class="modal fade" id="editCarModal" tabindex="-1" role="dialog" aria-labelledby="editCarModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCarModalLabel">Редактирование автомобиля</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Форма для редактирования данных автомобиля -->
                <form id="editCarForm">
                    <div class="form-group">
                        <label for="editMake">Марка</label>
                        <input type="text" class="form-control" id="editMake">
                    </div>
                    <div class="form-group">
                        <label for="editModel">Модель</label>
                        <input type="text" class="form-control" id="editModel">
                    </div>
                    <div class="form-group">
                        <label for="editBody">Тип двигателя</label>
                        <input type="text" class="form-control" id="editBody">
                    </div>
                    <div class="form-group">
                        <label for="editYear">Год выпуска</label>
                        <input type="number" class="form-control" id="editYear">
                    </div>
                    <div class="form-group">
                        <label for="editCapacity">Объем</label>
                        <input type="text" class="form-control" id="editCapacity">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                <button type="button" class="btn btn-primary" onclick="saveChanges()">Сохранить изменения</button>
            </div>
        </div>
    </div>
</div>



<script src="writer.js"></script>

</body>
</html>