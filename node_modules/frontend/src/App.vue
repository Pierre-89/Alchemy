<script setup lang="ts">
import { ref } from "vue"
import Herbarium from "./components/Herbarium/Herbarium.vue"
import Potions from "./components/Potions/Potions.vue"

const showPotions = ref(false)
function displayPotions() {
  showPotions.value = !showPotions.value
}
const showHerbarium = ref(false)
function displayHerb() {
  showHerbarium.value = !showHerbarium.value
}
</script>

<template>
  <button @click="displayHerb">Herbarium</button>
  <button @click="displayPotions">Potions</button>
  <Herbarium v-if="showHerbarium" />
  <Potions v-if="showPotions" />
</template>

