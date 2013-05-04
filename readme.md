Pixel‐parity rems
===

‘Because web development shouldn’t require a calculator.’

***NOTE*** In transition: pixel‐parity rems are becoming Responsive Pixels. Please pardon the dust.

Why do we need a new unit?
---

Pixels are easy to work with but have two major drawbacks:

1. They are absolute values (and hence may require lots of redeclaration in breakpoints of responsive designs)
2. They do not scale properly in older browsers.

Because of this, the web development community has embraced ems. Ems have advantages because they:

1. Are relative units and hence it is easy to scale properties of child elements in proportion by changing a property of their parent element.
2. Scale properly in older browsers.

However, ems are a pain in the posterior to work with because they are set relative to the font‐size of the element, which is affected by the cascade. What does that mean? It means that you end up needing a calculator to do basic design. You also lose the ability to visualise the dimensions of things.

Thankfully, rems (root ems) make things much easier by basing their values off of the font‐size of the root HTML element. They are:

1. Relative units
2. Easy to use

However, they are not supported on older browsers. Which is why, you should provide pixel fallbacks when you are using them.

Also, since the base font size is 16px by default in browsers, you still have to do some math (specifically, you need to divide values in pixels by 16 to arrive at values in rems). That’s not ideal.

Enter pixel‐parity rems
---

Think about it: what would happen if you set the root font size to 1px? You’d get parity between rems and pixels. 1 rem = 1 pixel. And you know what that means? No maths! And you can visualise the dimensions of your elements again.

This is exactly what Chris Jacob suggested in [his Elastic Pixels gist](http://jsbin.com/acide4/8). And I started doing just that. And life was good. For a while.

Unfortunately, not all browsers let you set the root font size to 1px. This is a bug, not a feature. On some browsers it erroneously conflicts with the minimum font size setting in the accessibility settings (even if the actual font sizes of your elements are all larger than it). This results in your elements rendering in horrendously large proportions. And some browsers&#8202;—&#8202;especially some console browsers (thank‐you, [Anna Debenham](http://maban.co.uk), for letting me test with your toys)&#8202;—&#8202;appear to completely ignore any change to the root font size. Gotta love browsers.

CSS preprocessors to the rescue
---

Since we cannot reliably change the root em across browsers, the only thing left to do is to use a CSS processor to do the maths for us. A big thank‐you to [Laura Kalbag](http://laurakalbag.com) as her work with pixel fallbacks for rems via mixins is what inspired the idea and we’ve been playing with pixel‐parity rems together ever since.

Using a CSS pre‐processor, we can:

1. Use relative units
2. Have pixel parity (no need for complicated maths)
3. Have pixel fallbacks for older browsers

Ah, CSS nirvana!

So pixel‐parity rems are rems where 1 rem = 1 pixel. They behave as if you set the root em to 1px without actually doing that by using CSS preprocessor mixins to automatically divide the values you pass by 16 (the default root em).

I was hesitant to publicise this until I had used it in a few real‐world projects in case any issues cropped up but Laura and I have both used the technique in multiple projects now and we’re both confident that it works. It also makes our lives much easier by reducing our cognitive load so we can concentrate on, you know, actually designing and developing sites.

This repository will, in time, contain implementations of pixel‐parity rems in different CSS preprocessors. For the time being it has the mixins library that I am working on, which is written in [Stylus](http://learnboost.github.com/stylus/). Laura’s been working with pixel‐parity rems in Sass, so an implementation in that preprocessing language should be added shortly. Pull requests welcome.