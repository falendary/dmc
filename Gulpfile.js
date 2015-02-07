// Инициализируем плагины
var gulp    = require('gulp'), // Сообственно Gulp JS
    sass    = require('gulp-sass'), // Sass
    jade    = require('gulp-jade'), // Jade
    coffee  = require('gulp-coffee'); // coffee-script
    csso    = require('gulp-csso'), // Минификация CSS
    uglify  = require('gulp-uglify'), // Минификация JS
    concat  = require('gulp-concat'), // Склейка файлов
    connect = require('gulp-connect'); // http-сервер


// Собираем Sass
gulp.task('sass', function () {
    gulp.src('./app/assets/scss/**/*.scss')
        .pipe(sass()) // Преобразуем в css
        .on('error', console.log) // Если есть ошибки, выводим и продолжаем
        .pipe(concat('style.css')) // склеиваем полученные css в style.css
        .pipe(gulp.dest('./app/public/css')) // отправляем в версию для разработки
        .pipe(connect.reload());
});

// Собираем Jade

gulp.task('jade', function() {
    gulp.src(['./app/assets/template/**/*.jade', '!./app/assets/template/utils/*.jade'])
        .pipe(jade({
            pretty: true
        }))  // Собираем Jade только в папке assets/template/ исключая файлы из utils
        .on('error', console.log) // Если есть ошибки, выводим и продолжаем
    .pipe(gulp.dest('./app/public/')) // отправляем в версию для разработки
    .pipe(connect.reload()); // даем команду на перезагрузку страницы
}); 

// Собираем JS

gulp.task('js', function() {
    gulp.src(['./app/assets/js/**/*.coffee'])
        .pipe(coffee({bare: true}))
        .on('error', console.log)
        //.pipe(concat('script.js')) // Склеиваем JS
        .pipe(gulp.dest('./app/public/js'))
        .pipe(connect.reload()); // даем команду на перезагрузку страницы
});

// Локальный сервер для разработки

gulp.task('http-server', function() {
    connect.server(
	{
		root: 'app/public',
		livereload: true
	});
});

// Смотрим за изменениями

gulp.task('watch', function () {
	gulp.watch(['./app/assets/scss/**/*.scss'], ['sass']);
	gulp.watch(['./app/assets/template/**/*.jade'], ['jade']);  
	gulp.watch(['./app/assets/js/**/*.coffee'], ['js']);
});

// Запуск сервера разработки gulp watch

gulp.task('default', ['http-server', 'watch']);

// Запуск сборщика продакшена

gulp.task('build', function() {

    // sass

    gulp.src('./app/assets/scss/**/*.scss')
        .pipe(sass()) // преобразуем sass в css
    .pipe(concat('styles.css')) // склеиванием css
    // .pipe(csso()) // минимизируем css
    .pipe(gulp.dest('./app/build/css/')) // записываем css

    // jade

    gulp.src(['./app/assets/template/**/*.jade', '!./app/assets/template/utils/**/*.jade'])
        .pipe(jade({
            pretty: true
        }))
        .pipe(gulp.dest('./app/build/'))

    // js

    gulp.src(['./app/assets/js/**/*.coffee', './app/assets/js/libs/**/*.js'])
        .pipe(coffee({bare: true}))
        // .pipe(uglify())
        .pipe(gulp.dest('./app/build/js'));
});