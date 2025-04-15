<?php

namespace App\Http\Controllers\Api;

use App\Models\ImagePost;
use App\Models\Information;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\AtrativosSubs;
use App\Models\Category;
use App\Models\City;
use App\Models\SubCategory;

class PostController extends Controller
{
    public function index($category, $city)
    {
        $sub_categories = SubCategory::where('cities_id', $city)
            ->where('category_id', $category)
            ->orderBy('nome_subcategory', 'asc')
            ->get(['id', 'nome_subcategory', 'imagem']);

        $formattedData = $sub_categories->map(function ($subCategory) {
            return [
                'id' => $subCategory->id,
                'nome_subcategory' => $subCategory->nome_subcategory,
                'path' => $subCategory->full_url,
            ];
        });

        $cityName = City::where('id', $city)->pluck('cityName')->first();
        $categoryName = Category::where('id', $category)->pluck('categoryName')->first();

        return response()->json([
            'subcategories' => $formattedData,
            'city' => $cityName,
            'category' => $categoryName,
            'cityId' => $city,
        ]);
    }

    public function goToAtrativos($subCategory_id, $cities_id)
    {
        $subCategory = SubCategory::select('nome_subcategory')->where('id', $subCategory_id)->first();
        $city = City::select('id', 'cityName')->where('id', $cities_id)->first()->cityName;

        $count = AtrativosSubs::where('subcat_id', $subCategory_id)->where('cities_id', $cities_id)->count();
        $atrativos_sub = AtrativosSubs::where('subcat_id', $subCategory_id)->where('cities_id', $cities_id)->pluck('atrativo_id');

        $posts = Information::whereIn('id', $atrativos_sub)->orderBy('title', 'asc')->get();

        $data = $posts->map(function ($value) {
            return [
                'id' => $value->id,
                'title' => $value->title,
                'location' => $value->location,
                'logoPath' => $value->full_url,
                'desc' => $value->desc,
                'content' => $value->content,
                'forma_acesso' => $value->forma_acesso,
            ];
        });

        return [
            'data' => $data,
            'nome_subcategory' => $subCategory->nome_subcategory,
            'city' => $city,
            'cityId' => $cities_id,
            'count' => $count,
        ];
    }

    public function goToAtrativosByCidade($cities_id)
    {
        $subCategory = SubCategory::select('nome_subcategory')->where('cities_id', $cities_id)->first();
        $city = City::select('id', 'cityName')->where('id', $cities_id)->first()->cityName;
        $count = AtrativosSubs::where('cities_id', $cities_id)->count();
        $atrativos_sub = AtrativosSubs::where('cities_id', $cities_id)->pluck('atrativo_id');
        $posts = Information::whereIn('id', $atrativos_sub)->orderBy('title', 'asc')->get();

        $data = $posts->map(function ($value) {
            return [
                'id' => $value->id,
                'title' => $value->title,
                'logoPath' => $value->full_url,
                'desc' => $value->desc,
                'content' => $value->content,
                'forma_acesso' => $value->forma_acesso,
            ];
        });

        return [
            'data' => $data,
            'city' => $city,
            'cityId' => $cities_id,
            'count' => $count,
        ];
    }

    public function getAtractives($subCategory_id, $cities_id, $user_id)
    {
        $subCategory = SubCategory::select('nome_subcategory')->where('id', $subCategory_id)->first();
        $city = City::select('id', 'cityName')->where('id', $cities_id)->first()->cityName;
        $atrativos_sub = AtrativosSubs::where('subcat_id', $subCategory_id)->where('cities_id', $cities_id)->pluck('atrativo_id');

        $count = count($atrativos_sub);
        $posts = Information::whereIn('id', $atrativos_sub)->where('user_id', $user_id)->orderBy('title', 'asc')->get();

        $data = $posts->map(function ($value) {
            return [
                'id' => $value->id,
                'title' => $value->title,
                'location' => $value->location,
                'logoPath' => $value->full_url,
                'desc' => $value->desc,
                'content' => $value->content,
            ];
        });

        return [
            'data' => $data,
            'nome_subcategory' => $subCategory->nome_subcategory,
            'city' => $city,
            'cityId' => $cities_id,
            'count' => $count,
        ];
    }

    public function show($post_id)
    {
        $value = Information::where('id', $post_id)->first();

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

        $images = ImagePost::where('informacaos_id', $post_id)->pluck('full_url_img')->toArray();

        return [
            'post' => $companies,
            'imgs' => $images,
        ];
    }

    public function getSubCategories($city)
    {
        $categories = [1, 3, 11];
        $SubCategories = SubCategory::whereIn('category_id', $categories)
            ->where('cities_id', $city)
            ->get();

        $SubCategory = $SubCategories->map(function ($value) {
            return [
                'id' => $value->id,
                'title' => $value->nome_subcategory,
            ];
        });

        return ['data' => $SubCategory];
    }

    public function getAllSubcategories($cities_id, $cat_id)
    {
        try {
            $SubCategories = SubCategory::where('cities_id', $cities_id)->where('category_id', $cat_id)->get();

            $SubCategory = $SubCategories->map(function ($value) {
                return [
                    'id' => $value->id,
                    'title' => $value->nome_subcategory,
                ];
            });

            return ['data' => $SubCategory];
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function getContentBySub($sub_id, $city_id)
    {
        $atrativos = AtrativosSubs::with('atrativos:id,title')
            ->where('subcat_id', $sub_id)
            ->where('cities_id', $city_id)
            ->get()
            ->pluck('atrativos')
            ->flatten()
            ->map(function ($atrativo) {
                return [
                    'id' => $atrativo['id'],
                    'title' => $atrativo['title'],
                ];
            })
            ->toArray();

        return ['data' => $atrativos];
    }

    public function contentHome(Request $request)
    {
        $type = $request->type;

        $sub_id = $type === 'experience' ? [72, 74] : ($type === 'recommend' ? [73, 74] : []);
        $atrativos = AtrativosSubs::with('atrativos', 'atrativos.city')
            ->whereIn('subcat_id', $sub_id)
            ->get()
            ->pluck('atrativos')
            ->flatten()
            ->map(function ($atrativo) {
                return [
                    'id' => $atrativo['id'],
                    'title' => $atrativo['title'],
                    'desc' => $atrativo['desc'],
                    'location' => $atrativo['location'],
                    'cityName' => $atrativo['city']['cityName'],
                ];
            })
            ->toArray();

        return ['data' => $atrativos];
    }
}
