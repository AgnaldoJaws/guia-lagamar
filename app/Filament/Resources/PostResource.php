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
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
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

    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {


        $cities = City::pluck('cityName', 'id')->toArray();


        return $form

            ->schema([
                Forms\Components\TextInput::make('title')->label('Título'),


                Forms\Components\FileUpload::make('logoPath')
                    ->label('Thumbnail')
                    ->directory('lagamar/atrativos/logo')
                    ->storeFileNamesIn('imagem')
                    ->preserveFilenames()
                    ->default('http://127.0.0.1:8083/storage/lagamar/atrativos/logo/171727823918216613_1879692352285093_1983905073372761744_o.jpeg'),


                Forms\Components\TextInput::make('location')->label('Localização'),
                Forms\Components\TextInput::make('lat')->label('Latitude'),
                Forms\Components\TextInput::make('long')->label('Longitude'),

                Forms\Components\Select::make('cities_id')
                    ->placeholder('Select')
                    ->label('Cidade')
                    ->options(function () use ($cities) {
                        return $cities;
                    })
                    ->live(),


                Select::make('subcategory')
                    ->placeholder('Select')
                    ->multiple()
                    ->label('Categoria')
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

        return $table

            ->columns([
                Tables\Columns\TextColumn::make('id')->label('Id')->sortable(),
                Tables\Columns\ImageColumn::make('full_url')->label('Thumbnail')->ring(5)->sortable(),
                Tables\Columns\TextColumn::make('title')->label('Título')->sortable(),
                Tables\Columns\TextColumn::make('atrativoSubs.subCategory.nome_subcategory')->label('Subcategorias')
                    ->sortable()
                    ->formatStateUsing(function ($record) {
                        $subcategories = $record->atrativoSubs->map(function ($atrativoSub) {
                            return $atrativoSub->subCategory->nome_subcategory;
                        })->implode('<br>');

                        return new HtmlString(nl2br($subcategories));
                    }),

                Tables\Columns\TextColumn::make('atrativoSubs.subCategory.nome_subcategory')->label('Subcategorias')
                    ->sortable()
                    ->formatStateUsing(function ($record) {
                        $subcategories = $record->atrativoSubs->map(function ($atrativoSub) {
                            return $atrativoSub->subCategory->nome_subcategory;
                        })->implode('<br>');

                        return new HtmlString(nl2br($subcategories));
                    }),

                Tables\Columns\TextColumn::make('city.cityName')->label('Cidade')->sortable(),


            ])
//            ->filters([
//                Tables\Filters\SelectFilter::make('id')
//                    ->label('Filtrar por Subcategoria')
//                    ->options(function () {
//                        // Recupera todas as subcategorias únicas dos registros
//                        $subcategories = AtrativosSubs::with('nome_subcategory')->get()->flatMap(function ($atrativoSub) {
//                            return $atrativoSub->subCategory->pluck('id');
//                        })->unique();
//
//                        // Cria as opções do filtro select
//                        $options = $subcategories->mapWithKeys(function ($subcategory) {
//                            return [$subcategory => $subcategory];
//                        });
//
//                        return $options;
//                    })
//                    ->placeholder('Todas as Subcategorias'),
//            ])
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
