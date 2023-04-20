<!-- File: templates/Articles/index.php -->

<h1>Articulos</h1>
<?= $this->Html->link('Agregar Articulo', ['action' => 'add']) ?>
<table>
    <tr>
        <th>Título</th>
        <th>Creado</th>
    </tr>

    <!-- Here is where we iterate through our $articles query object, printing out article info -->

    <?php foreach ($articles as $article): ?>
    <tr>
        <td>
            <?= $this->Html->link($article->title, ['action' => 'view', $article->slug])?>
        </td>
        <td>
            <?= $article->created->format(DATE_RFC850) ?>
        </td>
        <td>
            <?= $this->Html->link('Editar', ['action' => 'edit', $article->slug])?>
            <?= $this->Form->postLink(
                'Delete',
                ['action' => 'delete', $article->slug],
                ['confirm' => 'Estas seguro??'])
            ?>
        </td>
    </tr>
    <?php endforeach; ?>
</table>