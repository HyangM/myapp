		var isFolded = true;
        var objSpan = document.getElementById('slide');
        var objNav = document.getElementById('slide-menu');
        var objCurtain = document.getElementById('curtain');

        //이벤트 발생 시 방법1
        // objSpan.onclick = function() {            
        // };
        //이벤트 발생 시 방법2
        objSpan.addEventListener('click',function(event) {
            //토글버튼으로 동작(ex)엘리베이터 버튼누르면 불이 들어오고 한번 더 누르면 불이꺼지는)
            if(isFolded){       //메뉴를 펼쳤을 때
                objCurtain.style.opacity = '0.5';
                objCurtain.style.zIndex = '8';
                objNav.style.transform = 'translateX(330px)'; /* x축으로 330px만큼 이동 */
                objSpan.innerText = '×';    /* 아이콘 모양을 변경 */
                // isFolded = false;
            }else{              //메뉴가 접었을 때
                objCurtain.style.opacity = '0';
                objCurtain.style.zIndex = '-8';
                objNav.style.transform = 'translateX(-330px)'; /* x축으로 330px만큼 이동 */
                objSpan.innerText = '≡';    /* 아이콘 모양을 변경 */
                // isFolded = true;
            }
            isFolded = !isFolded;       /* isFolded = false/true; 로직을 줄이기 위해서는 이렇게도 사용가능. 기존 값의 반대로 처리 */
        });