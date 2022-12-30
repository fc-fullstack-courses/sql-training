function createUserQueryValues(user) {
  return `(
    '${user.name}',
    '${user.email}',
    '${user.password}',
    '${user.phoneNum}'
  )`;
}

export const mapUsers = (users) => {
  const usersElems = users.map(createUserQueryValues);
  return usersElems.join(',');
};
