<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ComercioResource\Pages;
use App\Filament\Resources\ComercioResource\RelationManagers;
use App\Models\Category;
use App\Models\City;
use App\Models\Comercio;
use App\Models\Plan;
use App\Models\SubCategory;
use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;
use Filament\Forms\Get;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\HtmlString;
use Filament\Tables\Filters\Filter;

class ComercioResource extends Resource
{
    protected static ?string $model = Comercio::class;

    protected static ?string $navigationIcon = 'heroicon-o-building-storefront';

    protected static ?string $navigationLabel = 'Comercio';

    protected static ?string $navigationGroup = 'Portal Web';


    public static function form(Form $form): Form
    {
        $cities = City::pluck('cityName', 'id')->toArray();

        return $form

            ->schema([
                Forms\Components\TextInput::make('nome_empresa')->required(),

                Forms\Components\FileUpload::make('logoPath')
                    ->multiple()
                    ->label('Thumbnail')
                    ->directory('lagamar/comercio/logo')
                    ->storeFileNamesIn('imagem')
                    ->imageEditor(),


                Forms\Components\Select::make('cities_id')
                    ->placeholder('Select')
                    ->label('Cidade')
                    ->options(function () use ($cities) {
                        return $cities;
                    })
                    ->live()
                    ->required(),

                Forms\Components\Select::make('plano_id')
                    ->label('Plano')
                    ->options(function () {
                        return Plan::pluck('nome_plano', 'id')->toArray();
                    })
                    ->required(),


                Select::make('category_id')
                    ->placeholder('Select')
                    ->multiple()
                    ->label('Subcategoria')
                    ->options(fn (Get $get): array => SubCategory::query()
                        ->where('cities_id', $get('cities_id'))
                        ->pluck('nome_subcategory', 'id')->toArray()),


                Forms\Components\TextInput::make('tel')->required(),
                Forms\Components\TextInput::make('cel')->required(),
                Forms\Components\TextInput::make('email')->required(),
                Forms\Components\TextInput::make('endereco')->required(),
                Forms\Components\TextInput::make('latitude')->required(),
                Forms\Components\TextInput::make('longitude')->required(),
                Forms\Components\TextInput::make('desc')->required(),
                Forms\Components\TextInput::make('logoPath')->hidden(),
                Forms\Components\TextInput::make('linkSite')->required(),
                Forms\Components\TextInput::make('linkFace')->required(),
                Forms\Components\TextInput::make('linkinstagram')->required(),
                Forms\Components\TextInput::make('cep')->required(),
                Forms\Components\Toggle::make('status')
                    ->label('Status')
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {

        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('full_url')->label('Thumbnail')->sortable(),
                Tables\Columns\TextColumn::make('nome_empresa')->label('Nome')->sortable(),
                Tables\Columns\TextColumn::make('city.cityName')->label('Cidade')->sortable(),

                Tables\Columns\TextColumn::make('comercio_subs.subCategory.category.categoryName')->label('Categorias')
                    ->formatStateUsing(function ($record) {
                        $category = $record->comercio_subs->map(function ($atrativoSub) {
                            return $atrativoSub->subCategory->category->categoryName;
                        })->implode('<br>');
                        return new HtmlString(nl2br($category));
                    }),

                Tables\Columns\TextColumn::make('comercio_subs.subCategory.nome_subcategory')->label('Subcategorias')
                    ->formatStateUsing(function ($record) {
                        $subcategories = $record->comercio_subs->map(function ($atrativoSub) {
                            return $atrativoSub->subCategory->nome_subcategory;
                        })->implode('<br>');

                        return new HtmlString(nl2br($subcategories));
                    }),

                Tables\Columns\TextColumn::make('plan.nome_plano')->label('Plano')->sortable(),
                Tables\Columns\TextColumn::make('status')
                    ->label('Status')
                    ->sortable()
                    ->formatStateUsing(function ($state) {
                        return $state ? 'Ativo' : 'Inativo';
                    }),
                Tables\Columns\TextColumn::make('created_at')->label('Cadastrado em')->sortable(),

            ])
            ->filters([
                Filter::make('name')
                    ->form([
                        Forms\Components\TextInput::make('name')->label('Nome'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query->when(
                            $data['name'],
                            fn (Builder $query, $name): Builder => $query->where('nome_empresa', 'like', "%{$name}%")
                        );
                    }),
            ])
            ->defaultSort('id', 'desc')
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
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
            'index' => Pages\ListComercios::route('/'),
            'create' => Pages\CreateComercio::route('/create'),
            'edit' => Pages\EditComercio::route('/{record}/edit'),
        ];
    }
}
