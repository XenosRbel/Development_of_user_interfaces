// For a detailed explanation regarding each configuration property, visit:
// https://jestjs.io/docs/en/configuration.html

module.exports = {
  // Automatically clear mock calls and instances before every test
  clearMocks: true,

  // An array of directory names to be searched recursively up from the requiring module's location
  moduleDirectories: ['node_modules', '<rootDir>/app/javascript'],

  // An array of file extensions your modules use
  moduleFileExtensions: ['js', 'jsx'],

  moduleNameMapper: {
    '\\.(jpg|ico|jpeg|png|gif|eot|otf|webp|svg|ttf|woff|woff2|mp4|webm|wav|mp3|m4a|aac|oga)$':
      '<rootDir>/app/javascript/front/jest_mocks/fileMock.js',
    '^~admin(.*)$': '<rootDir>/app/javascript/admin$1',
    '^~front(.*)$': '<rootDir>/app/javascript/front$1',
  },

  // The paths to modules that run some code to configure or set up the testing environment before each test
  setupFiles: ['<rootDir>/jest.setup.js'],

  // A list of paths to snapshot serializer modules Jest should use for snapshot testing
  snapshotSerializers: ['enzyme-to-json/serializer'],

  // The test environment that will be used for testing
  testEnvironment: 'jsdom',

  // The glob patterns Jest uses to detect test files
  testMatch: ['<rootDir>/app/javascript/**/*.spec.js?(x)'],

  // An array of regexp pattern strings that are matched against all test paths, matched tests are skipped
  testPathIgnorePatterns: ['/node_modules/'],
};
