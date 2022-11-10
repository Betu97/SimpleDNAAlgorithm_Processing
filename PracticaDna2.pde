Dna[] poblacio = new Dna[100];
String target = "WordToFind";

void setup() {
  size(1340, 860);
  for(int i = 0; i < poblacio.length; i++){
    poblacio[i] = new Dna(target.length());
  }
}

void draw(){
  background(255);
  ArrayList<Dna> matingPool = new ArrayList<Dna> ();
  
  if((String.valueOf(poblacio[0].gens)).equals(target) == false){
    for(int i = 0; i < poblacio.length; i++){
      poblacio[i].fitness(target);
      int n = int(poblacio[i].fitness * 100);
      for(int j = 0; j < n; j++){
        matingPool.add(poblacio[i]);
      }
    }
    for ( int i = 0; i < poblacio.length; i++){
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      Dna parentA = matingPool.get(a);
      Dna parentB = matingPool.get(b);
      Dna fill = parentA.crossover(parentB);
      fill.mutacio();
      poblacio[i] = fill;
    }
  }
  textSize(18);
  fill(0);
  text(String.valueOf(poblacio[0].gens), 200, 200);
  
}
