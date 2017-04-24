// Initialize your app
var myApp = new Framework7();

// Export selectors engine
var $$ = Dom7;

$$('.alert-text').on('click', function () {
    myApp.alert('Here goes alert text');
});