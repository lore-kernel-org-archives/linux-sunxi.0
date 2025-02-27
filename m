Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0B12376E6
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Feb 2025 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740668760; cv=none; b=XDeIoQadOvHGqOYr9gwaSQ56mG95PN5Iue/HdddD2lmHG5mIbx1iG/6nTeJVXHv5Ekw6x1Y3tgBXZULJvwihHuSfFg0kllMbJwXE8cKfTJN0bq/aX0vYhGPD+m+140T9FO/e4JrV2TsoLJMQZlBmXifxWnEgN6uyjGYc/OZkyug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740668760; c=relaxed/simple;
	bh=oXqhsdtyWBieXn06oTfoaCEtTQ5CBE/Y6q/em512ijo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1FcHqsZRcikZGzdo4Demms9WrlBeNlK3ufDK5gBxYrNoL8Wgx59d42Jvmeb/rN4aBE7AQ5eJcuYp14WjEiEfN5BO78eHaC4i+UVDQGxxDL7A7m48oJ0sW6661FEWeYrZiJyb07DSgV7bVbLAD+gM++DEcL09gNBnInmXOUoBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lt+OrmU1; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lt+OrmU1"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30795988ebeso11573191fa.3
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Feb 2025 07:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740668756; x=1741273556; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sFYNYStHehokVGFs8JvRJvS2RWuC59EczsVRJ3j5mJs=;
        b=Lt+OrmU1dmo9BjCbESzqi/UtL+5TpL8cLJLR0n9y+032Bf5RYAImC6UXUjUaI9wewE
         AMeCYasWr+74RALK5pwQKu/idTqiFRpL7ec9JdD49CIz85BbisEJJLZrcpYDnNu74skO
         LGdg54mwidTxpCCjjDiqobYFJWk7oglYR2uTvUCM7+H0h0ndaLF5+LKCuoffMUigWhck
         PSzNbEQaalubO1SOSC6wagR7X/OJpGgVmoZlSY+OFXraG2tVgjQBMwnSoEgEgTAhLa5i
         8ydnl4ATRE+4O/vgUVzovgWzk2X4JC/DguzPT6swQRxq6Lpd94QUKw+BLKsXe7t32dX+
         Z90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740668756; x=1741273556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFYNYStHehokVGFs8JvRJvS2RWuC59EczsVRJ3j5mJs=;
        b=cWQFtp9KVhUke6FMWQ94opPfV8F5aNosy0tqVKbflIsXlftGaXz/kUB8aVSecvOQ6a
         H3j281mFP8KBeI/TcQLgn58wL1KmGequhP3q3Qf5MN0ceaB2sR8Kl+SvGBRRciqahWEB
         rw8AUj6XT+Z4gsuT2Zvgz6jagm3SUjFAefIndQQQbMMhGM4s95spR78mmCSMfmYREau8
         ThdOj4v7ueBvDN1O0lPgwe9+O2Bg7boY68yE2B8shphqt/ROpHsHfWLCaPZB21X/W5VS
         9jbFWhxe9ML3NzwBT4ZgPhJOb9WpUMIeVXr9cA9hkb03WxWBrO1epHgBaDMcVK8j9o9o
         0NnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmSRbBlq94xMMKvRq6ax41np0ZZh1UjOhyPIR34suZJS17TR6nuCuv8kFQa+bQKnzpai1ma4AmTMq7jQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu2NLNBOLMR8uuRxZm7TX7MRKD0OX8nrcV6eHms15ULAymarFq
	1zCjEL7jT5wBGWTq1aKsyForztMRafW6bh9uUH9h2HOv63W71UN3
X-Gm-Gg: ASbGnctzRVklVGVsvTBqEEeZEtmcgasyC79pyJkqfwlP6vb/Sf3WsrzeaNWcI3GHziJ
	Qjrr3X6bx4cb5Zwg7LKlZ+KoDw9HGuGej5LbiXfPHtpxhj7ZGaa2m0XCLv22DY49EHv0IP+booG
	6ZzpgAmtZhejk5IEnRBaLQ/TydTlWzIQwOLNkgiywhlmaCw+DTIUfEe/Yol0F+NB3UaElavI1Is
	ElkOMP5A3sM6dSEmBeGD/VNpnZNFKi9PzHX38QtyYODwTcbVmm5iVvtHx0cPlHhwarpsBHwegti
	r+NIasgAfX51ffQaiXZXO+mq3OypEmvGg4qhBjzWttMkmwPJ72IZr4EhSxZZ7IccqVzTPXMQag5
	Zq4wCgyY=
X-Google-Smtp-Source: AGHT+IF3+FJMbqYsi707hLsELdOrDSp5KTIGs397vlzqq1TcBifloHPzl8dDPN/iBLJu+00pSGcwSw==
X-Received: by 2002:a2e:b617:0:b0:308:f827:f901 with SMTP id 38308e7fff4ca-30a80c41998mr58001921fa.21.1740668755929;
        Thu, 27 Feb 2025 07:05:55 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867a7546sm1885721fa.5.2025.02.27.07.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 07:05:54 -0800 (PST)
Message-ID: <c9424f3e-1ff0-4c01-823a-19801cc3e7a7@gmail.com>
Date: Thu, 27 Feb 2025 17:05:53 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com> <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
 <Z72d7TzZ21WITW3f@smile.fi.intel.com>
 <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
 <Z73M3Ua6u1FpgBEK@smile.fi.intel.com>
 <720f9c69-ca1f-45cb-9f6e-c8e4703c9aad@gmail.com>
 <Z78g_uiXumn4mvET@smile.fi.intel.com>
 <d7982b76-3da7-47ff-b2b2-f964610af1f7@gmail.com>
 <Z8B7h4_IWz43gFhO@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z8B7h4_IWz43gFhO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/2025 16:49, Andy Shevchenko wrote:
> On Thu, Feb 27, 2025 at 10:01:49AM +0200, Matti Vaittinen wrote:
>> On 26/02/2025 16:11, Andy Shevchenko wrote:
>>> On Wed, Feb 26, 2025 at 04:04:02PM +0200, Matti Vaittinen wrote:
>>>> On 25/02/2025 15:59, Andy Shevchenko wrote:
>>>>> On Tue, Feb 25, 2025 at 03:29:17PM +0200, Matti Vaittinen wrote:
>>>>>> On 25/02/2025 12:39, Andy Shevchenko wrote:
>>>>>>> On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
>>>>>>>> On 25/02/2025 12:21, Andy Shevchenko wrote:
>>>>>>>>> On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
> 
> ...
> 
>>>>>>>>>>
>>>>>>>>>> I did not check how many users are you proposing for this, but if
>>>>>>>>>> there's only one, then IMO this should not be a global function yet.
>>>>>>>>>> It just feels to special case to me. But let's see what the others
>>>>>>>>>> think.
>>>>>>>>>
>>>>>>>>> The problem is that if somebody hides it, we might potentially see
>>>>>>>>> a duplication in the future. So I _slightly_ prefer to publish and
>>>>>>>>> then drop that after a few cycles if no users appear.
>>>>>>>>
>>>>>>>> After taking a very quick grep I spotted one other existing place where we
>>>>>>>> might be able to do direct conversion to use this function.
>>>>>>>>
>>>>>>>> drivers/net/ethernet/freescale/gianfar.c
>>>>>>>>
>>>>>>>> That'd be 2 users.
>>>>>>>
>>>>>>> I haven't checked myself, I believe your judgement,
>>>>>>
>>>>>> I took a better look and you obviously shouldn't believe :) The gianfar used
>>>>>> of_node instead of the fwnode. So, it'd be a single caller at starters.
>>>>>
>>>>> ...which is the same as dev_of_node(), which means that you can use your
>>>>> function there.
>>>>
>>>> I'm unsure what you mean. The proposed function
>>>> device_get_child_node_count_named() takes device pointer. I don't see how
>>>> dev_of_node() helps converting node to device?
>>>
>>> dev_of_node() takes the device pointer and dev_fwnode() takes that as well,
>>> it means that there is no difference which one to use OF-centric or fwnode
>>
>> The proposed device_get_child_node_count_named() takes a device pointer. I
>> don't see how dev_of_node() helps if there is just of_node and no device
>> pointer available in the calling code.
> 
> ???
> 
> The loops are working on
> 
> 	struct device_node *np = pdev->dev.np;
> 
> which is the equivalent to
> 
> 	struct device_node *np = dev_of_node(&pdev->dev);
> 
> which takes device pointer.
> 
>> (Well, as I wrote below, I could
>> alter the gianfar code by dropping the gfar_of_group_count(), so that I have
>> the device pointer in caller). Anyways, I don't see how dev_of_node() should
>> help unless you're proposing I add a of_get_child_node_count_named() or
>> somesuch - which I don't think makes sense.
> 
> Are you forbidding yourself to change the function prototype to take a device
> pointer instead of device_node one? :-)
> 

This is our point of misunderstanding. As I wrote, and as you can see 
from the prototype, the function _is_ taking the device pointer. Hence I 
didn't understand how dev_of_node() should help us.

>>> API in this particular case. Just make sure that the function (and there
>>> is also a second loop AFAICS) takes struct device *dev instead of struct
>>> device_node *np as a parameter.
>>
>> I think I lost the track here :)
> 
> Make gfar_of_group_count() to take device pointer. As simple as that.

that'd just make the gfar_of_group_count() a wrapper of the 
of_get_child_node_count_named(). I prefer killing whole 
gfar_of_group_count().


Yours,
	-- Matti
