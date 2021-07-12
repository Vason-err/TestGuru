// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../utilities/sorting"
import {SortingTable} from "../utilities/sorting";
import {PasswordConfirmation} from "../utilities/registration";
import {FormInline} from "../utilities/form_inline";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load',  function () {
  new SortingTable("admin_tests")
  new SortingTable("user_tests")
  new PasswordConfirmation("password_field", "pass_conf_field")
  const SelectedTests = document.querySelectorAll('.form-inline-link')

  SelectedTests.forEach(function (test) {
    new FormInline(test)
  })
})
