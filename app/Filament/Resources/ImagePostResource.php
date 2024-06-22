<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ImagePostResource\Actions\RedirectToImagePostsAction;
use App\Filament\Resources\ImagePostResource\Pages;
use App\Filament\Resources\ImagePostResource\RelationManagers;
use App\Models\Category;
use App\Models\ImagePost;
use App\Models\Information;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Http\Request;

class ImagePostResource extends Resource
{
    protected static ?string $model = ImagePost::class;

    protected static ?string $navigationIcon = 'heroicon-m-photo';

    protected static ?string $navigationLabel = 'Galeria';

    protected static ?string $navigationGroup = 'Portal Web';

    protected static ?int $navigationSort = 3;

    public static function form(Form $form): Form
    {

        return $form
            ->schema([
                Forms\Components\FileUpload::make('files')
                    ->multiple()
                    ->label('Thumbnail')
                    ->directory('lagamar/atrativos/imagens')
                    ->storeFileNamesIn('imagem')
                    ->imageEditor(),

                Forms\Components\Select::make('post')
                    ->label('Post')
                    ->searchable()
                    ->options(function () {
                        return Information::pluck('title', 'id')->toArray();
                    })->required()
            ]);


    }

    public static function table(Table $table): Table
    {

        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')->label('Id')->sortable(),
                Tables\Columns\TextColumn::make('post.title')->label('Atrativo')->sortable(),
                Tables\Columns\ImageColumn::make('full_url_img')->label('Galeria')->sortable(),
                Tables\Columns\TextColumn::make('created_at')->label('Publicado em:')->sortable(),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('informacaos_id')
                    ->label('Filtrar por Post')
                    ->multiple()
                    ->searchable()
                    ->options(function () {
                        return Information::pluck('title', 'id')->toArray();
                    })
            ])
            ->actions([
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
            'index' => Pages\ListImagePosts::route('/'),
            'create' => Pages\CreateImagePost::route('/create'),
            'edit' => Pages\EditImagePost::route('/{record}/edit'),
        ];
    }
}
