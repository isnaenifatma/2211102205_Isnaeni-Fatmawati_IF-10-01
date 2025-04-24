// 2.1. Deklarasi Variabel
var nama = "Isnaeni Fatmawati"; // Global scope
let umur = 21;         // Block scope
const kota = "Purwokerto"; // Tidak dapat diubah

// 2.2. Tipe Data
// String
let greeting = "Hello";
// Number
let number = 42;
// Boolean
let isAdult = true;
// Array
let angkaArray = [1, 2, 3];
// Object
let person = { nama: "Isnaeni Fatmawati", umur: 21 };
// Undefined
let belumDefinisi;
// Null
let kosong = null;

// Menampilkan nama, umur, dan kota di HTML
$(document).ready(function() {
  // Menampilkan informasi pribadi di elemen HTML yang telah ditentukan
  $("#nama").text("Nama: " + nama);
  $("#umur").text("Umur: " + umur);
  $("#kota").text("Kota: " + kota);
});

// 3. Operator dan Control Flow
// 3.1. Operator
let a = 10;
let b = 5;
let result;

// Aritmatika
result = a + b; // Penjumlahan
result = a - b; // Pengurangan
result = a * b; // Perkalian
result = a / b; // Pembagian
result = a % b; // Modulo

// Perbandingan
console.log(a == b); // Sama dengan
console.log(a != b); // Tidak sama dengan
console.log(a > b);  // Lebih besar
console.log(a < b);  // Lebih kecil

// Logika
console.log(a > b && b < 10); // Logika AND
console.log(a > b || b < 10); // Logika OR
console.log(!(a > b));        // Logika NOT

// 3.2. Percabangan
if (umur > 18) {
  console.log("Dewasa");
} else {
  console.log("Anak-anak");
}

// 3.3. Perulangan
// Perulangan dengan for
for (let i = 0; i < 5; i++) {
  console.log(i);
}

// Perulangan dengan while
let j = 0;
while (j < 5) {
  console.log(j);
  j++;
}

// 4. Fungsi dan Objek
// 4.1. Fungsi
function sapa(nama) {
  return "Halo, " + nama;
}
console.log(sapa("Isnaeni Fatmawati"));

// 4.2. Objek
const mahasiswa = {
  nama: "Isnaeni Fatmawati",
  umur: 21,
  sapa: function() {
    return "Halo, saya " + this.nama;
  }
};
console.log(mahasiswa.sapa());

// 5. jQuery: Library JavaScript yang Mempermudah
// 5.1. Cara Menggunakan jQuery
// Pastikan Anda menambahkan jQuery melalui CDN di HTML Anda:
// <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

// 5.2. Seleksi Elemen dengan jQuery
$(document).ready(function() {
  $("#judul").text("Belajar jQuery");
  $(".paragraf").css("color", "blue");
});

// 5.3. Event Handling dengan jQuery
$(document).ready(function() {
  $("#tombol").click(function() {
    alert("Tombol diklik!");
  });
});

// 5.4. Efek Animasi dengan jQuery
$("#kotak").fadeOut(); // Menghilangkan elemen dengan efek fade out
$("#kotak").fadeIn();  // Menampilkan elemen dengan efek fade in

// 5.5. Efek Toggle dengan jQuery
// 5.5.1. Slide Toggle
$("#toggleButton").click(function() {
  $("#panel").slideToggle();
});

// 5.5.2. Fade Toggle
$("#fadeButton").click(function() {
  $("#box").fadeToggle();
});

// 6. AJAX dan Fetch API
// 6.1. AJAX dengan jQuery
$.get("https://jsonplaceholder.typicode.com/posts", function(data) {
  console.log(data);
});

// 6.2. Fetch API dengan Async/Await
async function getData() {
  let response = await fetch("https://jsonplaceholder.typicode.com/posts");
  let data = await response.json();
  console.log(data);
}
getData();

// 6.3. Menggunakan Fetch API untuk Mengirim Data
async function kirimData() {
  let response = await fetch("https://jsonplaceholder.typicode.com/posts", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      title: "Belajar JavaScript",
      body: "Ini contoh pengiriman data",
      userId: 1
    })
  });

  let data = await response.json();
  console.log(data);
}
kirimData();
