<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ComercioResource\Pages;
use App\Filament\Resources\ComercioResource\RelationManagers;
use App\Models\Category;
use App\Models\City;
use App\Models\Comercio;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ComercioResource extends Resource
{
    protected static ?string $model = Comercio::class;

    protected static ?string $navigationIcon = 'heroicon-o-building-storefront';

    protected static ?string $navigationLabel = 'Comercio';

    protected static ?string $navigationGroup = 'Portal Web';

    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        $cities = City::pluck('cityName', 'id')->toArray();

        return $form
            ->schema([
                Forms\Components\Select::make('category_id')
                    ->label('Categoria')
                    ->options(function () {
                        return Category::pluck('categoryName', 'id')->toArray();
                    }),
                Forms\Components\Select::make('cities_id')
                    ->label('Cidade')
                    ->options(function () {
                        return City::pluck('cityName', 'id')->toArray();
                    }),

                Forms\Components\TextInput::make('id'),
                Forms\Components\TextInput::make('nome_empresa'),
                Forms\Components\TextInput::make('tel'),
                Forms\Components\TextInput::make('cel'),
                Forms\Components\TextInput::make('email'),
                Forms\Components\TextInput::make('endereco'),
                Forms\Components\TextInput::make('latitude'),
                Forms\Components\TextInput::make('longitude'),
                Forms\Components\TextInput::make('desc'),
                Forms\Components\TextInput::make('logoPath'),
                Forms\Components\TextInput::make('linkSite'),
                Forms\Components\TextInput::make('linkFace'),
                Forms\Components\TextInput::make('linkinstagram'),
                Forms\Components\TextInput::make('cep'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')->sortable(),
                Tables\Columns\ImageColumn::make('full_url')->label('Thumbnail')->sortable(),
                Tables\Columns\TextColumn::make('nome_empresa')->label('Nome')->sortable(),
                Tables\Columns\TextColumn::make('city.cityName')->label('Cidade')->sortable(),
                Tables\Columns\TextColumn::make('category.categoryName')->label('Categoria')->sortable(),
                Tables\Columns\TextColumn::make('plan.nome_plano')->label('Plano')->sortable(),
//                Tables\Columns\TextColumn::make('subcategory.nome_subcategory')->label('Subcategoria')->sortable(),
                Tables\Columns\TextColumn::make('created_at')->label('Cadastrado em')->sortable(),

            ])
            ->filters([
                //
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
