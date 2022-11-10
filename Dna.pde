class Dna{
  char[] gens;
  float fitness = 0;
  float mutacioRate = 0.01;
  
  Dna(int target){
    gens = new char[target];
    for(int i = 0; i < gens.length; i++){
      gens[i] = (char)random(32,128);
    }
    
  }
  
  void fitness (String target) {
    int punts = 0;
    for(int i = 0; i < gens.length; i++){
      if(gens[i] == target.charAt(i)){
        punts++;
      }
    }
    fitness = float(punts)/target.length();
  }

  Dna crossover(Dna partner){
    Dna fill = new Dna(gens.length);
    int pointing = int(random(gens.length));
    for(int i = 0; i <gens.length; i++){
      if(i>pointing){
        fill.gens[i] = gens[i];
      }else{
        fill.gens[i] = partner.gens[i];
      }
    }
    return fill;
  }
  
  void mutacio(){
    for(int i = 0; i < gens.length; i++){
      if(random(1) < mutacioRate){
        gens[i] = (char) random(32,128);
      }
    }
  }
}
