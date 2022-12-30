function createUserQueryValues(user) {
  const {
    name: { first, last },
    email,
    login : {
      sha256 : password
    },
    phone
  } = user;
  return `(
    '${first} ${last}',
    '${email}',
    '${password}',
    '${phone}'
  )`;
}

export const mapUsers = (users) => {
  const usersElems = users.map(createUserQueryValues);
  return usersElems.join(',');
};
