<!-- 
In Nuxt3 this 'default' layout is used by default for all pages.
If you want to use a different layout for a page, you can create a new one in this layouts/ folder and then use it in the page.
To use it you have to add a script tag at the top of the page and define the layout there.
Example:

<script setup>
  definePageMeta({
    layout: 'otherlayout',
  })  
</script>
-->

<template>
  <div>
    <NavBar />
    <ChatButton />
    <slot />
  </div>
</template>

<script>
  import { isLoggedIn } from '~/store';
  export default {
    setup() {
      onMounted(async () => {
        // initate the csrf token!
        // this calls django to create a csrf token as cookie
        // this token is needed for POST requests to django
        try {
          const response = await fetch('/endpoint/api/csrf')
        } catch (error) {
          console.error('Error:', error)
        }
        // check if user is logged in and set isLoggedIn in store/index.js
        // so other components can use or listen to it
        try {
          const response = await fetch('/endpoint/api/auth_status', {
            method: 'GET',
            credentials: 'include',
            headers: {
              'Content-Type': 'application/json',
            },
          });
          const data = await response.json();
          if (data.authenticated) {
            isLoggedIn.value = 1
          } else {
            isLoggedIn.value = 0
          }
        } catch (error) {
          console.error('Error:', error);
          isLoggedIn.value = 0
        }
      })
    },
  }
</script>
