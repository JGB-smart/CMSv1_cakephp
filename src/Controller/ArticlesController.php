<?php
// src/Controller/ArticlesController.php

namespace App\Controller;
use App\Controller\AppController;

class ArticlesController extends AppController
{

    public function initialize(): void
    {
        parent::initialize();

        $this->loadComponent('Paginator');
        $this->loadComponent('Flash'); // Include the FlashComponent los cuales siver para mandar mensajes de retorno
    }


    public function index()
    {
        $this->loadComponent('Paginator');
        $articles = $this->Paginator->paginate($this->Articles->find());                  
        $this->set(compact('articles'));
        $this->Authorization->skipAuthorization();
    }

    public function view($slug = null)
    {
        $article = $this->Articles
        ->findBySlug($slug)
        ->contain('Tags')
        ->firstOrFail();
        $this->set(compact('article'));
        $this->Authorization->skipAuthorization();
    }

    public function add()                                               // Método para agregar un artículo
    {
        $article = $this->Articles->newEmptyEntity();
        $this->Authorization->authorize($article);                     // Autorizacion
        if ($this->request->is('post')) {
            $article = $this->Articles->patchEntity($article, $this->request->getData());
            // pr($article)
            // Hardcoding the user_id is temporary, and will be removed later
            // when we build authentication out.
            $article->user_id = $this->request->getAttribute('identity')->getIdentifier();

            if ($this->Articles->save($article)) {
                $this->Flash->success(__('Articulo agredado con éxito!.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('Error al agregar el articulo!'));
        }
        $tags = $this->Articles->Tags->find('list')->all();      // consulta

        $this->set('tags', $tags);           // Set tags to the view context

        $this->set('article', $article);     // Set articles to the view context
    }

    public function edit($slug)
    {
        $article = $this->Articles
        ->findBySlug($slug)
        ->contain('Tags')
        ->firstOrFail();
        $this->Authorization->authorize($article);
 
        
        if ($this->request->is(['post', 'put'])) {
            $this->Articles->patchEntity($article, $this->request->getData(), [
                // Added: Disable modification of user_id.
                'accessibleFields' => ['user_id' => false]
            ]);
            if ($this->Articles->save($article)) {
                $this->Flash->success(__('Su artículo ha sido actualizado'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('Error al actualizar'));
        }

        // Get a list of tags.
        $tags = $this->Articles->Tags->find('list')->all();

        // // Set tags to the view context
        // $this->set('tags', $tags);
        // // Set articles to the view context
        // $this->set('article', $article);

        $this->set(compact('article', 'tags'));
    }
    

    public function delete($slug)
    {
        $this->request->allowMethod(['post', 'delete']);

        $article = $this->Articles->findBySlug($slug)->firstOrFail();
        $this->Authorization->authorize($article);
        if ($this->Articles->delete($article)) {
            $this->Flash->success(__('The {0} ha sido eliminado.', $article->title));
            return $this->redirect(['action' => 'index']);
        }



    }


    public function tags(...$tags)
{
    // Use the ArticlesTable to find tagged articles.
    $articles = $this->Articles->find('tagged', [
            'tags' => $tags
        ])
        ->all();

    // Pass variables into the view template context.
    $this->set([
        'articles' => $articles,
        'tags' => $tags
    ]);

    $this->Authorization->skipAuthorization();

}



    public function saludar()
    {
        echo "Hola Juan:)";
    }   
}