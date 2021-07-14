// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import {PasswordConfirmation} from "../utilities/registration";
import {FormInline} from "../utilities/form_inline";
import {ProgressBar} from "../utilities/progress_bar";
import SortingTable from "../utilities/sorting";


document.addEventListener('turbolinks:load',  function () {
  FormInline.setEventListeners()

  const sortByTitle = document.querySelector('.sort-by-title')

  if (sortByTitle) { sortByTitle.addEventListener('click', sort) }

  let sort = () => {
    new SortingTable("table_tests").sortRowsByTitle()
  }

  new PasswordConfirmation("password_field", "pass_conf_field")

  const progressBar = new ProgressBar("test_progress_bar")

  progressBar.updateProgress()
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()
