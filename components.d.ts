declare module '@vue/runtime-dom' {  // Vue <= 2.6.14

  export interface GlobalComponents {
    RouterLink: typeof import('vue-router')['RouterLink']
    RouterView: typeof import('vue-router')['RouterView']
  }


}
