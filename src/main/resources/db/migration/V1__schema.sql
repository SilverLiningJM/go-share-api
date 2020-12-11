CREATE TABLE IF NOT EXISTS users (
    id SERIAL,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    email VARCHAR(128) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS organisations (
    id SERIAL,
    name VARCHAR(128) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS centres (
    id SERIAL,
    organisation_id INTEGER NOT NULL,
    address_1 VARCHAR(128) NOT NULL,
    address_2 VARCHAR(128),
    city VARCHAR(50) NOT NULL,
    state_parish VARCHAR(50) NOT NULL,
    country VARCHAR(5) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (organisation_id) REFERENCES organisations(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS centre_contact (
    centre_id INTEGER,
    phone VARCHAR(10),
    PRIMARY KEY (centre_id, phone)
);

CREATE TABLE IF NOT EXISTS donations (
    id SERIAL,
    user_id INTEGER NOT NULL,
    donated_on TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS item_type (
    value VARCHAR(20),
    PRIMARY KEY (value)
);

CREATE TABLE IF NOT EXISTS items (
    id SERIAL,
    donation_id INTEGER NOT NULL,
    description VARCHAR(255),
    item_type VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (donation_id) REFERENCES donations(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (item_type) REFERENCES item_type(value) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS user_roles (
    value VARCHAR(20),
    PRIMARY KEY(value)
);

-- ASSOCIATIONS
CREATE TABLE IF NOT EXISTS roles (
    centre_id INTEGER,
    user_id INTEGER,
    role VARCHAR(20) NOT NULL,
    PRIMARY KEY (centre_id, user_id),
    FOREIGN KEY (centre_id) REFERENCES centres(id) ON DELETE CASCADE ON UPDATE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE RESTRICT,
    FOREIGN KEY (role) REFERENCES user_roles(value) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS keeps (
    centre_id INTEGER,
    item_id INTEGER,
    quantity DECIMAL NOT NULL,
    PRIMARY KEY (centre_id, item_id),
    FOREIGN KEY (centre_id) REFERENCES centres(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS accepts (
    centre_id INTEGER,
    item_type VARCHAR(20),
    currently_wants BOOLEAN NOT NULL,
    PRIMARY KEY (centre_id, item_type),
    FOREIGN KEY(centre_id) REFERENCES centres(id) ON DELETE CASCADE,
    FOREIGN KEY (item_type) REFERENCES item_type(value) ON DELETE CASCADE
);
