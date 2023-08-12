import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/models/category_model.dart';
import 'package:food/models/diet_model.dart';
import 'package:food/models/popular_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietModel> popularDiet = [];
  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiet = PopularDietModel.getPopularDiet();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          SizedBox(height: 40),
          _categoriesSection(),
          SizedBox(
            height: 35,
          ),
          _dietSection(),
          SizedBox(
            height: 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: popularDiet[index].boxIsSelected
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff1D1617).withOpacity(0.07),
                                offset: Offset(0, 10),
                                spreadRadius: 0,
                                blurRadius: 40)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            popularDiet[index].iconPath,
                            height: 55,
                            width: 55,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularDiet[index].name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                popularDiet[index].level +
                                    ' | ' +
                                    popularDiet[index].duration +
                                    ' | ' +
                                    popularDiet[index].calories,
                                style: TextStyle(
                                  color: Color(0xff7B6F72),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/button.svg',
                              height: 30,
                              width: 30,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  padding: EdgeInsets.only(left: 20, right: 20),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                      ),
                  itemCount: popularDiet.length),
            ],
          ),
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diets[index].iconPath),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          diets[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          diets[index].level +
                              ' | ' +
                              diets[index].duration +
                              ' | ' +
                              diets[index].calories,
                          style: TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 35,
                      width: 130,
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                              color: diets[index].viewIsSelected
                                  ? Colors.white
                                  : Color(0xffC58BF2),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          diets[index].viewIsSelected
                              ? Color(0xff9DCEFF)
                              : Colors.transparent,
                          diets[index].viewIsSelected
                              ? Color(0xff92A3FD)
                              : Colors.transparent
                        ]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
          ),
        ),
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 140,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                      Text(
                        categories[index].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ));
            },
          ),
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(10),
            hintText: 'Search Pancake...',
            hintStyle: TextStyle(
              color: Color(0xffDDDADA),
              fontSize: 14,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Food",
        style: TextStyle(
          color: Colors.pink,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: Container(
        child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      actions: [
        Container(
          child: SvgPicture.asset('assets/icons/dots.svg'),
          margin: EdgeInsets.all(20),
          width: 20,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
