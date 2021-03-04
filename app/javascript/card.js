// クレカのform全体をpayという変数に入れる
const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);  // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");  // クレカのform全体のidを取得しformという変数に入れる
  // トークンにデータを入れるため、そのまま送信したデータ情報を消す
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    // FormDataのオプションを使うために変数formResultを作った
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      // ()の中にnameを書くことで情報を取得する
      number: formData.get("how_to_buy[number]"),
      cvc: formData.get("how_to_buy[cvc]"),
      exp_month: formData.get("how_to_buy[exp-month]"),
      exp_year: `20${formData.get("how_to_buy[exp-year]")}`,
    };
    // カードの情報をトークン化する
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        // charge-formにトークンの情報を埋め込む
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);