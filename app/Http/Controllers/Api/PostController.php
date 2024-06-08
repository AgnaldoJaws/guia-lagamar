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


use App\Models\SubCategory;


class PostController extends Controller {

    public function index($category, $city)
    {

        $sub_categories = SubCategory
            ::where('cities_id',$city)
            ->where('category_id',$category)
            ->orderBy('nome_subcategory', 'asc')
            ->get();


        foreach ($sub_categories as $key => $value )
        {
            $data[$key]['id'] = $value->id;
            $data[$key]['nome_subcategory'] = $value->nome_subcategory;
            $data[$key]['path'] = $value->full_url;
        }

        $city = City::where('id',$city)->get();

        foreach ($city as $key => $value)
        {
            $city = $value['cityName'];
            $cityId = $value['id'];

        }

        $category = Category::where('id',$category)->get();


        foreach ($category as $key => $value)
        {

            $category = $value['categoryName'];
        }

        return [$data,['city' => $city],['category' => $category],['cityId' => $cityId]];

    }

    public function goToAtrativos($subCategory_id, $cities_id)
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

        $posts = Information::whereIn('id' , $res)->orderBy('title', 'asc')->get();

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


        $arrayCompany = [];
        $oneCompany2 = [];

        $posts = Information::where('information.id' , $post_id)->get();


        foreach ($posts as $key => $value)
        {
            $data[$key]['id'] = $value['id'];
            $data[$key]['title'] = $value['title'];
            $data[$key]['desc'] = $value['desc'];
            $data[$key]['content'] = $value['content'];
            $data[$key]['full_url'] = $value['full_url'];
            $data[$key]['references'] = $value['references'];
            $data[$key]['location'] = $value['location'];
            $data[$key]['lat'] = $value['lat'];
            $data[$key]['long'] = $value['long'];
            $data[$key]['forma_acesso'] = $value['forma_acesso'];
            $data[$key]['cities_id'] = $value['cities_id'];
            $data[$key]['subCategory_id'] = $value['subCategory_id'];
        }


        foreach ($data as $companies){

            array_push($arrayCompany,$companies);
            $id[] = $companies['id'];

        }

        $images = ImagePost::whereIn('informacaos_id' , $id)->get();

        if($images->count() > 0)
        {
            foreach ($images as $image)
            {

                $img[] = $image['full_url_img'];

            }
        }else {

            $img = [];
        }

        //montamos o objeto para o front
        $data = [];
        $dataEmpresa = ['post'=>$arrayCompany];
        $dataImg = ['imgs' =>$img];
        $arrayData = array_merge($dataEmpresa, $dataImg);
        array_push($data,$arrayData);


        return $data;
    }

    public function getSubCategories($city)
    {

        $SubCategories = SubCategory::where('cities_id',$city)->get();

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


}
