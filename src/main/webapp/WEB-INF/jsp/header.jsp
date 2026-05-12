<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TPCP - Tourism Package Customisation</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Lato', sans-serif; }
        h1, h2, h3, .serif { font-family: 'Playfair Display', serif; }
        .accent-gold { color: #C5A059; }
        .bg-accent-gold { background-color: #C5A059; }
        .border-accent-gold { border-color: #C5A059; }
    </style>
</head>
<body class="bg-white text-gray-900 leading-normal tracking-normal">

    <!-- Navigation -->
    <nav class="bg-white border-b border-gray-100 py-6 sticky top-0 z-50">
        <div class="container mx-auto px-6 flex justify-between items-center">
            <div class="text-2xl font-bold tracking-widest serif uppercase">
                <a href="/">TPCP <span class="text-xs block font-light tracking-normal">Tourism Platform</span></a>
            </div>
            <div class="hidden md:flex space-x-8 uppercase text-xs tracking-widest font-bold">
                <a href="/" class="hover:text-accent-gold transition">Home</a>
                <a href="/packages" class="hover:text-accent-gold transition">Destinations</a>
                <a href="/customise" class="hover:text-accent-gold transition">Customise</a>
                <a href="/dashboard" class="hover:text-accent-gold transition">My Bookings</a>
            </div>
            <div class="md:hidden">
                <!-- Mobile menu button -->
                <button class="text-gray-900 focus:outline-none">
                    <svg class="h-6 w-6 fill-current" viewBox="0 0 24 24">
                        <path d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"/>
                    </svg>
                </button>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <main>
