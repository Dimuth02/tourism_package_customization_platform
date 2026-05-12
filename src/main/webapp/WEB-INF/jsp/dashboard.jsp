<jsp:include page="header.jsp" />
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

        <section class="py-20 bg-stone-50 min-h-screen">
            <div class="container mx-auto px-6">
                
                <div class="flex flex-col md:flex-row justify-between items-end mb-16 gap-8">
                    <div>
                        <h1 class="text-4xl serif mb-4">Your Bespoke Journeys</h1>
                        <c:if test="${not empty email}">
                            <p class="text-gray-500 italic">Managing bookings for ${email}</p>
                        </c:if>
                        <c:if test="${empty email}">
                            <p class="text-gray-500 italic">Overview of all curated experiences.</p>
                        </c:if>
                    </div>
                    
                    <form action="/dashboard" method="GET" class="flex">
                        <input type="email" name="email" placeholder="Find by email..." class="p-3 border border-gray-200 focus:outline-none focus:border-accent-gold bg-white text-sm w-64">
                        <button type="submit" class="bg-black text-white px-6 py-3 uppercase text-[10px] tracking-widest font-bold hover:bg-accent-gold transition">Search</button>
                    </form>
                </div>

                <c:if test="${empty bookings}">
                    <div class="bg-white p-20 text-center shadow-sm border border-gray-100">
                        <p class="text-gray-400 serif text-xl mb-8">No bookings found.</p>
                        <a href="/packages" class="text-accent-gold uppercase text-xs tracking-widest font-bold border-b border-accent-gold pb-1">Begin your journey</a>
                    </div>
                </c:if>

                <c:if test="${not empty bookings}">
                    <div class="grid grid-cols-1 gap-8">
                        <c:forEach var="booking" items="${bookings}">
                            <div class="bg-white shadow-xl flex flex-col md:flex-row border border-gray-100 overflow-hidden">
                                <div class="bg-stone-900 text-white p-8 md:w-1/4 flex flex-col justify-between">
                                    <div>
                                        <span class="text-[10px] uppercase tracking-widest text-stone-500 block mb-2">Booking ID</span>
                                        <span class="text-[10px] font-mono text-stone-300">${booking.id}</span>
                                    </div>
                                    <div class="mt-8">
                                        <span class="text-[10px] uppercase tracking-widest text-stone-500 block mb-1">Status</span>
                                        <span class="inline-block bg-accent-gold text-black px-3 py-1 text-[10px] font-bold uppercase tracking-tighter">Confirmed</span>
                                    </div>
                                </div>
                                
                                <div class="p-8 md:w-3/4 flex flex-col md:flex-row justify-between items-center gap-8">
                                    <div>
                                        <h3 class="text-2xl serif mb-2">${booking.packageName}</h3>
                                        <div class="flex items-center gap-6 text-xs text-gray-500 uppercase tracking-widest">
                                            <span>${booking.userName}</span>
                                            <span>&bull;</span>
                                            <span>${fn:substring(booking.bookingDate, 0, 10)}</span>
                                        </div>
                                    </div>
                                    
                                    <div class="text-right">
                                        <span class="text-[10px] uppercase tracking-widest text-gray-400 block mb-1">Total Amount</span>
                                        <span class="text-3xl font-bold serif text-accent-gold">$${booking.totalPrice}</span>
                                    </div>
                                    
                                    <div>
                                        <button class="border border-black px-6 py-3 uppercase text-[10px] tracking-widest font-bold hover:bg-black hover:text-white transition">View Details</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>

            </div>
        </section>

<jsp:include page="footer.jsp" />
