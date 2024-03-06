// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rail
//= require jquery
//= require jquery-ui
//= require popper
//= require bootstrap

import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', function() {
    const courseSearchInput = document.getElementById('course-search');

    courseSearchInput.addEventListener('input', function() {
        const searchQuery = courseSearchInput.value.trim();
        Turbo.fetch('/search_courses', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({ query: searchQuery })
        })
            .then(response => response.text())
            .then(html => {
                const courseList = document.querySelector('.course-list');
                courseList.innerHTML = html;
            })
            .catch(error => {
                console.error(error);
            });
    });
});
