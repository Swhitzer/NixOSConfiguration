{ config, pkgs, inputs, ... }:

let
lock-false = {
  Value = false;
  Status = "locked";
};
lock-true = {
  Value = true;
  Status = "locked";
};
in
{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
	extraPolicies = {
	  DisableTelemetry = true;
	  DisableFirefoxStudies = true;
	  EnableTrackingProtection = {
	    Value= true;
	    Locked = true;
	    Cryptomining = true;
	    Fingerprinting = true;
	  };
	  DisablePocket = true;
	  DisableFirefoxAccounts = true;
	  DisableAccounts = true;
	  DisableFirefoxScreenshots = true;
	  OverrideFirstRunPage = "";
	  OverridePostUpdatePage = "";
	  DontCheckDefaultBrowser = true;
	  DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
	    DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
	    SearchBar = "unified"; # alternative: "separate"

	  /* ---- PREFERENCES ---- */
# Set preferences shared by all profiles.
	  Preferences = { 
	    "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
	    "extensions.pocket.enabled" = lock-false;
	    "extensions.screenshots.disabled" = lock-true;
	    "browser.topsites.contile.enabled" = lock-false;
	    "browser.formfill.enable" = lock-false;
	    "browser.search.suggest.enabled" = lock-false;
	    "browser.search.suggest.enabled.private" = lock-false;
	    "browser.urlbar.suggest.searches" = lock-false;
	    "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
	    "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
	    "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
	    "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
	    "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
	    "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
	    "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
	    "browser.newtabpage.activity-stream.showSponsored" = lock-false;
	    "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
	    "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
	    "toolkit.legacyUserProfileCustomizations.stylesheets" = lock-true;
	    "browser.compactmode.show" = lock-true;
	    
	    "browser.privatebrowsing.vpnpromourl" = lock-false;
	    "extensions.getAddons.showPane" = lock-false;
	    "extensions.htmlaboutaddons.recommendations.enabled" = lock-false;
	    "browser.discovery.enabled" = lock-false;
	    "browser.shell.checkDefaultBrowser" = lock-false;
	    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = lock-false;
	    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = lock-false;
	    "browser.preferences.moreFromMozilla" = lock-false;
	    "browser.tabs.tabmanager.enabled" = lock-false;
	    "browser.aboutConfig.showWarning" = lock-false;
	    "browser.aboutwelcome.enabled" = lock-false;
	  };
	};
      };

      /* ---- PROFILES ---- */
# Switch profiles via about:profiles page.
# For options that are available in Home-Manager see
# https://nix-community.github.io/home-manager/options.html#opt-programs.firefox.profiles
      profiles ={
	Swhit = {           # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
	  id = 0;               # 0 is the default profile; see also option "isDefault"
	    name = "Swhit";   # name as listed in about:profiles
	    isDefault = true;     # can be omitted; true if profile ID is 0
search.engines = {
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };

	"Duck Duck Go" = {
	  urls = [{
	    template = "https://duckduckgo.com";
	    params = [
	      { name = "query"; value = "{searchTerms}";}
	    ];
	  }];
	};

      };
      search.force = true;
	    bookmarks = [
	      {
		name = "Youtube";
		tags = [ "basic" ];
		keyword = "youtube";
		url = "https://youtube.com";
	      }
	    ];

	    extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
	      ublock-origin
	      vimium
	      firefox-color
	      i-dont-care-about-cookies
	      istilldontcareaboutcookies
	      yomitan
	      privacy-badger
	      return-youtube-dislikes
	      proton-vpn
	      vue-js-devtools
	      simple-translate
	      remove-youtube-s-suggestions
	    ];

	    settings = {          # specify profile-specific preferences here; check about:config for options
	      "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
# add preferences for profile_0 here...
	    };
	  };
      };
    };
  };

  stylix.targets.firefox = {
    enable = true;
#profileNames = [ "Swhit" ];
  };
}
