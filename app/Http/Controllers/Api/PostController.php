<?php

namespace App\Http\Controllers\Api;

use App\Models\ImagePost;
use App\Models\Information;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Models\AtrativosSubs;
use App\Models\Category;
use App\Models\City;
use Illuminate\Support\Facades\Cache;



use App\Models\SubCategory;


class PostController extends Controller {

    public function index($category, $city)
    {
        // Chave do cache única para a consulta
        $cacheKey = "subcategories_{$category}_{$city}";

        // Verifica se o resultado está no cache
        $data = Cache::remember($cacheKey, now()->addMinutes(10), function () use ($category, $city) {
            // Consulta as subcategoriasf
            $sub_categories = SubCategory::where('cities_id', $city)
                ->where('category_id', $category)
                ->orderBy('nome_subcategory', 'asc')
                ->get(['id', 'nome_subcategory','imagem']); // Seleciona apenas os campos necessários

            // Formata os dados das subcategorias
            $formattedData = $sub_categories->map(function ($subCategory) {
                return [
                    'id' => $subCategory->id,
                    'nome_subcategory' => $subCategory->nome_subcategory,
                    'path' => $subCategory->full_url,
                ];
            });

            // Consulta a cidade e a categoria
            $cityName = City::where('id', $city)->pluck('cityName')->first();
            $categoryName = Category::where('id', $category)->pluck('categoryName')->first();

            return [
                'subcategories' => $formattedData,
                'city' => $cityName,
                'category' => $categoryName,
                'cityId' => $city,
            ];
        });

        return response()->json($data);
    }

    public function goToAtrativos($subCategory_id, $cities_id)
    {
        $cacheKey = "goToAtrativos_{$subCategory_id}_{$cities_id}";

        return Cache::remember($cacheKey, now()->addDay(), function () use ($subCategory_id, $cities_id) {
            // Obter nome da subcategoria
            $subCategory = SubCategory::select('nome_subcategory')->where('id', $subCategory_id)->first();

            // Obter nome da cidade
            $city = City::select('id', 'cityName')->where('id', $cities_id)->first()->cityName;

            // Contar o número de registros relacionados
            $count = AtrativosSubs::where('subcat_id', $subCategory_id)->where('cities_id', $cities_id)->count();

            // Obter IDs dos atrativos relacionados
            $atrativos_sub = AtrativosSubs::where('subcat_id', $subCategory_id)->where('cities_id', $cities_id)->pluck('atrativo_id');

            // Buscar informações detalhadas dos atrativos
            $posts = Information::whereIn('id', $atrativos_sub)->orderBy('title', 'asc')->get();

            // Preparar dados para retorno
            $data = [];
            foreach ($posts as $key => $value) {
                $data[$key]['id'] = $value->id;
                $data[$key]['title'] = $value->title;
                $data[$key]['location'] = $value->location;
                $data[$key]['logoPath'] = $value->full_url; // Certifique-se de ter o atributo correto para a URL completa da imagem
                $data[$key]['desc'] = $value->desc;
                $data[$key]['content'] = $value->content;
                $data[$key]['forma_acesso'] = $value->forma_acesso;
            }

            // Agrupar todos os dados em um array final
            $result = [
                'data' => $data,
                'nome_subcategory' => $subCategory->nome_subcategory,
                'city' => $city,
                'cityId' => $cities_id,
                'count' => $count
            ];

            return $result;
        });
    }

    public function goToAtrativosByCidade( $cities_id)
    {

        $cacheKey = "goToAtrativosByCidade_{$cities_id}";

        return Cache::remember($cacheKey, now()->addDay(), function () use ($cities_id) {
            // Obter nome da subcategoria
            $subCategory = SubCategory::select('nome_subcategory')->where('cities_id', $cities_id)->first();

            // Obter nome da cidade
            $city = City::select('id', 'cityName')->where('id', $cities_id)->first()->cityName;

            // Contar o número de registros relacionados
            $count = AtrativosSubs::where('cities_id', $cities_id)->count();

            // Obter IDs dos atrativos relacionados
            $atrativos_sub = AtrativosSubs::where('cities_id', $cities_id)->pluck('atrativo_id');

            // Buscar informações detalhadas dos atrativos
            $posts = Information::whereIn('id', $atrativos_sub)->orderBy('title', 'asc')->get();

            // Preparar dados para retorno
            $data = [];
            foreach ($posts as $key => $value) {
                $data[$key]['id'] = $value->id;
                $data[$key]['title'] = $value->title;
                $data[$key]['logoPath'] = $value->full_url; // Certifique-se de ter o atributo correto para a URL completa da imagem
                $data[$key]['desc'] = $value->desc;
                $data[$key]['content'] = $value->content;
                $data[$key]['forma_acesso'] = $value->forma_acesso;
            }

            // Agrupar todos os dados em um array final
            $result = [
                'data' => $data,
                'city' => $city,
                'cityId' => $cities_id,
                'count' => $count
            ];

            return $result;
        });
    }


    public function getAtractives($subCategory_id, $cities_id,$user_id)
    {

        $subCategory = SubCategory::select('nome_subcategory')->where('id',$subCategory_id)->first();
        $city = City::select('id','cityName')->where('id',$cities_id)->first();
        $city = $city->cityName;
        $count = $atrativos_sub = AtrativosSubs::where('subcat_id',$subCategory_id)->where('cities_id', $cities_id)->count();


        $atrativos_sub = AtrativosSubs::where('subcat_id',$subCategory_id)->where('cities_id', $cities_id)->get();

        foreach ($atrativos_sub as $key => $value)
        {
            $res[] = $value->atrativo_id;

        }

        $posts = Information::whereIn('id' , $res)->where('user_id',$user_id)->orderBy('title', 'asc')->get();

        foreach ($posts as $key => $value)
        {

            $data[$key]['id'] = $value->id;
            $data[$key]['title'] = $value->title;
            $data[$key]['location'] = $value->location;
            $data[$key]['logoPath'] = $value->full_url;
            $data[$key]['desc'] = $value->desc;
            $data[$key]['content'] = $value->content;

        }


        $data = ['data' => $data, 'nome_subcategory' => $subCategory->nome_subcategory, 'city'=>$city, 'cityId'=>$cities_id, 'count' => $count];

        return $data;
    }

    public function show($post_id)
    {
        // Definimos um tempo de cache em minutos, aqui está configurado para 60 minutos
        $cacheTime = 60;

        // Verificamos se os dados já estão em cache, se não estiverem, executamos a consulta e armazenamos no cache
        $data = Cache::remember("post_{$post_id}", $cacheTime, function () use ($post_id) {
            $arrayCompany = [];
            $id = [];

            $posts = Information::where('id', $post_id)->get();

            foreach ($posts as $value) {
                $companies = [
                    'id' => $value->id,
                    'title' => $value->title,
                    'desc' => $value->desc,
                    'content' => $value->content,
                    'full_url' => $value->full_url,
                    'references' => $value->references,
                    'location' => $value->location,
                    'lat' => $value->lat,
                    'long' => $value->long,
                    'forma_acesso' => $value->forma_acesso,
                    'cities_id' => $value->cities_id,
                    'subCategory_id' => $value->subCategory_id,
                ];

//                $arrayCompany[] = $companies;
//                $id[] = $companies['id'];
            }

            $images = ImagePost::where('informacaos_id', $post_id)->get();

            $img = $images->count() > 0 ? $images->pluck('full_url_img')->toArray() : [];

            // Montamos o objeto para o front
            return [
                    'post' => $companies,
                    'imgs' => $img,
            ];
        });

        return $data;
    }

    public function getSubCategories($city)
    {
        $categories = [1,3,11];
        $SubCategories = SubCategory::whereIn('category_id', $categories)
            ->where('cities_id', $city)
            ->get();

        foreach($SubCategories as $key => $value )
        {
            $SubCategory[$key]['id'] = $value->id;
            $SubCategory[$key]['nome_subcategory'] = $value->nome_subcategory;

        }
        return ['data' => $SubCategory];


    }

    public function getAllSubcategories($cities_id, $cat_id )
    {

        try{


            $SubCategories = SubCategory::where('cities_id',$cities_id)->where('category_id',$cat_id)->get();

            if ($SubCategories->isEmpty() == true)
            {
                $SubCategory = null;
            }

            foreach($SubCategories as $key => $value )
            {
                $SubCategory[$key]['id'] = $value->id;
                $SubCategory[$key]['nome_subcategory'] = $value->nome_subcategory;

            }
            return ['data' => $SubCategory];

        }catch (\Exception $e){

            return $e->getMessage();
        }

    }

    public function getContentBySub($sub_id)
    {
        // Define uma chave única para o cache baseada no ID da subcategoria
        $cacheKey = "content_by_sub_{$sub_id}";

        // Tenta recuperar os dados do cache
        $atrativos = Cache::remember($cacheKey, now()->addMinutes(30), function () use ($sub_id) {
            return AtrativosSubs::with('atrativos:id,title')
                ->where('subcat_id', $sub_id)
                ->get()
                ->pluck('atrativos') // Obtém apenas os dados da relação
                ->flatten()
                ->map(function ($atrativo) {
                    return [
                        'id' => $atrativo['id'],
                        'title' => $atrativo['title'],
                    ];
                })
                ->toArray();
        });

        return ['data' => $atrativos];
    }

    public function contentHome(Request $request){
        $type = $request->type;

        if($type == 'experience'){

        }
    }


}
