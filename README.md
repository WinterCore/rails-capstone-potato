# Potato Articles

<br />
<p align="center">
  <a href="https://github.com/WinterCore/rails-capstone-potato">
    <img src="rails-image.jpg" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Potato Articles</h3>

  <p align="center">
    This website is supposed to be a blog about vegetables and mainly potatos 🥔 where people can register, create articles, write comments, and give votes.
    <br />
    <br />
    <a href="https://github.com/WinterCore/rails-capstone-potato/issues">Report Bug</a>
    ·
    <a href="https://github.com/WinterCore/rails-capstone-potato/issues">Request Feature</a>
  </p>
</p>

![screenshot](./demo.gif)

## Built With

- Ruby On Rails
- Neovim
- Rubocop
- Stylelint
- Github Actions
- Postgresql

## Live Demo

[Live Demo Link](https://potato.upperdown.me)


## Usage

To have this app on your pc, you need to:
* have Ruby & Ruby on Rails installed in your computer
* [download](https://github.com/WinterCore/rails-capstone-potato/archive/development.zip) or clone this repo:
  - Clone with SSH:
  ```
    git@github.com:WinterCore/rails-capstone-potato.git
  ```
  - Clone with HTTPS
  ```
    https://github.com/WinterCore/rails-capstone-potato.git
  ```
* and open the terminal inside the repo and run the bundler
  - ```$ bundler install --without production```
* then, run rails db:migrate. This creates the database with the corresponding tables, columns and associations
  - ```$ rails db:migrate``` and ```rails db:seed```
* then, run rails s. This will start the server at localhost `http://127.0.0.1:3000/`
  - ```$ rails s```
* and finally, you can test it in the console by running
  - ```$ rails console --sandbox```

<!-- AUTOMATED TEST -->
### Automated Test

We use RSpec and Capybara to perform tests.

To run them just go to the root folder and use ```rspec```

## Authors

👤 **Hasan Kharouf**

- Github: [@wintercore](https://github.com/wintercore)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Acknowledgments

- Microverse
- [Design](https://www.behance.net/gallery/14554909/liFEsTlye-Mobile-version) by [Nelson Sakwa](https://www.behance.net/sakwadesignstudio)

## 📝 License

This project is [MIT](lic.url) licensed.