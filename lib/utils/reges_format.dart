class REGEXPFormat {

        bool hasEmailValidate(String email){
         bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
            return emailValid;
      }
        bool hasWebsiteValidate(String site){
          bool emailValid = RegExp(r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?").hasMatch(site);
          return emailValid;
        }


}