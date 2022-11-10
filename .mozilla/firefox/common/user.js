user_pref("devtools.theme", "dark");
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("browser.bookmarks.autoExportHTML", false);
user_pref("browser.startup.page", 3);

user_pref("places.history.enabled", true);
user_pref("privacy.clearOnShutdown.history", false);
user_pref("browser.download.useDownloadDir", false);

// Allow extensions to run on official mozilla pages
user_pref("extensions.webextensions.restrictedDomains", "");

user_pref("privacy.resistFingerprinting.block_mozAddonManager", true);

user_pref("devtools.chrome.enabled", true);
user_pref("devtools.debugger.remote-enabled", true);

user_pref("tridactyl.unfixedamo_removed", true);

user_pref("dom.security.https_only_mode_ever_enabled_pbm", true);
user_pref("dom.security.https_only_mode_pbm", true);
user_pref("signon.generation.enabled", false);

user_pref("browser.link.open_newwindow", 3);

user_pref("services.sync.declinedEngines", "creditcards,passwords");

// Show search bar in <select> dropdown
user_pref("dom.forms.selectSearch", true);
