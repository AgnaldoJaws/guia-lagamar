<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SubCategoriResource\Pages;
use App\Filament\Resources\SubCategoriResource\RelationManagers;
use App\Models\Category;
use App\Models\City;
use App\Models\SubCategori;
use App\Models\SubCategory;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class SubCategoriResource extends Resource
{
    protected static ?string $model = SubCategory::class;

    protected static ?string $navigationIcon = 'heroicon-o-cog-8-tooth';

    protected static ?string $navigationLabel = 'Subcategoria';

    protected static ?string $navigationGroup = 'Portal Web';

    protected static ?int $navigationSort = 5;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('nome_subcategory'),
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
                Forms\Components\FileUpload::make('imagem')
                    ->label('Thumbnail')
                    ->directory('lagamar/images/subcategory')
                    ->storeFileNamesIn('imagem')
                    ->image()
                    ->imageEditor()
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id'),
                Tables\Columns\TextColumn::make('nome_subcategory')->label('Nome'),
                Tables\Columns\TextColumn::make('category.categoryName')->label('Categoria'),
                Tables\Columns\TextColumn::make('city.cityName')->label('Cidade'),
                Tables\Columns\ImageColumn::make('fullUrl')->label('Thumbnail'),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('cities_id')
                    ->label('Filtrar por cidade')
                    ->multiple()
                    ->options(function () {
                        return City::pluck('cityName', 'id')->toArray();
                    }),
                Tables\Filters\SelectFilter::make('category_id')
                    ->label('Filtrar por categoria')
                    ->multiple()
                    ->options(function () {
                        return Category::pluck('categoryName', 'id')->toArray();
                    })
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
            'index' => Pages\ListSubCategoris::route('/'),
            'create' => Pages\CreateSubCategori::route('/create'),
            'edit' => Pages\EditSubCategori::route('/{record}/edit'),
        ];
    }
}
