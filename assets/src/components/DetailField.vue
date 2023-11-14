<template>
  <panel-item :field="field">
    <template slot="value">
      <div class="fr-view" v-html="field.value"/>
    </template>
  </panel-item>
</template>

<script>

export default {
  props: {
    resourceName: {
      type: String,
      required: true
    },
    resourceId: {
      type: [ String, Number ],
      required: true
    },
    resource: {
      type: Object,
      required: true
    },
    field: {
      type: Object,
      required: true
    }
  }
};
</script>
