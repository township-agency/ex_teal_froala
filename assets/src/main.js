import 'froala-editor/css/froala_editor.pkgd.min.css';
import 'froala-editor/js/plugins.pkgd.min'; // all plugins (you can add plugins by one too)

import 'froala-editor/css/froala_style.min.css';
import DetailField from './components/DetailField.vue';
import FormField from './components/FormField.vue';
import VueFroala from 'vue-froala-wysiwyg';

ExTeal.booting((Vue, router) => {
  Vue.use(VueFroala);
  Vue.component('detail-froala-field', DetailField);
  Vue.component('form-froala-field', FormField);
});
