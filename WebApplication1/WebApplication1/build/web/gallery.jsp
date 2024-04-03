<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Salang Indah Gallery</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .dashboard {
            background-color: #000;
            color: #fff;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .dashboard-title {
            font-size: 24px;
            font-weight: bold;
            color: #FCDD44;
        }

        .dashboard-links {
            display: flex;
            text-decoration: none;
            padding: 5px;
        }

        .dashboard-links a {
            color: #fff;
            text-decoration: none;
            padding: 5px;
        }

        .gallery-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 20px auto;
            max-width: 800px;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #fff;
            position: relative;
        }

        .gallery {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 10px;
            margin-bottom: 20px;
        }

        .gallery img {
            width: 100%;
            height: auto;
            display: none;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .gallery img.active {
            display: block;
        }

        .gallery img:hover {
            transform: scale(1.2);
        }

        .gallery-nav {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .gallery-nav button {
            background-color: #FCDD44;
            color: #000;
            border: none;
            padding: 10px 15px;
            font-weight: bold;
            cursor: pointer;
            margin: 0 5px;
        }
    </style>
</head>

<body>

    <div class="dashboard">
        <div class="dashboard-title">Salang Indah Gallery</div>
        <div class="dashboard-links">
            <a href="ContactUs.jsp" style="color: #FCDD44;">Back</a>
            <a href="index.jsp" style="color: #FCDD44;">Home</a>
        </div>
    </div>

    <div class="gallery-container">
        <div class="gallery">
            <img src="img/gallery1.jpg" alt="Picture 1" class="active">
            <img src="img/gallery2.jpg" alt="Picture 2" class="active">
            <img src="img/gallery3.jpg" alt="Picture 3">
            <img src="img/gallery4.jpg" alt="Picture 4">
            <img src="img/gallery5.jpg" alt="Picture 5">
            <img src="img/gallery6.jpg" alt="Picture 6">
            <img src="img/gallery7.jpg" alt="Picture 7">
            <img src="img/gallery8.jpg" alt="Picture 8">
            <img src="img/gallery9.jpg" alt="Picture 9">
            <img src="img/gallery10.jpg" alt="Picture 10">
        </div>
        <div class="gallery-nav">
            <button id="prevBtn">Previous</button>
            <button id="nextBtn">Next</button>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const prevBtn = document.getElementById('prevBtn');
            const nextBtn = document.getElementById('nextBtn');
            const galleryImages = document.querySelectorAll('.gallery img');
            let currentIndex = 0;

            function showImages(startIndex) {
                galleryImages.forEach(function (img) {
                    img.classList.remove('active');
                });
                for (let i = startIndex; i < startIndex + 2; i++) {
                    galleryImages[i].classList.add('active');
                }
            }

            prevBtn.addEventListener('click', function () {
                currentIndex -= 2;
                if (currentIndex < 0) {
                    currentIndex = galleryImages.length - 2;
                }
                showImages(currentIndex);
            });

            nextBtn.addEventListener('click', function () {
                currentIndex += 2;
                if (currentIndex >= galleryImages.length) {
                    currentIndex = 0;
                }
                showImages(currentIndex);
            });

            showImages(currentIndex);

            galleryImages.forEach(function (img) {
                img.addEventListener('mouseover', function () {
                    img.style.transform = 'scale(1.2)';
                });
                img.addEventListener('mouseout', function () {
                    img.style.transform = 'scale(1)';
                });
            });
        });
    </script>
</body>

</html>
