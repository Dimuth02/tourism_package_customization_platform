<jsp:include page="header.jsp" />
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!-- Header Section -->
        <section class="py-20 bg-stone-50 border-b border-gray-100">
            <div class="container mx-auto px-6 text-center">
                <h1 class="text-4xl md:text-5xl mb-6 serif">Our Curated Packages</h1>
                <p class="text-gray-500 max-w-2xl mx-auto italic">Select a base journey and make it uniquely yours with our customisation options.</p>
            </div>
        </section>

        <!-- Packages List -->
        <section class="py-20">
            <div class="container mx-auto px-6">
                <div class="space-y-24">
                    <c:forEach var="pkg" items="${packages}" varStatus="status">
                        <div class="flex flex-col md:flex-row items-center gap-12 md:gap-20 ${status.index % 2 == 0 ? '' : 'md:flex-row-reverse'}">
                            <div class="md:w-1/2 overflow-hidden shadow-xl">
                                <img src="${pkg.imageUrl}" alt="${pkg.name}" class="w-full h-[400px] object-cover hover:scale-105 transition duration-700">
                            </div>
                            <div class="md:w-1/2">
                                <span class="text-accent-gold uppercase text-xs tracking-widest font-bold mb-4 block">${pkg.durationDays} Days</span>
                                <h2 class="text-3xl md:text-4xl mb-4 serif">${pkg.name}</h2>
                                <p class="text-xl italic text-gray-500 mb-6">${pkg.tagLine}</p>
                                <p class="text-gray-600 leading-relaxed mb-8">${pkg.description}</p>
                                
                                <div class="mb-10">
                                    <h4 class="uppercase text-xs tracking-widest font-bold mb-4">Highlights</h4>
                                    <ul class="grid grid-cols-1 gap-2">
                                        <c:forEach var="highlight" items="${pkg.highlights}">
                                            <li class="flex items-center text-sm text-gray-600">
                                                <svg class="w-4 h-4 mr-2 text-accent-gold" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                                                <span>${highlight}</span>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>

                                <div class="flex items-center justify-between border-t border-gray-100 pt-8">
                                    <div>
                                        <span class="text-xs text-gray-400 uppercase tracking-widest block">Starting from</span>
                                        <span class="text-2xl font-bold serif">$${pkg.basePrice}</span>
                                    </div>
                                    <a href="/customise?packageId=${pkg.id}" class="bg-black text-white px-8 py-3 uppercase text-xs tracking-widest font-bold hover:bg-accent-gold transition duration-300">Customise Now</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

<jsp:include page="footer.jsp" />
