<!DOCTYPE html>
<html lang="en-AU">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="app.version" content="${g.meta(name:'info.app.version')}"/>
    <meta name="app.build" content="${g.meta(name:'info.app.build')}"/>
    <meta name="description" content="${grailsApplication.config.skin?.orgNameLong?:'Atlas of Living Australia'}"/>
    <meta name="author" content="${grailsApplication.config.skin?.orgNameLong?:'Atlas of Living Australia'}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Favicon -->
    <link href="${grailsApplication.config.skin.favicon}" rel="shortcut icon"  type="image/x-icon"/>

    <title><g:layoutTitle /></title>
    <g:if test="${!grailsApplication.config.headerAndFooter.excludeBootstrapCss}">
        <link href="${grailsApplication.config.headerAndFooter.baseURL}/css/bootstrap.min.css" rel="stylesheet" media="screen,print"/>
    %{--
    <link href="${grailsApplication.config.headerAndFooter.baseURL}/css/bootstrap-theme.min.css" rel="stylesheet" media="screen,print"/>
    --}%
    </g:if>
    <g:if test="${!grailsApplication.config.headerAndFooter.excludeAlaStylesCss}">
        <link href="${grailsApplication.config.headerAndFooter.baseURL}/css/poncho.css" rel="stylesheet"
              media="screen,print"/>
    </g:if>

    <g:set var="hfVersion" value="${grailsApplication.config.getProperty('headerAndFooter.version', Integer, 1)}" />

    <g:if test="${hfVersion == 2}">
        <asset:stylesheet src="${pageProperty(name: 'meta.head-css') ?: "core"}"/>
        <asset:stylesheet src="${pageProperty(name: 'meta.head-screen-print-css') ?: "core-screen-print"}"
                          media="screen,print"/>
    </g:if>
    <g:elseif test="${hfVersion == 1}">
        <link href="${grailsApplication.config.headerAndFooter.baseURL}/css/autocomplete.min.css" rel="stylesheet" media="screen,print"/>
       %{-- <link href="${grailsApplication.config.headerAndFooter.baseURL}/css/autocomplete-extra.min.css" rel="stylesheet" media="screen,print"/>--}%
        <link href="${grailsApplication.config.headerAndFooter.baseURL}/css/font-awesome.min.css" rel="stylesheet" media="screen,print"/>
    </g:elseif>


    <plugin:isAvailable name="alaAdminPlugin"><asset:stylesheet src="ala-admin-asset.css" /></plugin:isAvailable>

    <g:if test="${hfVersion == 2}">
        <asset:javascript src="${pageProperty(name: 'meta.head-js') ?: 'head'}"/>
        <asset:javascript src="${pageProperty(name: 'meta.deferred-js') ?: 'jquery-extensions'}" />
    </g:if>
    <g:elseif test="${hfVersion == 1}">
        <script type="text/javascript"
                src="${grailsApplication.config.headerAndFooter.baseURL}/js/jquery.min.js"></script>
        <script type="text/javascript"
                src="${grailsApplication.config.headerAndFooter.baseURL}/js/jquery-migration.min.js"></script>
        <script type="text/javascript"
                src="${grailsApplication.config.headerAndFooter.baseURL}/js/autocomplete.min.js"></script>
    </g:elseif>

    <g:if test="${!grailsApplication.config.headerAndFooter.excludeApplicationJs}">
        <script type="text/javascript" src="${grailsApplication.config.headerAndFooter.baseURL}/js/application.js"
                defer></script>
    </g:if>
    <g:if test="${!grailsApplication.config.headerAndFooter.excludeBootstrapJs}">
        <script type="text/javascript"
                src="${grailsApplication.config.headerAndFooter.baseURL}/js/bootstrap.min.js"></script>
    </g:if>
    <g:layoutHead />
    <hf:head/>

</head>
<body class="${pageProperty(name:'body.class')}" id="${pageProperty(name:'body.id')}" onload="${pageProperty(name:'body.onload')}">

<g:set var="fluidLayout" value="${pageProperty(name:'meta.fluidLayout')?:grailsApplication.config.getProperty('skin.fluidLayout', Boolean, false)}"/>
<!-- Header -->
<hf:banner logoutUrl="${g.createLink(controller: "logout", action: "logout", absolute: true)}"
           ignoreCookie="${grailsApplication.config.ignoreCookie}" fluidLayout="${grailsApplication.config.fluidLayout}"/>
<!-- End header -->
<!-- Breadcrumb -->
<header>
    <div class="panel-pane pane-imagen-destacada">
        <div class="pane-content">
            <section class="jumbotron" style="background-image: url('${grailsApplication.config.breadcrumb.image}');">
                <div class="jumbotron_bar">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <ol class="breadcrumb pull-left">
                                    <g:each in="${grails.converters.JSON.parse(grailsApplication.config.breadcrumb.path)}" var="path">
                                        <li><a href="${path.url}">${raw(path.display)}</a></li>
                                    </g:each>
                                    <li class="active"><span >${raw(grailsApplication.config.breadcrumb.activoDisplay)}</span></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="jumbotron_body">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-md-8 col-md-offset-2 text-center">
                                <h1>${raw(grailsApplication.config.title)}</h1>
                                <p>${raw(grailsApplication.config.description)}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</header>
<!-- End Breadcrumb -->
<!-- Optional banner message (requires ala-admin-plugin) -->
<plugin:isAvailable name="alaAdminPlugin">
	<div class="ala-admin-message">
        <ala:systemMessage/>
	</div>
</plugin:isAvailable>
<!-- end banner message -->
<!-- Container -->
<div class="${fluidLayout ? 'container-fluid' : 'container'}" id="main">
    <g:layoutBody />
</div><!-- End container #main col -->

<hf:footer logoutUrl="${g.createLink(controller: "logout", action: "logout", absolute: true)}"
           ignoreCookie="${grailsApplication.config.ignoreCookie}"/>

<asset:deferredScripts/>

</body>
</html>
