//NY NØDVENDIG VIDEN:
//1.) random
//2.) array's
//3.) funktioner med og uden returtype
//4.) funktioner med og uden input

//OPGAVE: lav arrays, variabler til at gemme terningkast og fordeling af terningekast
int[] sum = new int[6];
IntList historie = new IntList();

void setup() {
  size(600, 800);
  clear();
  text("TRYK på 'k' FOR AT KASTE", 50, 50);
}

void draw() {
}

void keyPressed() {
  clear();
  text("TRYK på 'k' FOR AT KASTE / OG 's' FOR AT SLETTE", 50, 50);

  if (key=='k') {
    //OPGAVE:  lav manglende funktion der laver 'terningekast'. 
    int kast = lavTerningeKast(1, 6);
    sum[kast-1] += 1;
    historie.append(kast);
    text("DIT KAST BLEV:" + kast, 50, 75);
  }

  if (key == 's') {
    fjernSidsteKast();
  }
  
  //OPGAVE: lav manglende funktion til at fordelingen af terningekast. 
  tegnFordeling();
  //OPGAVE: lav manglende funktion der kan udskrive alle terningekast som tekst ...
  udskrivKast();
}

int lavTerningeKast(int min, int max){
    return int(random(min,max+0.999));
}

void fjernSidsteKast(){
  if(historie.size() > 0){
    int sidsteplads = historie.size()-1;
    int sidstekast = historie.get(sidsteplads);
    sum[sidstekast-1] -= 1;
    historie.remove(sidsteplads);
  }
}

void tegnFordeling(){
  for(int i=0; i<sum.length; i++){
    int w = 50;
    int h = 10*sum[i];
    
    rect(w*i, height-15-h, w, h);
    text(i+1, w*(i+0.5), height-3);
    text(sum[i] + " stk.", w*(i+0.3), height-h-15);
  } 
}

void udskrivKast(){
  int i = 0;
  for(int slag : historie){
    text("Kast nr. " + (i+1) + " = " + slag, width - 100, 50+15*i);
    i += 1;
  } 
}
