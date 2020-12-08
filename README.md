
# Web Scraping using Nokogiri and Watir.

<h2 align="center">Microverse-Ruby-Capstone-Project</h2>

## Definition of Web Scraping

Web scraping, web harvesting, or web data extraction is data scraping used for extracting data from websites. Web scraping software may access the World Wide Web directly using the Hypertext Transfer Protocol, or through a web browser. While web scraping can be done manually by a software user, the term typically refers to automated processes implemented using a bot or web crawler. It is a form of copying, in which specific data is gathered and copied from the web, typically into a central local database or spreadsheet, for later retrieval or analysis.

## Techniques

Web scraping is the process of automatically mining data or collecting information from the World Wide Web. It is a field with active developments sharing a common goal with the semantic web vision, an ambitious initiative that still requires breakthroughs in text processing, semantic understanding, artificial intelligence and human-computer interactions. Current web scraping solutions range from the ad-hoc, requiring human effort, to fully automated systems that are able to convert entire web sites into structured information, with limitations.

## About Project

The purpose of this project is to develop a scraper tool to achieve web-scrapping. This was achieved using Ruby, Open-uri, Watir and Nokogiri gem. The coursera page uses the production build of React which made the project more interesting to build.

- Watir stands for Web Application Testing In Ruby It facilitates the writing of automated tests by  mimicing the behavior of a user interacting with a website.

- Nokogiri is an HTML, XML, SAX, and Reader parser. Among Nokogiri's many features is the ability to search documents via XPath or CSS3 selectors.

- The above Ruby Gems can be sources from [Ruby Gems](https://rubygems.org/)

In this project, I created a scraper which extracts free coursera courses from the [coursera.org](https://www.coursera.org/courses?query=free).

## Preview

![Screenshot from 2020-12-07 20-37-33](https://user-images.githubusercontent.com/43843720/101391176-051e6680-38d5-11eb-94ac-e110fa737c02.png)

# Built With

 - Colorize 0.8.1
 - Nokogiri 1.10.10
 - RSpec 3.10.0
 - Rubocop 1.4.2
 - Ruby 2.6.4
 - Watir 6.17.0


 # Getting Started

To get started, you should first get this file in your local machine by downloading this project or typing.
`
git clone https://github.com/IjayAbby/Web-Scraper-Ruby-Capstone-Project
`

## Prerequisites

    Ruby installed on local machine
    Text editor (preferably: VSCode, Atom, Sublime)
    Git
    Chrome Browser

## Setup

   If you have installed `Ruby` on your machine:

   1. Clone the project into your local machine using `git clone` command or download the zip file.
   2. Go into the project directory using `cd directory name` command.
   3. Do ``git checkout feature_prerequisites`` to switch to the Development branch to Feature branch.
   4. Install required gems by using  `gem install <gem name>` as listed in the [Gemfile](https://github.com/IjayAbby/Web-Scraper-Ruby-Capstone-Project/blob/feature_prerequisites/Gemfile).
   
    - gem install colorize
    - gem install nokogiri
    If it asks for permission use ``sudo gem install <gem name>``
   5. From the root directory type `ruby bin/main.rb` command.
   6. Incase you experience this error ``(Selenium::WebDriver::Error::WebDriverError)`` it is because the project uses ChromeDriver from Chrome Browser to render the page. To fix that here are the links:

   - [Installing ChromeDriver](https://github.com/SeleniumHQ/selenium/wiki/ChromeDriver) go to Quick Installation and find your preffered OS and install it then run the command on line 5.

   7. Give the project sometime to load then you will be able to see the results in your terminal. Enjoy and play around with the options either to quit or load next page.

   8. Run command `rspec <file name>`  to test the various methods in the classes.

## Running the scraper

    When you run the project it will show you free courses available on the selected page through your browser, then prompts the user to see more or stop. If you want to see more results you can press the 'y' button or 'Enter/Return' key. If you want to stop or found a job that matches you, then press the 'n' or 'q' button. The scraping process will be stopped.
    In the free courses available you can be able to see Partner, Course, Level, Enrollment to the course.

# Contributing

:handshake: Contributions, issues and feature requests are welcome!
Start by:

    1. Forking the project
    2. Cloning the project to your local machine
    3. cd into the project directory
    4. Run git checkout -b your-branch-name
    5. Make your contributions
    6. Push your branch up to your forked repository
    7. Open a Pull Request with a detailed description to the development branch of the original project for a review

Please feel free to contribute to any of these!

Feel free to check the [issues page](https://github.com/IjayAbby/Web-Scraper-Ruby-Capstone-Project/issues).

## Author

👤 **Ijay Abby**

- Github: [@IjayAbby](https://github.com/IjayAbby)
- Twitter: [@Ijay_js](https://twitter.com/Ijay_js)
- LinkedIn: [Abigael Nyangasi](https://www.linkedin.com/in/ijayabby4/)

# Show your support

Give a :star2: if you like this project! :blush:

📝 Copyright

## Acknowledgments

> - Thanks are owed to [Sarah Chamorro](https://www.linkedin.com/in/uryelah/), a FullTime TSE at Microverse.
> - [Microverse](https://www.microverse.org/)
> - [Rubocop](https://docs.rubocop.org/en/stable/)
> - [Nokogiri](https://nokogiri.org/)
> - [Watir](http://watir.com/)
> - [webdrivers](https://github.com/titusfortner/webdrivers)

# 📝 License

This project is [MIT](https://github.com/IjayAbby/Web-Scraper-Ruby-Capstone-Project/blob/development/LICENSE) licensed.

Happy coding!
