
<h1 align="center">[Rails] Unosquare test  </h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.0.1-blue.svg?cacheSeconds=2592000" />
  <a href="#" target="_blank">
    <img alt="License: MIT " src="https://img.shields.io/badge/License-MIT -yellow.svg" />
  </a>
  <a href="https://twitter.com/ae_cordova" target="_blank">
    <img alt="Twitter: ae_cordova " src="https://img.shields.io/twitter/follow/ae_cordova .svg?style=social" />
  </a>
</p>

___
## Description of the project

This is a sample api to demonstrate technical proficiency on Rails. Implementing a simple api for CRUD operation on RealState

| API EndPoints:  |   |
|---|---|
| GET api/v1/real_states  | Respond with a list of all real states |
| GET api/v1/real_states/:id  | Respond with information of the real state with id = :id  |
| POST api/v1/real_states  | Create a new record for real states  |
| DELETE api/v1/real_states/:id  | Destroy a record for real state |
| PATCH api/v1/real_states/:id  | Update a real state record  |


### ⭐️ Built with
* Ruby on Rails 6

### Dev Environment Requirements:
* Ruby needs to be installed to run the code, check [here](https://www.ruby-lang.org/en/documentation/installation/) for further steps


#### Instructions for running on local environment:

1. Clone the repo

1. Navigate to the root directory

1. Run bundle install to ensure all the needed gems are installed:
    ```
    $ bundle install
    ```
1. Migrate the DB
    ```
    $ rails db:migrate
    ```
1. Run Rails Server
    ```
    $ rails server
    ```
### ⭐️ Testing with Rspec

 From the root folder 
 
 ```
 run: rspec . --format documentation

```

### ⭐️ How it works

1. Open and API testing tool such as [Postman](https://www.getpostman.com/ )

2. Send requests with the different urls as described in the endpoints section: base_url + path with the corresponding http method and parameters,
    for example: GET localhost:3000/api/v1/real_states.
    <p align="center">
      <img src="./postman_screenshots/index_body.png" style="center">
    </p>

3. Read the output in the response section of the tool(right pane in the example)

<!-- CONTRIBUTING -->
## Contributing

Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Authors

👤 **Angel Cordova** 
* Github: [@aecordova](https://github.com/https:\/\/github.com\/aecordova)  
