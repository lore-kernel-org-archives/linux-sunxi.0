Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF8020469D
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740132632; cv=none; b=TQtxSfAYELlw7NZh8hQdpDknFUI1wCogpcj1TaKu008ZTuL/YKzHXoajjbvf0flEtlrCJbh5KkvkPIOIt+YisGXQBdjkTVhdLEDAWLWS08Uu5obESZWnijhYm/tQIQkjVBiBVtQNnUxRTow3sU+JHauFWPU8M3PpdpHRbdKfUxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740132632; c=relaxed/simple;
	bh=GABZIa1yk+ME7OqVVkc9YSIBFoStKBRMFdZ+km85+xA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jc7/fZszjZ8ZNAO4l+lzazrA4QB6WvNVbOlnNJFTR4RZaZSK5n6h0k4lvQmeZIVwkVcPxPD5ZBd/lADp/TPSH1svtTJg8PeDX+igzoLAllvB7/qU63AYtSQC4aDNlH29aNFPSMGxGaEZqtXf/TM4mocUH0IEHO808cabffdyfwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bY2O2SEP; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bY2O2SEP"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30930b0b420so16715451fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 02:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740132628; x=1740737428; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bG0BbpFoyNoqsk135c328imcMJ0+Nr3ev0Mcwuo/rmM=;
        b=bY2O2SEPUB48mHb8fv3vBPWBCs8J+XRHujwHTj0R+dFIDnUxT76+Wtbj++rY2U6hVn
         Rko5B7GzbT5vAjS+FNVxKEIt2S14g2yRZtrwaWqLjARDyy96NxoTlYX3iLvy5i7BMS0E
         4gy9JBEZ1oDYngoEPwUoltp/zw2FpsGBpinD82PgeIoXS/fkX/5rVrTXhXQFaOsVU09R
         11w4l55cMCgKxs2vkGINJx/ilnOKB4Amykg+ahI59PyZwYMLaUGtT4V7lAEJrQP04dtf
         rov3Qm9sMBx7E6DM3Ta18EjbgkudHLKP0fVwkiYzdGsfwl7FHpoF/Ks5FZmsNg+8Vr2/
         N/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740132628; x=1740737428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bG0BbpFoyNoqsk135c328imcMJ0+Nr3ev0Mcwuo/rmM=;
        b=vehf/ovrja6PfpFvUSZsp/fAZf+IYoU89XDNQbwEwlej6DR7b4qflOIQVMbHrzGQq/
         QZTryiP7FlwBsah9K7Mh0JbijzEV0k6axYJDm3dfZbjyjFovfP7IWTNH9H+BnhZ/TAPr
         Ln0G8z4dclE+MWQAQFJCZjHwOmfKvAcDQaB+BfT2S9ukUTR92aqPt1Mzk3s8soRoHrZB
         tuXWMbno7JZlTe8dxAQwaQVtExK6aDWz2mMWqQTkydN9q+mGsJ7L/7tJzN2x+0dlAdlz
         hl8VX7pbQjxJ/yr3QnlqTUN6dGk0MDdPQN3FMWzZZT0lgk4DxcuTNNkiBZl2uSv8vFWI
         Qumw==
X-Forwarded-Encrypted: i=1; AJvYcCUvPj88LeLGUV8gNterIO3pNkdHh3tQDA4HIqwbI6elrF8grCelJZm0sNy/TNuxTHJoxtS0qlu6hmzQwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyd7ll4OEcjgOtZqFS5lvy3N01tXPe4ZzU23xy8p6hOfO8ml+J
	7D2mVC347MN3ym5ABqYzrva6SdAetPeEbJdTFPdXKuFnCNMobflI
X-Gm-Gg: ASbGncuL+tkymrnnIZQ97thFyUgBjMLUtZBjnMaet3F3mbwAqgFkhuvyLf2X7J7+kif
	4yC1h+bnOCaQmKA/IwFMeHWYZoZ6f8R1kxnhzwkqWPDZC4jOGuDAPegb4sEOwl6mxyWZO9s0ej9
	bQj5ZKMI8WC1eyUA0ZggdMSbBdG3QFWmu8KJuLss5DvDI/V/6EFd80VBOm7r3HN+1KOIH4+8lxd
	rZnDJnwK06QJBs0pEo6myofjzp5mJsz8IEimTH/i99szKFT6aU7g1KjO0SO7QgK+7TTQ/a6stD4
	MBaVSdEC7SdBfPN25bkZ+/AOKRDaGgYnVw4nLe+7d+7+v2eOGX+oDPu36QOYSqyuVzCoYDVG7E0
	n8RbY13s=
X-Google-Smtp-Source: AGHT+IEF7HCPBupTpoTIufUdFzsU1NW7CnwkRmSqsaZ2XXJ41DlnitRvGydjhmN16iRmcwFrBfhXBA==
X-Received: by 2002:a05:6512:3f05:b0:542:2e09:639a with SMTP id 2adb3069b0e04-54838edddd1mr724643e87.10.1740132627920;
        Fri, 21 Feb 2025 02:10:27 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f105c2fsm2638305e87.117.2025.02.21.02.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 02:10:26 -0800 (PST)
Message-ID: <cb27d8b1-c978-4443-9ad2-96e930701976@gmail.com>
Date: Fri, 21 Feb 2025 12:10:23 +0200
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
 <9018e23c-da28-41b0-b774-1598b946a2a1@gmail.com>
 <Z7dCnRzuQTaJXzmb@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z7dCnRzuQTaJXzmb@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/02/2025 16:56, Andy Shevchenko wrote:
> On Thu, Feb 20, 2025 at 04:21:37PM +0200, Matti Vaittinen wrote:
>> On 20/02/2025 16:04, Andy Shevchenko wrote:
>>> On Thu, Feb 20, 2025 at 03:40:30PM +0200, Matti Vaittinen wrote:
>>>> On 20/02/2025 14:41, Andy Shevchenko wrote:
>>>>> On Thu, Feb 20, 2025 at 09:13:00AM +0200, Matti Vaittinen wrote:
>>>>>> On 19/02/2025 22:41, Andy Shevchenko wrote:
>>>>>>> On Wed, Feb 19, 2025 at 02:30:27PM +0200, Matti Vaittinen wrote:
> 
> ...
> 
>>>>>>>> +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
>>>>>>>
>>>>>>> No namespace?
>>>>>>
>>>>>> I was considering also this. The IIO core functions don't belong into a
>>>>>> namespace - so I followed the convention to keep these similar to other IIO
>>>>>> core stuff.
>>>>>
>>>>> But it's historically. We have already started using namespaces
>>>>> in the parts of IIO, haven't we?
>>>>
>>>> Yes. But as I wrote, I don't think adding new namespaces for every helper
>>>> file with a function or two exported will scale. We either need something
>>>> common for IIO (or IIO "subsystems" like "adc", "accel", "light", ... ), or
>>>> then we just keep these small helpers same as most of the IIO core.
>>>
>>> It can be still pushed to IIO_CORE namespace. Do you see an issue with that?
>>
>> No. I've missed the fact we have IIO_CORE O_o. Thanks for pointing it out!
>>
>>> Or a new opaque namespace for the mentioned cases, something like IIO_HELPERS.
>>
>> I am unsure if it really benefits to split this out of the IIO_CORE. I've a
>> feeling it falls into the category of making things harder for user with no
>> apparent reason. But yes, the IIO_CORE makes sense.
> 
> Probably I was not clear, I mean to put this under a given namespace. There is
> no a such, we have currently:
> 
> IIO_BACKEND
> IIO_DMA_BUFFER
> IIO_DMAENGINE_BUFFER
> IIO_GTS_HELPER
> IIO_RESCALE

Ah. So, the IIO core stuff is still not in a namespace. Those listed 
above are all too specific (I believe, in general, and definitely to 
carry ADC helpers).

Adding 'ADC_HELPERS' would just add yet another way too specific one. 
So, currently there is no suitable namespace for these helpers, and I 
still believe they fit best to where the rest of the IIO-core stuff is.

If we want really play the namespace game, then the existing IIO stuff 
should be put in a IIO_CORE-namespace instead of creating more new small 
ones. I am afraid that adding all existing IIO core to a IIO_CORE 
namespace and converting all existing users to use the IIO_CORE is not a 
reasonable request for a person trying to:

1. Write a driver
2. Add a small helper to aid others (instead of just melding it all in 
the given new driver - which does not benefit anyone else and just leads 
to code duplication in the long run...)

>>>>>> (Sometimes I have a feeling that the trend today is to try make things
>>>>>> intentionally difficult in the name of the safety. Like, "more difficult I
>>>>>> make this, more experience points I gain in the name of the safety".)
>>>>>>
>>>>>> Well, I suppose I could add a namespace for these functions - if this
>>>>>> approach stays - but I'd really prefer having all IIO core stuff in some
>>>>>> global IIO namespace and not to have dozens of fine-grained namespaces for
>>>>>> an IIO driver to use...
> 
> ...
> 
>>>> foo &= (~bar);
>>>>
>>>> is _much_ faster than seeing:
>>>
>>> Strongly disagree. One need to parse an additional pair of parentheses,
>>> and especially when it's a big statement inside with nested ones along
>>> with understanding what the heck is going on that you need them in the
>>> first place.
>>>
>>> On top of that, we have a common practices in the LK project and
>>> with our history of communication it seems you are trying to do differently
>>> from time to time. Sounds like a rebellion to me :-)
>>
>> I only rebel when I (in my opinion) have a solid reason :)
>>
>>>> foo &= ~bar;
>>>>
>>>> and having to google the priorities.
>>>
>>> Again, this is something a (regular) kernel developer keeps refreshed.
>>> Or even wider, C-language developer.
>>
>> Ha. As I mentioned, I've been writing C on a daily bases for almost 25
>> years. I wonder if you intent to say I am not a kernel/C-language developer?
>> Bold claim.
> 
> I'm just surprised by seeing that style from a 25y experienced C developer,
> that's all.

I am not. If something, these 25 years have taught me to understand that 
even if something is simple and obvious to me, it may not be simple and 
obvious to someone else. Similarly, something obvious to someone else, 
is not obvious to me. Hence, I am very careful when telling people that:

 >>> Again, this is something a (regular) kernel developer keeps refreshed.
 >>> Or even wider, C-language developer.

I may however say that "this is something _I_ keep refreshed (as a 
kernel/C-developer)".

As an example,

 >>>> foo &= (~bar);

This is something _I_ find very clear and exact, with zero doubt if 
negation is applied before &=. For _me_ the parenthesis there _help_, 
and for _me_ the parenthesis cause no confusion when reading the code.

I won't go and tell that I'd expect any C or kernel developer to be able 
to fluently parse "foo &= (~bar)". (Whether I think they should is 
another matter).

Oh well, let's wait and see what Jonathan thinks of these helpers in 
general. We can continue the parenthesis discussion when we know whether 
the code is going to stay.

Yours,
	-- Matti

