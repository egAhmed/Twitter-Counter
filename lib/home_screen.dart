import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final key = new GlobalKey<ScaffoldState>();
  var remaining = '280';
  var typed = '0';
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: Colors.white,
        //iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: const Text(
          'Twitter character count',
          style: TextStyle(fontSize: 18.0, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5.63,
            ),
            SvgPicture.asset(
              'assets/twitter.svg',
              height: 48.75,
              width: 60,
            ), //#E6F6FE
            const SizedBox(
              height: 16.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: 181.0,
                    //height: 108.0,
                    decoration: BoxDecoration(
                      // color: Color(0xffE6F6FE),
                      border:
                          Border.all(color: const Color(0xffE6F6FE), width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 35.0,
                          alignment: Alignment.center,
                          color: const Color(0xffE6F6FE),
                          child: const Text(
                            'Characters Typed',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 73,
                          child: Text(
                            '$typed/280',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontStyle: FontStyle.normal, fontSize: 26.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: 181.0,
                    //height: 108.0,
                    decoration: BoxDecoration(
                      // color: Color(0xffE6F6FE),
                      border:
                          Border.all(color: const Color(0xffE6F6FE), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 35.0,
                          alignment: Alignment.center,
                          color: const Color(0xffE6F6FE),
                          child: const Text(
                            'Characters Remaining',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 73,
                          child: Text(
                            remaining,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontStyle: FontStyle.normal, fontSize: 26.0),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 239,
              child: TextFormField(
                controller: textController,
                obscureText: false, autofocus: false,
                //textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                //maxLength: 6,
                maxLines: null,
                //minLines: 6,
                expands: true,
                decoration: const InputDecoration(
                    //helperMaxLines: 6,
                    // hintMaxLines: 1,
                    //hintStyle: ,
                    //hintTextDirection: ,
                    hintText:
                        'Start typing! You can enter up to 280 characters',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        borderSide:
                            BorderSide(color: Color(0xffEDEDED), width: 1))),
              ),
            ),

            const SizedBox(
              height: 24,
            ),
            //Spacer(),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      const snackBar = SnackBar(
                        content: Text('Copied to Clipboard'),
                      );

                      FlutterClipboard.copy(textController.value.text).then(
                          (value) => ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar));
                    },
                    child: Container(
                      height: 40,
                      width: 95,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff00A970)),
                      child: const Text(
                        'Copy Text',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 95,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffDC0125)),
                      child: const Text(
                        'Clear Text',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  setState(() {
                    typed = textController.text.characters.length.toString();

                    var remainingCharacters =
                        280 - textController.text.characters.length;

                    remaining = remainingCharacters.toString();
                  });
                },
                child: Container(
                  height: 56,
                  //width: 95,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff03A9F4)),
                  child: const Text(
                    'Post tweet',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
