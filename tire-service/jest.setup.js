import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

import i18n from 'front/jest_mocks/i18n';

configure({ adapter: new Adapter() });

Object.defineProperty(window, 'matchMedia', {
  value: jest.fn().mockImplementation((query) => ({
    addEventListener: jest.fn(),
    addListener: jest.fn(),
    dispatchEvent: jest.fn(),
    matches: false,
    media: query,
    onchange: null,
    removeEventListener: jest.fn(),
    removeListener: jest.fn(),
  })),
  writable: true,
});

global.I18n = i18n;
