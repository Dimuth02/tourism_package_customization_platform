<jsp:include page="header.jsp" />
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <section class="py-20 bg-stone-50">
            <div class="container mx-auto px-6">
                <div class="flex flex-col lg:flex-row gap-16">
                    
                    <!-- Customisation Options -->
                    <div class="lg:w-2/3">
                        <div class="mb-12">
                            <a href="/packages" class="text-xs uppercase tracking-widest font-bold text-gray-400 hover:text-black transition flex items-center mb-8">
                                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
                                Back to Packages
                            </a>
                            <h1 class="text-4xl md:text-5xl mb-4 serif">Customise Your Experience</h1>
                            <p class="text-gray-500 italic">Personalising the ${pkg.name} journey.</p>
                        </div>

                        <!-- Step 1: Accommodation -->
                        <div class="mb-16">
                            <h3 class="text-xl serif mb-8 pb-4 border-b border-gray-200">1. Select Accommodation</h3>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <label class="block relative border border-gray-200 p-6 cursor-pointer hover:border-accent-gold transition" onclick="updatePrice()">
                                    <input type="radio" name="hotel" value="0" checked class="absolute top-4 right-4 accent-gold">
                                    <span class="block font-bold mb-1">Standard Boutique Hotels</span>
                                    <span class="block text-sm text-gray-500 mb-2 italic">Included in base price</span>
                                    <span class="block text-xs uppercase tracking-widest font-bold text-accent-gold">Included</span>
                                </label>
                                <label class="block relative border border-gray-200 p-6 cursor-pointer hover:border-accent-gold transition" onclick="updatePrice()">
                                    <input type="radio" name="hotel" value="250" class="absolute top-4 right-4 accent-gold">
                                    <span class="block font-bold mb-1">Luxury Resorts</span>
                                    <span class="block text-sm text-gray-500 mb-2 italic">Five-star premium experience</span>
                                    <span class="block text-xs uppercase tracking-widest font-bold text-accent-gold">+$250.00</span>
                                </label>
                            </div>
                        </div>

                        <!-- Step 2: Activities -->
                        <div class="mb-16">
                            <h3 class="text-xl serif mb-8 pb-4 border-b border-gray-200">2. Enhance Your Journey</h3>
                            <div class="space-y-4">
                                <label class="flex items-center justify-between p-6 border border-gray-200 cursor-pointer hover:border-accent-gold transition" onclick="updatePrice()">
                                    <div class="flex items-center">
                                        <input type="checkbox" name="activity" value="120" class="w-5 h-5 accent-gold mr-4">
                                        <div>
                                            <span class="block font-bold">Private Guided Photography Tour</span>
                                            <span class="block text-sm text-gray-500 italic">Capture the best angles with a professional</span>
                                        </div>
                                    </div>
                                    <span class="font-bold serif">+$120.00</span>
                                </label>
                                <label class="flex items-center justify-between p-6 border border-gray-200 cursor-pointer hover:border-accent-gold transition" onclick="updatePrice()">
                                    <div class="flex items-center">
                                        <input type="checkbox" name="activity" value="85" class="w-5 h-5 accent-gold mr-4">
                                        <div>
                                            <span class="block font-bold">Traditional Cooking Masterclass</span>
                                            <span class="block text-sm text-gray-500 italic">Learn the secrets of Sri Lankan spices</span>
                                        </div>
                                    </div>
                                    <span class="font-bold serif">+$85.00</span>
                                </label>
                                <label class="flex items-center justify-between p-6 border border-gray-200 cursor-pointer hover:border-accent-gold transition" onclick="updatePrice()">
                                    <div class="flex items-center">
                                        <input type="checkbox" name="activity" value="150" class="w-5 h-5 accent-gold mr-4">
                                        <div>
                                            <span class="block font-bold">Helicopter Transfer (One-way)</span>
                                            <span class="block text-sm text-gray-500 italic">Breathtaking aerial views</span>
                                        </div>
                                    </div>
                                    <span class="font-bold serif">+$150.00</span>
                                </label>
                            </div>
                        </div>

                        <!-- Step 3: Transport -->
                        <div class="mb-16">
                            <h3 class="text-xl serif mb-8 pb-4 border-b border-gray-200">3. Transport Preference</h3>
                            <select id="transport" class="w-full p-4 border border-gray-200 focus:outline-none focus:border-accent-gold transition bg-white" onchange="updatePrice()">
                                <option value="0">Standard Private Sedan (Included)</option>
                                <option value="100">Luxury SUV Upgrade (+$100.00)</option>
                                <option value="200">Premium Chauffeur Driven Limousine (+$200.00)</option>
                            </select>
                        </div>
                    </div>

                    <!-- Price Summary Sticky Sidebar -->
                    <div class="lg:w-1/3">
                        <div class="sticky top-32 bg-white border border-gray-100 shadow-2xl p-10">
                            <h3 class="text-2xl serif mb-8 text-center uppercase tracking-widest">Summary</h3>
                            
                            <div class="space-y-6 mb-10 text-sm">
                                <div class="flex justify-between border-b border-gray-50 pb-4">
                                    <span class="text-gray-500">Base Package</span>
                                    <span class="font-bold">$${pkg.basePrice}</span>
                                </div>
                                <div class="flex justify-between border-b border-gray-50 pb-4">
                                    <span class="text-gray-500">Accommodation Upgrade</span>
                                    <span class="font-bold" id="summary-hotel">+$0.00</span>
                                </div>
                                <div class="flex justify-between border-b border-gray-50 pb-4">
                                    <span class="text-gray-500">Activity Add-ons</span>
                                    <span class="font-bold" id="summary-activities">+$0.00</span>
                                </div>
                                <div class="flex justify-between border-b border-gray-50 pb-4">
                                    <span class="text-gray-500">Transport Upgrade</span>
                                    <span class="font-bold" id="summary-transport">+$0.00</span>
                                </div>
                            </div>

                            <div class="flex justify-between items-center mb-10">
                                <span class="text-lg uppercase tracking-widest font-bold">Total Price</span>
                                <span class="text-3xl font-bold serif text-accent-gold" id="total-price">$${pkg.basePrice}</span>
                            </div>

                            <form action="/checkout" method="GET">
                                <input type="hidden" name="packageId" value="${pkg.id}">
                                <input type="hidden" name="totalPrice" id="input-total-price" value="${pkg.basePrice}">
                                <button type="submit" class="w-full bg-black text-white py-5 uppercase text-xs tracking-widest font-bold hover:bg-accent-gold transition duration-300 shadow-lg">Proceed to Booking</button>
                            </form>
                            
                            <p class="text-center text-[10px] text-gray-400 mt-6 uppercase tracking-widest leading-relaxed">Prices are subject to availability and seasonal changes.</p>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <script>
            const basePrice = ${pkg.basePrice};

            function updatePrice() {
                let hotelPrice = 0;
                const hotelRadios = document.getElementsByName('hotel');
                for (const radio of hotelRadios) {
                    if (radio.checked) {
                        hotelPrice = parseFloat(radio.value);
                        break;
                    }
                }

                let activitiesPrice = 0;
                const activityCheckboxes = document.getElementsByName('activity');
                for (const cb of activityCheckboxes) {
                    if (cb.checked) {
                        activitiesPrice += parseFloat(cb.value);
                    }
                }

                const transportPrice = parseFloat(document.getElementById('transport').value);

                const total = basePrice + hotelPrice + activitiesPrice + transportPrice;

                document.getElementById('summary-hotel').innerText = '+$' + hotelPrice.toFixed(2);
                document.getElementById('summary-activities').innerText = '+$' + activitiesPrice.toFixed(2);
                document.getElementById('summary-transport').innerText = '+$' + transportPrice.toFixed(2);
                document.getElementById('total-price').innerText = '$' + total.toFixed(2);
                document.getElementById('input-total-price').value = total.toFixed(2);
            }
        </script>

<jsp:include page="footer.jsp" />
