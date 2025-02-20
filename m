Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D551F1508
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061306; cv=none; b=h8iB4/G6HRkUQzTDLXR2BShNqwOqHES9agzUKWELvpAvce/BFxtA0qInqZtNPNIBvQhBjaKfiVxtVlnyUBOmqb86hvwUTYmAwGvv0Sv2me6rEwbkcnV4+Xefy8iFd9qCHfMIiApq1rvV/K9HJdzKrODh1H1MRlK7KZ2zodquaKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061306; c=relaxed/simple;
	bh=PpVzdWc+hNukxIACDuAxZaeAROL3OgZe4+gSpyqxYFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uuNngiy6+sXeuugJjoZWg6R0KhQ8JgodngFsdg4BcyIxhKlxyA8WOGrZbG+JuT7QELxhmrY/r1fljzCZbArfk+frjs53hljsf3Uy9binm/a/Y6Ix+0r+6xWzVR5VK9DUfNyEDGvdGbbKng9X1h6+1LOr0fsMjd5YS5PW0uRJe40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZSJ+jjZ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZSJ+jjZ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5439a6179a7so1132624e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 06:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061303; x=1740666103; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzmoiLCG8SAcHQOd7ewiQtwf2LHT2fH6DKF15WTZxJc=;
        b=EZSJ+jjZwXNKlhx02dLo0YoipC00Xy6ScGryWzaMB9Ct0ZmPpVEo7/LqWRDhxQfEzH
         lhL9YguNEc4JrPPCAeQESrUYm/XLetujtsqbqkXd3PLDD3lePUkXr9jnuxoVK1cY+8aL
         c/DNV5HTfDq5FXdcwQIP0KnuymZyS9RLaQSLbbn773POfuxj20TYMENGy38SqAwJ9Skt
         IlYIiQeJqKiOtmSboxn9hXGi1S3UZOkzaW9YPV9aTww7UmzjXhDLqTM2en01DXnMgCrR
         WvoxfN6H2ErnAi7STZ81+D4E8Ft4bgwmreyRNNhbqrnzPtdAMhl6Ln7QnwU3vTQvBInu
         6ZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061303; x=1740666103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzmoiLCG8SAcHQOd7ewiQtwf2LHT2fH6DKF15WTZxJc=;
        b=U5tRPG5jR2maF+XG4pj/5a+S9jZiZKyqbSRkqoOLRdbjKun7/keSLDRhcR5bn7oI53
         07bPwMHxKOUt24ruYRpEUcKgfaFtldJIFA8ndaJwkl2KBM9LiE6LBPJeKAxSfDlb0cyH
         UlVa0W+5vASkbOaUU0HD1aOLDOyzJ9+imobFcoCI0/geduwG2jcHqRFDPjLpgj6R5uKk
         tb0ga9x2ZdnoXe5v4cJL9DSajqqC2PYitXF8+uXUJ8EKhaZW9OdB7EpdrjGUurLJQBxY
         M9mBRrnu+Z6a85dWS3tiv9Ng3XKzz1MFJ3o5PUqfIb74BEErFouK7w3bU9Sq5XyYugqA
         Hlnw==
X-Forwarded-Encrypted: i=1; AJvYcCXzOOUio71DzXIgbymxP5/stnksLgGvj7bs2O1W97wWX4R5J0Wqc5/eGt6qUuJ9WxNgdkQSunZW30YGYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2nVOHYtfZ58vqc97ZwY1y2TlryvH5l3KQd8lB15upUS0bEzks
	e3IpjJMHkDadORBfeCCzBWEidtuWRXfmmVLwAA1SnngaYEshPJVe
X-Gm-Gg: ASbGnctSCCymGvxGiiM0FJKN9KGNYqAY9T4+jWefiNtVjhS3zjmbL6MwN/f8xq8KtTF
	we0CPXQAdJhZ9XtSEvdM6Q8KcvDOWuaHap5gxeX1+GAwmSTp5pVNmeKo6lSrY5kG8MU65yNknwp
	jAm+Z/k2UEQ9CS7Guk8By8+wQPIw+7Szbx3mj8/BUiKLkTQTEpjvAHnQ5KIK8G7iUFRLF+UV9Uq
	A1/Ou06zPBCkBJmr4DpVuea88qLI2WbCGw4ZX5LLh+BlXvr/nkJVce6kTkkl7MsgmGYISiE0p8z
	x1Q7WAxuM3/PZ5C7l8NdeYWcvybK4qD16xwHWBBxTHMduOHw6YHR7NE+Yw1zwq08Bx4GsmdH
X-Google-Smtp-Source: AGHT+IEnorexehar0T56dUSxxROrZLAf2XndxCCWnC99AsuPb3902B0+uwY/QTJ7hoY8ePb04Bn4Lg==
X-Received: by 2002:a05:6512:4010:b0:545:16a8:6a5d with SMTP id 2adb3069b0e04-546e3c9c9e0mr1209013e87.2.1740061302295;
        Thu, 20 Feb 2025 06:21:42 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452fcf6487sm1893226e87.137.2025.02.20.06.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 06:21:40 -0800 (PST)
Message-ID: <9018e23c-da28-41b0-b774-1598b946a2a1@gmail.com>
Date: Thu, 20 Feb 2025 16:21:37 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] iio: adc: add helpers for parsing ADC nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1739967040.git.mazziesaccount@gmail.com>
 <6c5b678526e227488592d004c315a967b9809701.1739967040.git.mazziesaccount@gmail.com>
 <Z7ZB7RQhyI5Dohrq@smile.fi.intel.com>
 <b1c1ed68-2f4d-447c-9957-5a1bbc63ef6e@gmail.com>
 <Z7ci7tUlRQqZEZSN@smile.fi.intel.com>
 <ec76334b-bb13-4076-811d-9174170dd677@gmail.com>
 <Z7c2cBQpjoc9-Vyu@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z7c2cBQpjoc9-Vyu@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/02/2025 16:04, Andy Shevchenko wrote:
> On Thu, Feb 20, 2025 at 03:40:30PM +0200, Matti Vaittinen wrote:
>> On 20/02/2025 14:41, Andy Shevchenko wrote:
>>> On Thu, Feb 20, 2025 at 09:13:00AM +0200, Matti Vaittinen wrote:
>>>> On 19/02/2025 22:41, Andy Shevchenko wrote:
>>>>> On Wed, Feb 19, 2025 at 02:30:27PM +0200, Matti Vaittinen wrote:
> 
> ...
> 
>>>>>> +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
>>>>>
>>>>> No namespace?
>>>>
>>>> I was considering also this. The IIO core functions don't belong into a
>>>> namespace - so I followed the convention to keep these similar to other IIO
>>>> core stuff.
>>>
>>> But it's historically. We have already started using namespaces
>>> in the parts of IIO, haven't we?
>>
>> Yes. But as I wrote, I don't think adding new namespaces for every helper
>> file with a function or two exported will scale. We either need something
>> common for IIO (or IIO "subsystems" like "adc", "accel", "light", ... ), or
>> then we just keep these small helpers same as most of the IIO core.
> 
> It can be still pushed to IIO_CORE namespace. Do you see an issue with that?

No. I've missed the fact we have IIO_CORE O_o. Thanks for pointing it out!

> Or a new opaque namespace for the mentioned cases, something like IIO_HELPERS.

I am unsure if it really benefits to split this out of the IIO_CORE. 
I've a feeling it falls into the category of making things harder for 
user with no apparent reason. But yes, the IIO_CORE makes sense.

>>>> (Sometimes I have a feeling that the trend today is to try make things
>>>> intentionally difficult in the name of the safety. Like, "more difficult I
>>>> make this, more experience points I gain in the name of the safety".)
>>>>
>>>> Well, I suppose I could add a namespace for these functions - if this
>>>> approach stays - but I'd really prefer having all IIO core stuff in some
>>>> global IIO namespace and not to have dozens of fine-grained namespaces for
>>>> an IIO driver to use...
> 
> ...
> 
>>>>>> +	if (!allowed_types || allowed_types & (~IIO_ADC_CHAN_PROP_TYPE_ALL)) {
>>>>>
>>>>> Unneeded parentheses around negated value.
>>>>>
>>>>>> +	if (found_types & (~allowed_types)) {
>>>>>
>>>>> Ditto.
>>>>>
>>>>>> +		long unknown_types = found_types & (~allowed_types);
>>>>>
>>>>> Ditto and so on...
>>>>>

...

>>>> during the moves I lost my printed list of operator precedences which I used
>>>> to have on my desk. I've been writing C for 25 years or so, and I still
>>>> don't remember the precedence rules for all bitwise operations - and I am
>>>> fairly convinced I am not the only one.
>>>
>>> ~ (a.k.a. negation) is higher priority in bitops and it's idiomatic
>>> (at least in LK project).
>>
>> I know there are well established, accurate rules. Problem is that I never
>> remember these without looking.
> 
> There are very obvious cases like below.

I think we just disagree on if this is obvious.

>>>> What I understood is that I don't really have to have a printed list at
>>>> home, or go googling when away from home. I can just make it very, very
>>>> obvious :) Helps me a lot.
>>>
>>> Makes code harder to read, especially in the undoubtful cases like
>>>
>>> 	foo &= (~...);
>>
>> This is not undoubtful case for me :) And believe me, reading and
>> deciphering the
>>
>> foo &= (~bar);
>>
>> is _much_ faster than seeing:
> 
> Strongly disagree. One need to parse an additional pair of parentheses,
> and especially when it's a big statement inside with nested ones along
> with understanding what the heck is going on that you need them in the
> first place.
> 
> On top of that, we have a common practices in the LK project and
> with our history of communication it seems you are trying to do differently
> from time to time. Sounds like a rebellion to me :-)

I only rebel when I (in my opinion) have a solid reason :)

>> foo &= ~bar;
>>
>> and having to google the priorities.
> 
> Again, this is something a (regular) kernel developer keeps refreshed.
> Or even wider, C-language developer.

Ha. As I mentioned, I've been writing C on a daily bases for almost 25 
years. I wonder if you intent to say I am not a kernel/C-language 
developer? Bold claim.

>>>>>> +		int type;
>>>>>> +
>>>>>> +		for_each_set_bit(type, &unknown_types,
>>>>>> +				 IIO_ADC_CHAN_NUM_PROP_TYPES - 1) {
>>>>>> +			dev_err(dev, "Unsupported channel property %s\n",
>>>>>> +				iio_adc_type2prop(type));
>>>>>> +		}
>>>>>> +
>>>>>> +		return -EINVAL;
>>>>>> +	}
> 
> ...
> 
>>>>>> +		tmp.required &= (~BIT(IIO_ADC_CHAN_PROP_COMMON));
>>>>>
>>>>> Redundant outer parentheses. What's the point, please?
>>>>
>>>> Zero need to think of precedence.
>>>
>>> Huh? See above.
>>> Everything with equal sign is less precedence than normal ops.
>>
>> Sure. It's obvious if you remember that "Everything with equal sign is less
>> precedence than normal ops". But as I said, I truly have hard time
>> remembering these rules. When I try "going by memory" I end up having odd
>> errors and suggestions to add parenthesis from the compiler...
> 
> The hardest to remember probably the
> 
> 	foo && bar | baz
> 
> case and alike. These are the only ones that I totally agree on with you.
> But negation.
> 
>> By the way, do you know why anyone has bothered to add these
>> warnings/suggestions about adding the parenthesis to the compiler? My guess
>> is that I am not only one who needs the precedence charts ;)
> 
> Maybe someone programmed too much in LISP?.. (it's a rhetorical one)
> 
> ...
> 
>>>>>> +		ret = fwnode_property_read_u32(child, "common-mode-channel",
>>>>>> +					       &common);
>>>>>
>>>>> I believe this is okay to have on a single line,
>>>>
>>>> I try to keep things under 80 chars. It really truly helps me as I'd like to
>>>> have 3 parallel terminals open when writing code. Furthermore, I hate to
>>>> admit it but during the last two years my near vision has deteriorated... :/
>>>> 40 is getting more distant and 50 is approaching ;)
>>>
>>> It's only 86 altogether with better readability.
>>> We are in the second quarter of 21st century,
>>> the 80 should be left in 80s...
>>>
>>> (and yes, I deliberately put the above too short).
>>
>> I didn't even notice you had squeezed the lines :)
>>
>> But yeah, I truly have problems fitting even 3 80 column terminals on screen
>> with my current monitor. And when working on laptop screen it becomes
>> impossible. Hence I strongly prefer keeping the 80 chars limit.
> 
> Maybe you need a bigger monitor after all? (lurking now :-)

Wouldn't fit my table :)

> ...
> 
>>>>>> +#include <linux/iio/iio.h>
>>>>>
>>>>> I'm failing to see how this is being used in this header.
>>>>
>>>> I suppose it was the struct iio_chan_spec. Yep, forward declaration could
>>>> do, but I guess there would be no benefit because anyone using this header
>>>> is more than likely to use the iio.h as well.
>>>
>>> Still, it will be a beast to motivate people not thinking about what they are
>>> doing. I strongly prefer avoiding the use of the "proxy" or dangling headers.
>>
>> Ehh. There will be no IIO user who does not include the iio.h.
> 
> It's not your concern. That's the idea of making C units as much independent
> and modular as possible (with common sense in mind). And in this case I see
> no point of including this header. Again, the main problem is this will call
> people to use the new header as a "proxy" and that's what I fully against to.
> 
>> And, I need the iio_chan_spec here.
> 
> Do you really need it or is it just a pointer?

Just a pointer. Forward declaration could do it. Hmm. I didn't think of 
people using this header as a proxy. I guess you have a point here :)

> 
> ...
> 
>> And as I said, I suggest saving some of the energy for reviewing the next
>> version. I doubt the "property type" -flags and bitwise operations stay, and
>> it may be all of this will be just meld in the bd79124 code - depending on
>> what Jonathan & others think of it.
> 
> Whenever this code will be trying to land, the review comments still apply.

Sure! But chances are plenty of this code gets erased :) I just wanted 
to warn you that some of the effort on this version is likely to get 
wasted. I did consider reverting this back to a RFC - but going back'n 
forth with the RFC status felt odd...

Yours,
	-- Matti

