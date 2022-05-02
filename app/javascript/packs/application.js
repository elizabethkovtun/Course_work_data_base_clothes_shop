import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'jquery'
import '@popperjs/core'
import 'bootstrap'

import '../stylesheets/application'

document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()