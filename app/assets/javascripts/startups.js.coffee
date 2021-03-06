$ ->
    $body = $('body')
    bodyClass = $body.attr 'class'
    routes = ['startups-new', 'startups-edit']

    if bodyClass in ['startups-new', 'startups-edit']
        $markets = $("#startup_market_list")

        $('.upload-photo').click (event) ->
          event.preventDefault()
          $('#startup_image').click()

        $('#startup_image').change (event) ->
          if @files && @files[0]
              reader = new FileReader()

              reader.onload = (e) ->
                $('img.startuplogo').attr('src', e.target.result)

              reader.readAsDataURL(@files[0])

        $('.reset-photo').click (event) ->
          event.preventDefault()
          $('input#startup_default_logo').val('set_default')
          $('img.startuplogo').attr('src', '/assets/fallback/thumb_startup-default.png')

        $markets.tokenInput "http://api.angel.co/1/search?type=MarketTag",
          crossDomain: true,
          queryParam: "query",
          prePopulate: $markets.data('pre'),
          theme: "facebook",
          tokenLimit: 3,
          tokenValue: "name"
    else if bodyClass is 'startups-index'
        $(".startupcard").equalHeights()