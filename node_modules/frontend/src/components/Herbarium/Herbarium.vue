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
    <div class="left-page" v-for= "(plante, index) in items" :key="plante.id">
      <img :src="plante.image1" :alt="plante.name" class="plante" :class="plante.slug" />
    </div>
  
    <div class="right-page"><h1>{{ items[0].name }}</h1>
    <p>{{ items[0].description}}</p>
    
      
  </div>
    <button @click="nextherb" :disabled="currentId === totalPages" class="next-page">
      </button>
      <button @click="prevHerb" :disabled="currentId === 1" class="pre-page"></button>
     
    
  </div>
</template>

