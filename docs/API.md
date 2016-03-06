**Show an Url**
----
  Returns json data about a single url.

* **URL**

  /api/urls/:id

* **Method:**

  `GET`

*  **URL Params**

   **Required:**

   `id=[string]`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:**

```json
  {
    "url": {
      "id": "a323b5fas8d9k12",
      "original": "http://google.com/",
      "slug": "a32b5f",
      "short": "http://shfy.ca/a32b5f"
    }
  }
```

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Url doesn't exist" }`

----


**Create an Url**
----
  Creates a new url and returns json data about the created url.

* **URL**

  /api/urls

* **Method:**

  `POST`

*  **URL Params**

   **Required:**

  None

* **Data Params**

   `original=[string]` - **required** -  Long url to shorten
   `slug=[string]` - **optional** - Custom slug

* **Success Response:**

  * **Code:** 200 <br />
    **Content:**

```json
  {
    "url": {
      "id": "a323b5fas8d9k12",
      "original": "http://google.com/",
      "slug": "custom_slug",
      "short": "http://shfy.ca/custom_slug"
    }
  }
```

* **Error Response:**

  * **Code:** 400 BAD REQUEST <br />
    **Content:** `{ error : "Original can't be blank" }`

----


**Update an Url**
----
  Updates an url and returns json data about the url.

* **URL**

  /api/urls/:id

* **Method:**

  `PUT`

*  **URL Params**

   **Required:**

   `id=[string]`

* **Data Params**

   `original=[string]` - **optional** -  New Long url to shorten
   `slug=[string]` - **optional** - Custom slug

* **Success Response:**

  * **Code:** 200 <br />
    **Content:**

```json
  {
    "url": {
      "id": "a323b5fas8d9k12",
      "original": "http://google.com/updated",
      "slug": "custom_slug",
      "short": "http://shfy.ca/custom_slug"
    }
  }
```

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Url not found" }`

----


**Delete an Url**
----
  Deletes a new url and returns json data about the deleted url.

* **URL**

  /api/urls/:id

* **Method:**

  `DELETE`

*  **URL Params**

   **Required:**

   `id=[string]`

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:**

```json
  {
    "url": {
      "id": "a323b5fas8d9k12",
      "original": "http://google.com/updated",
      "slug": "custom_slug",
      "short": "http://shfy.ca/custom_slug"
    }
  }
```

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Url not found" }`

----
