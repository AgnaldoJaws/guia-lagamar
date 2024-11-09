<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PostResource\Pages;
use App\Filament\Resources\PostResource\RelationManagers;
use App\Models\AtrativosSubs;
use App\Models\Category;
use App\Models\City;
use App\Models\Information;
use App\Models\Post;
use App\Models\SubCategory;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Get;
use Filament\Forms\Components\Select;
use Illuminate\Support\Facades\Log;
use App\Filament\Resources\Collection;
use Filament\Tables\Actions\Action;
use Illuminate\Support\HtmlString;
use Livewire\Features\SupportFileUploads\TemporaryUploadedFile;

class PostResource extends Resource
{

    protected static ?string $model = Information::class;

    protected static ?string $navigationIcon = 'heroicon-o-book-open';

    protected static ?string $navigationLabel = 'Atrativos';

    protected static ?string $navigationGroup = 'Portal Web';


    public static function form(Form $form): Form
    {
        $cities = City::pluck('cityName', 'id')->toArray();
        $categories = Category::pluck('categoryName', 'id')->toArray();

        return $form

            ->schema([
                Forms\Components\TextInput::make('title')->label('Título')->required(),

                Forms\Components\TextInput::make('logoPath')->hidden(),

                Forms\Components\FileUpload::make('file')
                    ->label('Thumbnail')
                    ->directory('lagamar/atrativos/logo')
                    ->storeFileNamesIn('imagem')
                    ->imageEditor(),

                Forms\Components\TextInput::make('imagem')
                    ->label('Processed Image Path')
                    ->disabled()
                    ->visibleOn(['edit', 'view']),

                Forms\Components\TextInput::make('location')->label('Localização')->required(),
                Forms\Components\TextInput::make('lat')->label('Latitude')->required(),
                Forms\Components\TextInput::make('long')->label('Longitude')->required(),

                Forms\Components\Select::make('cities_id')
                    ->placeholder('Selecione a Cidade')
                    ->label('Cidade')
                    ->options($cities)
                    ->reactive() // Reativo para atualizar as outras opções
                    ->required(),

                Forms\Components\Select::make('category_id')
                    ->placeholder('Selecione as Categorias')
                    ->label('Categoria')
                    ->options($categories)
                    ->multiple() // Permite múltiplas seleções
                    ->reactive() // Reativo para atualizar as subcategorias com base na categoria
                    ->required()
                    ->afterStateHydrated(function ($set, $get, $state) {
                        // Pega o ID do registro atual
                        $recordId = request()->route('record'); // Ou qualquer outro método para pegar o ID

                        // Consultando as subcategorias associadas ao 'atrativo_id'
                        $defaultSelections = AtrativosSubs::with('subCategory', 'subCategory.category')
                            ->where('atrativo_id', '=', $recordId)
                            ->get()
                            ->toArray();

                        // Mapear o id da categoria que vem dos dados retornados para o valor default
                        $defaultCategoryIds = array_map(function ($item) {
                            return $item['sub_category']['category_id'];
                        }, $defaultSelections);

                        // Garantir que o valor seja sempre um array (mesmo se for um único valor)
                        if (count($defaultCategoryIds) > 1) {
                            // Se houver mais de um valor, ele já está em formato de array
                            $set('category_id', $defaultCategoryIds);
                        } else {
                            // Se houver apenas um valor, transformar em array
                            $set('category_id', $defaultCategoryIds);
                        }
                    }),

                Forms\Components\Select::make('subcat_id')
                    ->placeholder('Selecione as Subcategorias')
                    ->label('Subcategoria')
                    ->options(function (Get $get) {
                        // Pega as seleções de cidade e categoria
                        $cityId = $get('cities_id');
                        $categoryId =  (array) $get('category_id'); // Garante que seja sempre um array

                        // Consultando as subcategorias com base na cidade e categoria selecionadas
                        return SubCategory::query()
                            ->where('cities_id', $cityId)
                            ->whereIn('category_id', $categoryId) // Permite múltiplas categorias
                            ->pluck('nome_subcategory', 'id')
                            ->toArray();
                    })
                    ->multiple() // Permite múltiplas seleções
                    ->reactive() // Reativo para atualizar automaticamente conforme as seleções
                    ->required()
                    ->afterStateHydrated(function ($set, $get, $state) {
                        // Pega o ID do registro atual
                        $recordId = request()->route('record'); // Ou qualquer outro método para pegar o ID

                        // Consultando as subcategorias associadas ao 'atrativo_id'
                        $defaultSelections = AtrativosSubs::with('subCategory', 'subCategory.category')
                            ->where('atrativo_id', '=', $recordId)
                            ->get()
                            ->toArray();

                        // Mapear o id das subcategorias associadas ao registro
                        $defaultSubCategoryIds = array_map(function ($item) {
                            return $item['subcat_id'];
                        }, $defaultSelections);

                        // Garantir que o valor seja sempre um array (mesmo se for um único valor)
                        if (count($defaultSubCategoryIds) > 1) {
                            // Se houver mais de um valor, ele já está em formato de array
                            $set('subcat_id', $defaultSubCategoryIds);
                        } else {
                            // Se houver apenas um valor, transformar em array
                            $set('subcat_id', $defaultSubCategoryIds);
                        }
                    }),



                Forms\Components\Textarea::make('references')->label('Referência'),
                Forms\Components\Textarea::make('forma_acesso')->label('Acesso'),
                Forms\Components\Textarea::make('desc')
                    ->columnSpan('full')
                    ->label('Descrição'),
                Forms\Components\MarkdownEditor::make('content')
                    ->label('Conteúdo')
                    ->columnSpan('full'),

            ]);
    }


    public static function table(Table $table): Table
    {
        $cities = City::pluck('cityName', 'id')->toArray();

        return $table

            ->columns([
                Tables\Columns\ImageColumn::make('full_url')->label('Thumbnail')->ring(5),
                Tables\Columns\TextColumn::make('author.name')->label('Autor')->sortable(),
                Tables\Columns\TextColumn::make('title')->label('Título')->sortable(),

                Tables\Columns\TextColumn::make('atrativoSubs.subCategory.category.categoryName')->label('Categorias')
                    ->formatStateUsing(function ($record) {
                        $category = $record->atrativoSubs->map(function ($atrativoSub) {
                            return $atrativoSub->subCategory->category->categoryName;
                        })->implode('<br>');
                        return new HtmlString(nl2br($category));
                    }),

                Tables\Columns\TextColumn::make('atrativoSubs.subCategory.nome_subcategory')->label('Subcategorias')
                    ->formatStateUsing(function ($record) {
                        $subcategories = $record->atrativoSubs->map(function ($atrativoSub) {
                            return $atrativoSub->subCategory->nome_subcategory;
                        })->implode('<br>');

                        return new HtmlString(nl2br($subcategories));
                    }),

                Tables\Columns\TextColumn::make('city.cityName')->label('Cidade')->sortable(),


            ])
            ->filters([
                Tables\Filters\SelectFilter::make('cities_id')
                    ->placeholder('Select')
                    ->label('Cidade')
                    ->options(function () use ($cities) {
                        return $cities;
                    }),

                Filter::make('name')
                    ->form([
                        Forms\Components\TextInput::make('name')->label('Nome'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query->when(
                            $data['name'],
                            fn (Builder $query, $name): Builder => $query->where('title', 'like', "%{$name}%")
                        );
                    }),

//                Tables\Filters\SelectFilter::make('categoryName')
//                    ->placeholder('Select')
//                    ->label('Subcategoria')
//                    ->options(Category::pluck('categoryName','id')->toArray()),

            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make()
            ])

            ->defaultSort('id', 'desc')
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),

                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPosts::route('/'),
            'create' => Pages\CreatePost::route('/create'),
            'edit' => Pages\EditPost::route('/{record}/edit'),
        ];
    }
}
