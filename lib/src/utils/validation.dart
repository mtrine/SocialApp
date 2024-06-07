class Validations{
    static String? validateName(String?value){
      if(value!.isEmpty) return 'Hãy nhập username';
      final RegExp nameExp= RegExp(r'^[A-Za-zÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪỄệỈỴÝỳỵỷỹ ]+$');
      if(!nameExp.hasMatch(value)){
        return 'Vui lòng nhập cái từ hợp lệ';
      }
    }
    static String? validateEmail(String? value ,[bool isRequired=true]){
      if(value!.isEmpty && isRequired) return "Hãy nhập email";
      final RegExp emailExp=RegExp( r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
      if(!emailExp.hasMatch(value)&& isRequired){
        return 'Email không hợp lệ';
      }
    }

    static String? validatePassword(String? value){
      if(value!.isEmpty||value.length<6){
          return 'Hãy nhập mật khẩu';
      }
    }
}