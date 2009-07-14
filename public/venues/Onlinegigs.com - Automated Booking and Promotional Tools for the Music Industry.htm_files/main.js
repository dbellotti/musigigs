// Initialize WebDDM
function initWebDDM ()
{
	// Preload all images used in this menu
	WebDDM_preloadImages('../images/layout/menuBoxBody.jpg',
		'../images/layout/menuButtonDown', '../images/layout/menuButtonDown2', '../images/layout/menuButtonDown3', '../images/layout/menuButtonDown4');

	// Begin logout heading menu
	var logout = {
		'position':'relative',
		'top':0,
		'left':0,
		'width':220,
		'height':40,
		'expand_menu':'auto',

		// Begin array of items, level 0
		'items':{
			'top':0,
			'left':0,
			// Begin item 1
			1:{
				'content':'<a href="http://v41.onlinegigs.com/logout.asp"> LOGOUT</a>',
				'width':57, 'height':40, 'left':0, 'top':0,
				'class':'main',
				'class_rollover':'main_rollover3'
			},
			2:{
				'content':'<a href="http://v41.onlinegigs.com/docs/myaccount.asp"> MY ACCOUNT</a>',
				'width':82, 'height':40, 'left':59, 'top':0,
				'class':'main',
				'class_rollover':'main_rollover4'
			},
			3:{
				'content':'<a href="http://v41.onlinegigs.com/docs/start.asp">START PAGE</a>',
				'width':75, 'height':40, 'left':143, 'top':0,
				'class':'main',
				'class_rollover':'main_rollover2'
			}
			// End item 1
		}
		// End array of items
	};
	
	// Activate and build menu
	var relativeMenu = new WebDDM('logout', logout);
	
	
	
	
	//Left Side of Main Tool Bar
	var right = {
		'position':'relative',
		'top':0,
		'left':0,
		'width':270,
		'height':40,
		'expand_menu':'auto',

		// Begin array of items
		'items':{
			'top':0,
			'left':0,
			// Begin item 2
			
			1:{
				'content':'<a href="http://v41.onlinegigs.com/index.asp"> HOME</a>',
				'width':57, 'height':40, 'left':0, 'top':0,
				'class':'main',
				'class_rollover':'main_rollover3'
			},
			2:{
				'content':'<a href="http://v41.onlinegigs.com/affiliate.asp">AFFILIATES</a>',
				'width':75, 'height':40, 'left':59, 'top':0,
				'class':'main',
				'class_rollover':'main_rollover2'
			},
			3:{
				'content':'<a href="http://v41.onlinegigs.com/docs/services.asp">SERVICES</a>',
				'width':75, 'height':40, 'left':137, 'top':0,
				'class':'main',
				'class_rollover':'main_rollover2'
			},
			4:{
				'content':'<a href="http://v41.onlinegigs.com/faqs.asp">F.A.Q.s</a>',
				'width':57, 'height':40, 'left':213, 'top':0,
				'class':'main',
				'class_rollover':'main_rollover3'
			}
			// End item 2
		}
		// End array of items, level 0
	};
	
	// Activate and build menu
	var relativeMenu = new WebDDM('right', right);
}
