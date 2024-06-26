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
                    ->placeholder('Select')
                    ->label('Cidade')
                    ->options(function () use ($cities) {
                        return $cities;
                    })
                    ->live()
                    ->required(),


                Select::make('category_id')
                    ->placeholder('Select')
                    ->multiple()
                    ->label('Subcategoria')
                    ->options(fn (Get $get): array => SubCategory::query()
                        ->where('cities_id', $get('cities_id'))
                        ->pluck('nome_subcategory', 'id')->toArray()),


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
