

import 'package:flutter/material.dart';
import 'package:myapp/Covid19tracker/Viewmodel/Worldstatsviewmodel.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListscreen extends StatefulWidget {
  const CountriesListscreen({ Key? key }) : super(key: key);

  @override
  _CountriesListscreenState createState() => _CountriesListscreenState();
}

class _CountriesListscreenState extends State<CountriesListscreen> {
  WorldStatesViewModel worldStatesViewModel= new WorldStatesViewModel();
    TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(title: Text('Countries List'), backgroundColor: Colors.deepPurple,),
      body: SafeArea(child: Column(
children: [
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   TextField(
   
  onChanged: (value) {
    setState(() {
      
    });
  
  } ,
  controller: searchcontroller,
  
  decoration: InputDecoration(
  
    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
  
    hintText: 'Search With Country Name',
  
    border:OutlineInputBorder( borderRadius: BorderRadius.circular(50.0) )
  
  ),
  
  
  
  
  
  ),
),
Expanded(
  child: 
FutureBuilder(
  future: worldStatesViewModel.fetchcountries(),
  builder: (context,AsyncSnapshot<List<dynamic>> snapshot){
    if(!snapshot.hasData)
    {
return ListView.builder(
                   itemCount: 8,
                   itemBuilder: (context, index){
                     return Shimmer.fromColors(
                       baseColor: Colors.grey.shade700,
                       highlightColor: Colors.grey.shade100,
                       enabled: true,
                       child: Column(
                         children: [
                           ListTile(
                             leading:  Container(height: 50 , width: 50, color: Colors.white,),
                             title:  Container(
                               width: 100,
                               height: 8.0,
                               color: Colors.white,
                             ),
                             subtitle:  Container(
                               width: double.infinity,
                               height: 8.0,
                               color: Colors.white,
                             ),
                           ),

                         ],
                       ),
                     );
                     }
);
    }
    else
    {
return ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (context,index){
String name = snapshot.data![index]['country'];

if (searchcontroller.text.isEmpty)
{
  return Column(
  children: [
ListTile(
  leading: Image(height: 50,width: 50, image: NetworkImage(snapshot.data![index]['countryInfo']['flag'])),
  title: Text(snapshot.data![index]['country']),
  subtitle: Row(
    children: [
      Text('Cases ' +snapshot.data![index]['cases'].toString()),
      SizedBox(width : 5),
           Text('Today Cases '+snapshot.data![index]['todayCases'].toString())

    ],
  ),

 )

  ],
);
}
else if(name.toLowerCase().contains(searchcontroller.text.toLowerCase()))
{
 
return Column(
  children: [
ListTile(
  leading: Image(height: 50,width: 50, image: NetworkImage(snapshot.data![index]['countryInfo']['flag'])),
  title: Text(snapshot.data![index]['country']),
  subtitle: Row(
    children: [
      Text('Cases ' +snapshot.data![index]['cases'].toString()),
      SizedBox(width: 5),
           Text('Today Cases '+snapshot.data![index]['todayCases'].toString())

    ],
  ),

 )

  ],
  
);

}
else
{
 // searchcontroller.clear();
return Container();
}

}

);
    }



}
)
)

],
        
      )
      
      
      ),

      
    );
  }
}