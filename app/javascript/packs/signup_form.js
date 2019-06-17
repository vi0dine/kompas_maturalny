import Vue from "vue/dist/vue.esm";

document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    el: "#signup-form",
    data: {
      formIndex: 0
    },
    methods: {
      nextForm() {
        if (this.formIndex < 3) {
          this.formIndex += 1;
        } else {
          // Disabled button
        }
      },
      prevForm() {
        if (this.formIndex > 0) {
          this.formIndex -= 1;
        } else {
          // Disabled button
        }
      },
      addExam(e) {
        console.log(e);
        let regexp, time;
        time = new Date().getTime();
        regexp = new RegExp(e.target.dataset["id"], "g");
        $(this.$refs.exams).append(
          e.target.dataset["fields"].replace(regexp, time)
        );
        return e.preventDefault();
      }
    }
  });
});