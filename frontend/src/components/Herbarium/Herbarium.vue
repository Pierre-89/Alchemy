<script setup lang="ts">
import { ref, onMounted } from "vue";
import "./Herbarium.css";

interface Herb {
  id: number;
  name: string;
  description: string;
  image1: string;
  }

const items = ref<Herb[]>([]);
const loading = ref(true);
const error = ref<string | null>(null);
const currentId = ref(1);
const totalPages = ref(4);

async function load() {
loading.value = true;
error.value = null;

try {
  const res = await fetch(`/api/herb/${currentId.value}`);
  if(!res.ok) throw new Error(`HTTP ${res.status}`);
  const herb = await res.json() as Herb;
  items.value = [herb];
  } catch (e:any) {
  error.value = e?.message ??"Erreur inconnue";
  } finally {
  loading.value = false;
  }
}

function prevHerb() {
  if (currentId.value > 1) {
    currentId.value--;
    load();
  }
}

function nextherb() {
  if (currentId.value < totalPages.value) {
    currentId.value++;
    load();
  }
}
onMounted(load);
</script>



<template>
  <div v-if="items.length" class="book">
    <div class="left-page">
      <img :src="items[0].image1" alt="Image"/> 
      <div class="pagination-left">
      <button @click="prevHerb" :disabled="currentId === 1"><img src="/images/fleche-gauche.png" alt="Page précédente" class="fleche-icon" /></button>
    </div>
    </div>
    <div class="right-page"><h1>{{ items[0].name }}</h1>
    <p>{{ items[0].description}}</p>
  <div class="pagination-right">  
      <button @click="nextherb" :disabled="currentId === totalPages">→</button>
    </div>  
    
  </div>
    
      <span>{{ currentId }} / {{ totalPages }}</span>
    
  </div>
</template>

