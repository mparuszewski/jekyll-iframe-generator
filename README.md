# IFrame Generator for Jekyll

Jekyll plugin for generating 'iframable' version website - with different layout (ie. without sidebar or menu) and different route (/iframe/). Now you are able to add \<iframe/\> with your website anywhere.


## Installation

In your Jekyll site source root directory, create or open a `_plugins` directory. Paste `iframe_generator.rb` there.

## Usage

IFrame Generator will create files and directories with `/iframe/` prefix. All pages and posts will now have `iframe` versions. For example if you had post with route `http://yourname.github.io/categories/news/2014-08-11-my-first-post` your iframeable version of this post will be `http://yourname.github.io/iframe/categories/news/2014-08-11-my-first-post`.
