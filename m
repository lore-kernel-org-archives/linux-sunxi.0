Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E126224B05
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Feb 2025 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740643317; cv=none; b=YLS0ZThJXuChjli85BxazVJIDxMGnyxuzs3tcBIEgbtz+20a+hFANVY9MkXK/IbatDwI37AHSe+6ZbKuaDbVzpN3Z6TrhW3aYP8043zBVfZU2SIuJsvQGUQ3qhLUKG8R1tFzn8Kwa6fSFyICmyXG/tYKiMdEroMDvyjN/vLc0mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740643317; c=relaxed/simple;
	bh=runjjTr95i43OiT1nxM0NLq9jU5kyxMdjAifU3Y72ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYzYpwW4t2rKaXewoZigSxvIvIFAswUHxKf1C4TAIu8rP5Djf5KDdNcv8nuBujDt0u4uPCak4AkMTgbbeKncZ8noo2WDYmDYX22Kb96jyCYKpCqyb0ovSTRgs8TLmO4D30xby7JnA4fHBE7+xOSgolOGj5nTy3OJzovoMmWR+EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ab0KTEVo; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ab0KTEVo"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54298ec925bso963236e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Feb 2025 00:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740643313; x=1741248113; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nDtuSF+uNvwU/olXT0/1pp58GsxviGqVNXkV33zGjbs=;
        b=ab0KTEVoQt+FTsFkiYPd78J0m6IswLN131eUvb/us9B17ooisL2KUwVXBgDSORJSSk
         fBoz936GYiA7RnwH8oQBh7PJ3PZbQfC8478ybow7GGsj4RucAosWHewznL6fNgOHXehd
         YLkG/CFimk5aDZVtCEBtAETEMDtaDhB895BMaWdX34uuVqFsKmUlndI6eI0RpDYvz5G+
         9YMPh++lOodJ/fyvwXK/eAT17iqBYM2OiqCPvM6/3SCEqA94hB7RW0aEWs/6GbJb8mwd
         3tgNI3yIEqfk+O/Vn/TuB/m/KStj+eMHNqv865rQ+ug4icPP92pba8LATtIbAGrRP3rp
         6ZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740643313; x=1741248113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDtuSF+uNvwU/olXT0/1pp58GsxviGqVNXkV33zGjbs=;
        b=BuRLyJMk2Gu0tEmkQjmXOK6L6jCrqGRCx84JESYq5yB4VWEKWg9zWT8cGSJv/L1zNx
         n+lCQZs6I4gGc/9WVppTv4PxPXtFCqG8gxeQNDWh+gBQU500G0GW34UzlbcgdNR+K41E
         Sj3H+eTDJUnH/Grel5BF/ybnh68/H/09Qwub/eid51lvfiV3MlagZwl3ET416aM1vK/5
         lmdawTdGIjXIqOYsY2x59p6RzWWYGS9hf9L0AiSWgA0amRru1SW+4zGtzroEIH2eQ+3V
         C70aMsh8MK5rar1SzwSJsGogL39ZEok6zJDOCJevnq/n4TnIJUwCJYlys6ZF5DsnYG4d
         QFPw==
X-Forwarded-Encrypted: i=1; AJvYcCWc0b0s1lJqk4tF3XwGharj7d+lJ1wzzP2iyDQ417z6aBtrfxG+HgeOawDT//FT4uQ4ebLe7KRiKErdvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqZHnizFF/upc1JKZZaG5zoFs9lZftLU0ZLT2k2l7w2IOHYrmH
	EyieH1+xOYGHtKY4v8caKt7C42HHsyTy0LLAer+TbkfnFvGlrj4G
X-Gm-Gg: ASbGnctM/8887V7nzR+YqFSUu4pelW1hWvHlO0Z6rdmzdEfiNi26jnkTtlMcIIGHGBK
	Ldqw3gjTN54B+rhBtARAAFg2hcBKaFBa5udrGLegBZVaupoAnxiWFoTNF/d5a5zNeFKwALLE/TX
	X3K5gGRv4HbfPbS9IOJaNuxXVqQAKQiHQZD70FVvXOpwXDzZHtNxkGNozmQH23lkpH641e1fdcm
	8rTmjj8i8tvQBpAu0YcHdU/lASBznaKo/P6pqQ/gCNHKXKmvy+95Q/liZ7r5WC/gEY4uu9z5w18
	8taQBBZ7zUbHBfAKLmat7qwhcR0sgKGoLS94ZFk78s1NFZYraOx+6VmrZXsagBCaEft9DbPWB4a
	bq4VOf6Q=
X-Google-Smtp-Source: AGHT+IFjVjmK2qHUacoPpo4OU31ZwGA6d9bKKSSD59w0ISV0sOUUwTnyPiZ3gMGZR/v96mmqDXra0A==
X-Received: by 2002:a19:8c09:0:b0:549:43f8:824 with SMTP id 2adb3069b0e04-54943f8098dmr558221e87.26.1740643313017;
        Thu, 27 Feb 2025 00:01:53 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443bebd5sm98564e87.209.2025.02.27.00.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 00:01:51 -0800 (PST)
Message-ID: <d7982b76-3da7-47ff-b2b2-f964610af1f7@gmail.com>
Date: Thu, 27 Feb 2025 10:01:49 +0200
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
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com> <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
 <Z72d7TzZ21WITW3f@smile.fi.intel.com>
 <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
 <Z73M3Ua6u1FpgBEK@smile.fi.intel.com>
 <720f9c69-ca1f-45cb-9f6e-c8e4703c9aad@gmail.com>
 <Z78g_uiXumn4mvET@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z78g_uiXumn4mvET@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/02/2025 16:11, Andy Shevchenko wrote:
> On Wed, Feb 26, 2025 at 04:04:02PM +0200, Matti Vaittinen wrote:
>> On 25/02/2025 15:59, Andy Shevchenko wrote:
>>> On Tue, Feb 25, 2025 at 03:29:17PM +0200, Matti Vaittinen wrote:
>>>> On 25/02/2025 12:39, Andy Shevchenko wrote:
>>>>> On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
>>>>>> On 25/02/2025 12:21, Andy Shevchenko wrote:
>>>>>>> On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
> 
> ...
> 
>>>>>>>>
>>>>>>>> I did not check how many users are you proposing for this, but if
>>>>>>>> there's only one, then IMO this should not be a global function yet.
>>>>>>>> It just feels to special case to me. But let's see what the others
>>>>>>>> think.
>>>>>>>
>>>>>>> The problem is that if somebody hides it, we might potentially see
>>>>>>> a duplication in the future. So I _slightly_ prefer to publish and
>>>>>>> then drop that after a few cycles if no users appear.
>>>>>>
>>>>>> After taking a very quick grep I spotted one other existing place where we
>>>>>> might be able to do direct conversion to use this function.
>>>>>>
>>>>>> drivers/net/ethernet/freescale/gianfar.c
>>>>>>
>>>>>> That'd be 2 users.
>>>>>
>>>>> I haven't checked myself, I believe your judgement,
>>>>
>>>> I took a better look and you obviously shouldn't believe :) The gianfar used
>>>> of_node instead of the fwnode. So, it'd be a single caller at starters.
>>>
>>> ...which is the same as dev_of_node(), which means that you can use your
>>> function there.
>>
>> I'm unsure what you mean. The proposed function
>> device_get_child_node_count_named() takes device pointer. I don't see how
>> dev_of_node() helps converting node to device?
> 
> dev_of_node() takes the device pointer and dev_fwnode() takes that as well,
> it means that there is no difference which one to use OF-centric or fwnode

The proposed device_get_child_node_count_named() takes a device pointer. 
I don't see how dev_of_node() helps if there is just of_node and no 
device pointer available in the calling code. (Well, as I wrote below, I 
could alter the gianfar code by dropping the gfar_of_group_count(), so 
that I have the device pointer in caller). Anyways, I don't see how 
dev_of_node() should help unless you're proposing I add a 
of_get_child_node_count_named() or somesuch - which I don't think makes 
sense.

> API in this particular case. Just make sure that the function (and there
> is also a second loop AFAICS) takes struct device *dev instead of struct
> device_node *np as a parameter.

I think I lost the track here :)

>> I think I could actually kill the whole gfar_of_group_count() function and
>> replace it with a direct call to the device_get_child_node_count_named() -
>> but I am not at all convinced that'd be worth including the property.h to a
>> file which is currently using only of_* -stuff. Well, I suppose it can be
>> asked from netdev peeps but I am not convinced they see it as a great idea.
>>
>> If I misunderstood your meaning - please elaborate.
> 
> The driver is quite old

I remember having to modify this driver somewhere around 2010 or so. :) 
Time flies.

> and has a lot of room to improve. Briefly looking it
> may be almost fully converted to fwnode, but it's not your call (only if you
> wish). Nevertheless, using agnostic APIs if they reduce code base is fine.
> We have drivers that do OF and fwnode mixed approach (for various reasons,
> one of which is the new API that is absent in OF realm.

Well, we can propose this to netdev people but I wouldn't be surprized 
if they requested full of_node => fwnode rewrite instead of removing 
simple looking loop and bringing mixture of fwnode and of_node in driver.

Yours,
	-- Matti

