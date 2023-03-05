# ChatGPT-Xcode

Integrar ChatGPT en Xcode usando una Xcode Source Editor Extension que da solución a tres problemas concretos:

* **Conversión de código**. Un comando que convierta un documento JSON a una struct de Swift.
* **Code Smells**. Le pedimos a ChatGPT que trate de identificar cosas que se puedan mejorar en nuestro código fuente
* **Explicar el código**. En este último caso nos interesa saber qué es lo que hace un código determinado.

## OpenAI API Key

Para poder ejecutar los comando de la extensión se necesita un API key de OpenAI que debe guardarse en un archivo llamado `openai.environment` y que sólo contendrá la clave.

Este archivo debe estar incluido en el target de la extensión Xcode.
