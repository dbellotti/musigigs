var menuArrayStart = [
		['MusiPickle', 'http://www.musipickle.com/', null],
		['Help', 'http://gigs.musipickle.com/help.html', null],
		['Artists Start >>', 'http://gigs.musipickle.com/', 'menuArrayArtists'],
		['Venues Start >>', 'http://venues.musipickle.com/', 'menuArrayVenues']
	];

var menuArrayArtists = [
		['Gigs >>', 'http://gigs.musipickle.com/', 'menuArrayArtistsGigs'],
		['View Profile', 'http://www.musipickle.com/', null],
		['Artist Settings', 'http://www.musipickle.com/', null],
		['Manage Contacts', 'http://www.musipickle.com/', null],
		['Calendar', 'http://www.musipickle.com/', null]
	];

var menuArrayArtistsGigs = [
		['Search Gigs', 'http://gigs.musipickle.com/search.html', null],
		['Manage Gigs', 'http://www.musipickle.com/', null],
		['New Gig', 'http://gigs.musipickle.com/', null],
		['Remove Gig >>', 'http://gigs.musipickle.com/search.html', 'gigs']
	];				
							
var gigs  = [
		['5-16-09 Santa Barbara', 'http://gigs.musipickle.com/search.html', null],
		['5-19-09 Isla Vista', 'http://gigs.musipickle.com/', null],
		['5-23-09 Goleta', 'http://gigs.musipickle.com/search.html', null],
		['5-30-09 Santa Barbara', 'http://www.musipickle.com/', null]
	];				

var menuArrayVenues = [
		['Gigs >>', 'http://gigs.musipickle.com/', 'menuArrayVenueGigs'],
		['Performers >>', 'http://gigs.musipickle.com/venues_manage.html', 'menuArrayPerformers'],
		['View Venue', 'http://gigs.musipickle.com/', null],						
		['Venue Settings', 'http://gigs.musipickle.com/', null],
		['Manage Contacts', 'http://www.musipickle.com/', null],
		['Calendar', 'http://www.musipickle.com/', null]
	];

var menuArrayVenueGigs = [
		['Search Gigs', 'http://gigs.musipickle.com/search.html', null],
		['Manage Gigs', 'http://www.musipickle.com/', null],
		['New Open Gig', 'http://gigs.musipickle.com/', null],
		['Close Gig >>', 'http://gigs.musipickle.com/search.html', 'gigs']
	];

var menuArrayPerformers = [
		['DP Fresh >', 'http://gigs.musipickle.com/search.html', 'performerMenu'],
		['Other Nature >', 'http://www.musipickle.com/', 'performerMenu'],
		['Soul Minded >', 'http://gigs.musipickle.com/', 'performerMenu'],
		['Boom Box Orchestra >', 'http://gigs.musipickle.com/search.html', 'performerMenu']
	];

var performerMenu = [
		['Messages', 'http://gigs.musipickle.com/search.html', null],
		['Rate', 'http://www.musipickle.com/', null],
		['Delete', 'http://gigs.musipickle.com/', null]
	];

var menuArrayNavigate = [
		['MusiPickle', 'http://www.musipickle.com/', null],						 
		['MusiPickle', 'http://www.musipickle.com/', null],
		['My Profile', 'http://www.musipickle.com/', null],
		['About Us', 'http://www.musipickle.com/aboutus.html', null],
		['Downloads', 'http://download.musipickle.com/', null]
	];