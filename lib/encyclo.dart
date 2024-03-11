import 'package:flutter/material.dart';

class Encyclo extends StatefulWidget {
  const Encyclo({super.key});

  @override
  State<Encyclo> createState() => _EncycloState();
}

class _EncycloState extends State<Encyclo> {
  final List<Map<String,dynamic>> _allwords=[
    {'id':1,'name':'Rabies','details':' is a fatal viral disease that can affect any mammal, although the close relationship of dogs with humans makes canine rabies a zoonotic concern. Vaccination of dogs for rabies is commonly required by law. '},
    {'id':2,'name':'Parvovirus','details':' is a sometimes fatal gastrointestinal infection that mainly affects puppies. It occurs worldwide.'},
    {'id':3,'name':'Coronavirus','details':'is a gastrointestinal disease that is usually asymptomatic or with mild clinical signs. The signs are worse in puppies.'},
    {'id':4,'name':'Distemper','details':'is an often fatal infectious disease that mainly has respiratory and neurological signs.'},
    {'id':5,'name':'Influenza','details':'is a newly emerging infectious respiratory disease. Up to 80 percent of dogs infected will have symptoms, but the mortality rate is only 5 to 8 percent.'},
    {'id':6,'name':'Hepatitis','details':'is a sometimes fatal infectious disease of the liver.'},
    {'id':7,'name':'Herpesvirus','details':' is an infectious disease that is a common cause of death in puppies less than three weeks old.'},
    {'id':8,'name':'Lyme disease','details':'Symptoms in dogs include acute arthritis, anorexia and lethargy. There is no rash as is typically seen in humans.'},
    {'id':9,'name':'Clostridium','details':'species are a potential cause of diarrhea in dogs.'},
    {'id':10,'name':'Mites','details':'Symptoms include itching, inflammation, and black debris in the ear.'},
    {'id':11,'name':'Rage syndrome','details':'is a rare inherited seizure disorder characterized by explosive aggression and focal neurologic symptoms.'},
    {'id':12,'name':'Epilepsy','details':'The most common sign recurring generalized seizures beginning at a young adult age.'},
    {'id':13,'name':'Polyneuropathy','details':' is a collection of peripheral nerve disorders that often are breed-related in dogs.'},
    {'id':14,'name':'Cognitive dysfunction','details':' is a progressive disease occurring in older dogs, which is similar to the dementia which occurs in humans with Alzheimers disease.'},
    {'id':15,'name':'Coonhound paralysis ','details':'is a type of polyradiculoneuritis seen in Coonhounds. The cause has been related to a raccoon bite. Signs include rear leg weakness progressing rapidly to paralysis, and decreased reflexes.'},
    {'id':16,'name':'Wobbler disease','details':' (cervical instability) is a condition of the cervical vertebrae that causes an unsteady gait and weakness in dogs.'},
  ];

  List<Map<String,dynamic>> _foundWords=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _foundWords= _allwords;
  }
  void _filter(String key){
    List<Map<String,dynamic>> results=[];
    if(key.isEmpty){
      results= _allwords;
    }else{
      results= _allwords.where((element) => element['name'].toLowerCase().contains(key.toLowerCase())).toList();
    }
    setState(() {
      _foundWords= results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade500,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade400,
        title: const Text('Disease And Syndroms',style: TextStyle(
            fontStyle: FontStyle.italic,color: Colors.black,fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _filter(value),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                  labelText: 'Search...',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),
                  suffixIcon: Icon(
                    Icons.search, color: Colors.black,
                  ),
                  icon: Icon(Icons.list,color: Colors.black,)
              ),
            ),
            const SizedBox(height: 5,),
            Expanded(child: _foundWords.isNotEmpty ?
            ListView.builder(
                itemCount: _foundWords.length,
                itemBuilder: (context, index){
                  return Card(
                    key: ValueKey(_foundWords[index]['id']),
                    color: Colors.lightBlueAccent.shade400,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: const Icon(Icons.stacked_line_chart, color: Colors.black,),
                      title: Text( _foundWords[index]['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold,
                            letterSpacing: 1,color: Colors.black,fontSize: 18),),
                      subtitle: Text(_foundWords[index]['details'],
                          style: const TextStyle(fontWeight: FontWeight.bold,
                              letterSpacing: 1,color: Colors.black,fontSize: 16)
                      ),
                      trailing: Text(_allwords[index]['id'].toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold,
                              letterSpacing: 1,color: Colors.black,fontSize: 15,
                              backgroundColor: Colors.white)
                      ),
                    ),
                  );
                })  : const Center(child: Text('Nothing Found'),))

          ],
        ),
      ),
    );
  }
}