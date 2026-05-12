<jsp:include page="header.jsp" />
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <section class="py-20 bg-stone-50 min-h-screen">
            <div class="container mx-auto px-6 max-w-4xl">
                
                <div class="text-center mb-16">
                    <h1 class="text-4xl serif mb-4">Complete Your Journey</h1>
                    <p class="text-gray-500 italic">Please provide your details to finalise the booking.</p>
                </div>

                <div class="bg-white shadow-2xl flex flex-col md:flex-row overflow-hidden">
                    <!-- Order Summary -->
                    <div class="md:w-1/3 bg-stone-900 text-white p-10">
                        <h3 class="serif text-xl mb-8 uppercase tracking-widest border-b border-stone-700 pb-4">Reservation</h3>
                        <div class="space-y-6">
                            <div>
                                <span class="text-[10px] uppercase tracking-widest text-stone-500 block mb-1">Package</span>
                                <span class="text-sm font-bold">${pkg.name}</span>
                            </div>
                            <div>
                                <span class="text-[10px] uppercase tracking-widest text-stone-500 block mb-1">Duration</span>
                                <span class="text-sm font-bold">${pkg.durationDays} Days</span>
                            </div>
                            <div class="pt-8 border-t border-stone-700">
                                <span class="text-[10px] uppercase tracking-widest text-stone-500 block mb-1">Total Investment</span>
                                <span class="text-2xl font-bold serif text-accent-gold">$${totalPrice}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Checkout Form -->
                    <div class="md:w-2/3 p-10">
                        <form action="/book" method="POST" class="space-y-8">
                            <input type="hidden" name="packageId" value="${pkg.id}">
                            <input type="hidden" name="packageName" value="${pkg.name}">
                            <input type="hidden" name="totalPrice" value="${totalPrice}">

                            <div>
                                <label class="block text-[10px] uppercase tracking-widest font-bold text-gray-400 mb-2">Full Name</label>
                                <input type="text" name="userName" required class="w-full p-4 border border-gray-100 focus:outline-none focus:border-accent-gold transition bg-stone-50" placeholder="John Doe">
                            </div>

                            <div>
                                <label class="block text-[10px] uppercase tracking-widest font-bold text-gray-400 mb-2">Email Address</label>
                                <input type="email" name="userEmail" required class="w-full p-4 border border-gray-100 focus:outline-none focus:border-accent-gold transition bg-stone-50" placeholder="john@example.com">
                            </div>

                            <div class="pt-6">
                                <button type="submit" class="w-full bg-accent-gold text-white py-5 uppercase text-xs tracking-widest font-bold hover:bg-black transition duration-300">Confirm Reservation</button>
                                <p class="text-[10px] text-gray-400 mt-6 text-center leading-relaxed">By clicking confirm, you agree to our terms of service and private policy.</p>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </section>

<jsp:include page="footer.jsp" />
