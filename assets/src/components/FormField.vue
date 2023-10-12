<template>
  <default-field :field="field">
    <template slot="field">
      <froala
        id="edit"
        :tag="'textarea'"
        :onManualControllerReady="initialize"
        :config="config"
        v-model="value"
        @input="handleInput"
      ></froala>
    </template>
  </default-field>
</template>

<script>
import { FormField, HandlesValidationErrors } from "ex-teal-js";

export default {
  mixins: [HandlesValidationErrors, FormField],

  data() {
    return {
      initControls: null,
    };
  },

  computed: {
    config () {
      const key = ExTeal.config.plugins.find((p) => p.uri === "froala").js_config.froala_key
      const keyOptions = { key }
      return {
        ...keyOptions,
        ...this.field.options.config,
        events: {
          'image.beforeUpload': (images) => {
            const onUploadProgress = () => {};
            const uploader = ExTeal.config.asset_upload_provider;
            const editor = this.initControls.getEditor();

            if (!this.field.options.with_assets || !uploader) {
              return false;
            }
            let selectedImage = editor.image.get();
            const imageFiles = [...images];
            imageFiles.forEach((image) => {
              window[uploader].uploadFile(image, onUploadProgress).then(({url}) => {
                editor.image.insert(url, false, null, selectedImage);
              })
            })
            return false;
          }
        }
      }
    }
  },

  methods: {
    handleInput(val) {
      this.value = val;
      this.field.value = val;
    },

    initialize(initControls) {
      this.initControls = initControls;
      this.initControls.initialize();
    },
  },
};
</script>
