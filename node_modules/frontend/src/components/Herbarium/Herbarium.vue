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

async function load() {
loading.value = true;
error.value = null;

try {
  const res = await fetch("/api/herb/");
  if(!res.ok) throw new Error(`HTTP ${res.status}`);
  items.value = (await res.json()) as Herb[];
  } catch (e:any) {
  error.value = e?.message ??"Erreur inconnue";
  } finally {
  loading.value = false;
  }
}
onMounted(load);
</script>



<template>
  <div class="herbarium">
    <div v-for="h in items" :key="h.id" class="page">
      <div class="page-content">
        <img v-if="h.image1" :src="h.image1" :alt="h.name" class="card-img" />
        <h2 class="card-title">{{ h.name }}</h2>
        <p class="card-desc">{{ h.description }}</p>
        
      </div>
    </div>
  </div>
</template>

