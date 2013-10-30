<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jdoc:include type="head" />
<link rel="stylesheet" href="<?php echo $this->baseurl ;?>/templates/system/css/system.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ;?>/templates/system/css/general.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ;?>/templates/<?php echo $this->template ;?>/css/template.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ;?>/templates/<?php echo $this->template ;?>/css/styles/<?php echo $TemplateStyle;?>.css" type="text/css" />
<?php if($responsive) echo '<link rel="stylesheet" href="'.$this->baseurl.'/templates/'.$this->template.'/css/responsive.css" type="text/css" />';?>
<?php if($IE6Warning == 1){?>
<!--[if lte IE 6]>
<script src="<?php echo $this->baseurl ;?>/templates/<?php echo $this->template ;?>/vtemtools/warning.js"></script>
<script>window.onload=function(){e("<?php echo $this->baseurl ;?>/templates/<?php echo $this->template ;?>/vtemtools/ie6_warning/")}</script>
<![endif]-->
<?php 
}
if($webfont == 1){
echo '<script type="text/javascript">
      WebFontConfig = {
        google: { families: ["'.$googlefont.'"] }
      };
      (function() {
        var wf = document.createElement("script");
        wf.src = ("https:" == document.location.protocol ? "https" : "http") +
            "://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js";
        wf.type = "text/javascript";
        wf.async = "true";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(wf, s);
      })();
    </script>';
}
if($copyright == 1){
$vtcopyright = '<div class="vtem_copyright" style="text-align:center;padding:5px;"><a href="http://vtem.net" target="_blank"><img class="vtem_copyright_logo" src="'.$template_baseurl.'/vtemtools/widgets/images/vtem-logo.png"/></a></div>';
}else{$vtcopyright = '';}
?>
<!--[if lt IE 9]>
		<script src="<?php echo $this->baseurl ?>/media/jui/js/html5.js"></script>
<![endif]-->
    <script type="text/javascript" src="js/ytv.js"></script>
<link href="css/ytv.css" type="text/css" rel="stylesheet" />
<link href="css/demo.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">// <![CDATA[
        $(window).load(function(){
            $('#frame').ytv({
                element: null, // The element or element ID to apply the YouTube TV Player to
                user: 'remonsevastopol', // The Username of the YouTube user you want to display videos from
                playlist: 'PLXP2TjEe8q37UlXjEaKaoKWYycKMEHhzy', // The Playlist ID you would like to load
                fullscreen: false, // fullscreen
                accent: '#fff', // A CSS color string to apply to the accents of the player
                controls: true, // Show or hide youtube controls
                annotations: false, // Show or hide the annotations from the YouTube video
                autoplay: false, // autoplay
                chainVideos: true, // If true, the next video in que will automatically play after the current video has completed
                browsePlaylists: false, //  If true and the specified user has YouTube playlists, they will be accessible in the player by clicking the users Username
                events: { // he respective events will fire when key actions in the player have been called
                    videoReady: function(){},
                    stateChange: function(){}
                }
            });
        });
        // ]]></script>
</head>