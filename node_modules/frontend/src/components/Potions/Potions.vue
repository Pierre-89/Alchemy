<script setup lang="ts">
import { ref, onMounted } from "vue";
import "./Potions.css";

interface Recipe {
  recipe_id: number;
  potion_id: number;
  potion_name: string;
  potion_description: string;
  potion_image: string;
  ingredient1_id: number;
  ingredient1_name: string;
  ingredient2_id: number;
  ingredient2_name: string;
}

const items = ref<Recipes[]>([]);
const loading = ref(true);
const error = ref<string | null>(null);

async function load() {
loading.value = true;
error.value = null;

try {
  const res = await fetch("/api/recipes/");
  if(!res.ok) throw new Error(`HTTP ${res.status}`);
  items.value = (await res.json()) as Recipes[];
  } catch (e:any) {
  error.value = e?.message ??"Erreur inconnue";
  } finally {
  loading.value = false;
  }
}
onMounted(load);
</script>



<template>
  <div class="potions">
    <div v-for="h in items" :key="h.recipe_id" class="page">
      <div class="page-content">
        <img v-if="h.potion_image" :src="h.potion_image" :alt="h.potion_name" class="card-img" />
        <h2 class="card-title">{{ h.potion_name }}</h2>
        <p class="card-desc">{{ h.potion_description }}</p>
        
        <ul>
          <li>{{ h.ingredient1_name }}</li>
          <li>{{ h.ingredient2_name }}</li>
        </ul>
      </div>
    </div>
  </div>
</template>


