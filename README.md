# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 \[Vet-Clinic\] ](#-vet-clinic-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Usage](#usage)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ ](#-faq-)
  - [📝 License ](#-license-)

# 📖 [Vet-Clinic] <a name="about-project"></a>

**[Vet-Clinic]** is an implementation of PostgreSQL has been implemented to create a database of animals for a veterinarian clinic, along with a set of queries to look into the data stored in the database.

**Screenshots**

**Day 1**
<a href='./screenshots/day1/queries.png' target='blank'>Task 1<a>

**Day 2**
<a href='./screenshots/day2/queries-day2-0.png' target='blank'>Task 0<a>
<a href='./screenshots/day2/queries-day2-1.png' target='blank'>Task 1<a>
<a href='./screenshots/day2/queries-day2-2.png' target='blank'>Task 2<a>
<a href='./screenshots/day2/queries-day2-3.png' target='blank'>Task 3<a>
<a href='./screenshots/day2/queries-day2-4.png' target='blank'>Task 4<a>

**Day 3**

<a href='./screenshots/day3/queries-day3-1.png' target='blank'>Task set 1<a>
  - What animals belong to Melody Pond?
  - List of all animals that are pokemon (their type is Pokemon).
  - List all owners and their animals, remember to include those that don't own any animal.
  - How many animals are there per species?
  - List all Digimon owned by Jennifer Orwell.

<a href='./screenshots/day3/queries-day3-2.png' target='blank'>Task set 2<a>
  - List all animals owned by Dean Winchester that haven't tried to escape.
  - Who owns the most animals?

**Day 4**

<a href='./screenshots/day4/queries-day4-1.png' target='blank'>Task set 1<a>
  - Who was the last animal seen by William Tatcher?
  - How many different animals did Stephanie Mendez see?
  - List all vets and their specialties, including vets with no specialties.
  - List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

<a href='./screenshots/day4/queries-day4-2.png' target='blank'>Task set 2<a>
  - What animal has the most visits to vets?
  - Who was Maisy Smith's first visit?
  - Details for most recent visit: animal information, vet information, and date of visit.
  - How many visits were with a vet that did not specialize in that animal's species?

<a href='./screenshots/day4/queries-day4-3.png' target='blank'>Task set 3<a>
  - What specialty should Maisy Smith consider getting? Look for the species she gets the most.

**Peer programming day 1**

<a href='./screenshots/peer1/queries-day1.1-1.png' target='blank'>Task set 1<a>
  - Optimize the query `SELECT COUNT(*) FROM visits where animal_id = 4;`

<a href='./screenshots/peer1/queries-day1.1-2.png' target='blank'>Task set 2<a>
  - Optimize the query `SELECT * FROM visits where vet_id = 2;`

<a href='./screenshots/peer1/queries-day1.1-3.png' target='blank'>Task set 3<a>
  - Optimize the query `SELECT * FROM owners where email = 'owner_18327@mail.com';`

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **[Commands to create a database for the vet clinic]**
- **[Commands to insert data into the database animals table]**
- **[A list of queries to find relevant records]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>


### Prerequisites

In order to run this project you need:

- Install PostgreSQL in your system
- Once installed, make sure the PostgreSQL server is running

### Usage

- Follow the commands defined on the `schema.sql` document
- Then apply the commands on `data.sql` to feed data into the db
- Lastly, use the commands on `queries.sql` to find the information requested

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

**Ayo Moses**

- GitHub: [@AyoMoses1](https://github.com/AyoMoses1)

**Javier Hernandez**

- GitHub: [@wickathou](https://github.com/wickathou)
- LinkedIn: [@javierjhm](https://linkedin.com/in/javierjhm)
- Portfolio: [End Design Co.](https://works.enddesign.co/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

> Describe 1 - 3 features you will add to the project.

- [ ] **[Add joins]**
- [ ] **[Create new tables]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Feel free to check the [issues page](https://github.com/wickathou/analytics-reporting/issues).

## ⭐️ Show your support <a name="support"></a>

If you like this project feel free to fork it or star it

## 🙏 Acknowledgments <a name="acknowledgements"></a>

Thanks to the original creator of the design [Nelson Sakwa](https://www.behance.net/sakwadesignstudio) 

Thanks Microverse, learn how to code > [Join Microverse](https://www.microverse.org/?grsf=9m3hq6)

## ❓ FAQ <a name="faq"></a>

> Add at least 2 questions new developers would ask when they decide to use your project.

- **[I get `createdb: error: connection to server on socket "/tmp/.s.PGSQL.5432" failed: FATAL:  role "joe" does not exist` error, what can I do to fix it?]**

  - [If you have correctly installed PostgreSQL, then try:
    - From terminal (bash) run `sudo su postgres`, if it works, you should see a change on your command line, with 'postgres@' appended to your terminal command line
    - Run `psql`, if it works, you should see `postgres=#` in the command line
    - Then run `create user 'your-username-here' with password 'your-password';`, it will show the message 'CREATE ROLE'
    - Lastly, apply superuser role to your new username using the command `alter user 'your-username-here' with superuser`, if it worked you should see the message 'ALTER ROLE'
    - To check that all is working correcly, run `\du` to see the list of users. You should see your newly created user in the list]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>