<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ImagesCompaniesResource\Pages;
use App\Filament\Resources\ImagesCompaniesResource\RelationManagers;
use App\Models\Comercio;
use App\Models\ImagesCompanies;
use App\Models\Imagescompany;
use App\Models\Information;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ImagesCompaniesResource extends Resource
{
    protected static ?string $model = Imagescompany::class;

    protected static ?string $navigationGroup = 'Galeria';

    protected static ?string $navigationLabel = 'Comercio';

    protected static ?string $navigationIcon = 'heroicon-m-photo';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\FileUpload::make('files')
                    ->multiple()
                    ->label('Thumbnail')
                    ->directory('lagamar/comercio/imagens')
                    ->storeFileNamesIn('imagem')
                    ->imageEditor(),

                Forms\Components\Select::make('companie')
                    ->label('Comercio')
                    ->searchable()
                    ->options(function () {
                        return Comercio::pluck('nome_empresa', 'id')->toArray();
                    }),

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('comercio.nome_empresa')->label('Comercio')->sortable(),
                Tables\Columns\ImageColumn::make('full_url')->label('Galeria')->sortable(),
                Tables\Columns\TextColumn::make('created_at')->label('Publicado em:')->sortable(),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('companies_id')
                    ->label('Filtrar por Comercio')
                    ->multiple()
                    ->searchable()
                    ->options(function () {
                        return Comercio::pluck('nome_empresa', 'id')->toArray();
                    }),

            ])
            ->actions([
                Tables\Actions\EditAction::make(),
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
            'index' => Pages\ListImagesCompanies::route('/'),
            'create' => Pages\CreateImagesCompanies::route('/create'),
            'edit' => Pages\EditImagesCompanies::route('/{record}/edit'),
        ];
    }

    public static function canEdit(Model $record): bool
    {
        return false;
    }
}
