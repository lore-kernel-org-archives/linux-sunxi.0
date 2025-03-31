Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDAD1D9A54
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Mar 2025 09:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743415081; cv=none; b=a7v9g1U7iBqoHeS+lYn/BLRnI63Kwy3NsgE7NiIghDzVgSewWFIQfSY3u6gV2Pmge6F9Ce0KS9+9sAHA8pcdNVBx5pCdgs9gsUAx8GF5qVj25n8wes9PVmj6jtYoG4cR+mIbSs0xuBaegxAdIn/RLiEQu9KKfkHpwKb7sO3Fx6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743415081; c=relaxed/simple;
	bh=yK7nu7eWJM3nujHNfRadysWMa7kXdY+e6WXSaZJuUlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1Q3Y5kONM+q9zqE+9cGFCQTRXc5b5wKicwJ1KNQsSR7dfYmnnXSr6tO1t2ZqmXakDgNMrvU6YOw7PUUunXhOtV1/aClSzGMSV1rBB5d+WqzvjTOa2X7ysWWHox32RazJA8fR1TxBNO7INr3hl9b2R421jjQ4OfWHtJj4FI3vj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbdavELC; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbdavELC"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54af20849bbso2678161e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Mar 2025 02:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743415078; x=1744019878; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGBJfvaNnxtRD6hIkqEgxjYX8qkJ7qsN5lK/+BN2aO0=;
        b=NbdavELChKtr8icwNQsZPKDEEKDhU23d/Kapyvqj073OBflsSVNbMn6v4uaQsqSJiv
         90rJ/n/QHpFBQYj3O0Yjs1l1jVuZ8ZeEilukxGWV6j0XIdUyPHlbv7MbGfhsAMFFkXFF
         i5JkwAF5CXId+adf+hhahX3Gh+W8w8O9RyGMWu6rn8hdIefPytDijifqergnzboA0HZb
         b6G68QFzdMFqyKtpg395ZppgN5JQrgNqUTXJI9ErGyF3lHgVJwCah5RCEYCNv3u5iimA
         1I3wyWZEjH6PE/w0yUe/Lk0KwXKm6L2+a6w/Ab26FbnSD4WlwOrMFjD91xTbeEOPHP+W
         5ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743415078; x=1744019878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGBJfvaNnxtRD6hIkqEgxjYX8qkJ7qsN5lK/+BN2aO0=;
        b=AQikqSLiS9yNwp23Tz3Ps+Qz4jNKBrYuq3BClnXuINbpYFsvYcyi6sAGwA2uCvJJGO
         KVN1xhuG5byThT7bOvZgC/Q/SUcTBsAgxTnH1xAlXpFViwwPERDYymBQ1jItn7bWf5C1
         4pQG4LlG1V3d8O3q96ZfqUOI/KtM3IjZ3hrMkXn2W7bD05xztGngV5vcqdTKyzMqjUEk
         HhWX4u1r9GqX9ArvR/PpuUy2hLD7PgII4NqeRBYW4aaJqlM79TBBHjxbY9I4tYe6GEqB
         2Xh6q1yoiAn9hfOXcvS5+b3blTOor7GN3rRZPX70IPk5ZJVtxvTPCw5b6L70fQH4LY7C
         ioXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtsflnOtKkQMHoFEzFEhWvumViuBYmRo1tGxhhJil7jDuyXU8jh/V/mk7+cOXyPoBirU7DfnRy6wbZ1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQM1umcAB9rWh0CeLrQTcgev7IyeVw5cMizk3Lx3F84pc1M7q4
	1pW3V4otkiXiLsyLlG9XNTwS/d52yHSg9FlqW6plWrTwjr3Rmc8W
X-Gm-Gg: ASbGncvkwQedgYmFO5EU66AnZKqcBDmBxpr76qNbMGzvr5RKAr8tZnRkF1Wk5r6WsZ2
	ZRLW5eTyURgzKUU7cRpK+gIxNOlmQX1XLMvropj+NhGzX2n9kdzRy2LCxATmZCPF5QvZpgERzYr
	e7HoWWC4J6rt8g87ZhajUnu0r6o7imVVcdlgzK+UtWPz8jT3zKhskLB8NrITwjyd5KD71zQjnZR
	zeG6r/u8iU5k1WSc2ydpzSuSjRG4Yjto8DRgRBG42gX0tGiWZYPLl0icWCLkAswqso0VgXSza5e
	Uj0Ep5RObCjkfCVXmDHUBq+rAAlK9ckspFw7Q/HoNpK3KedOBsCwSiwiH//DRzJDjkQ9dOS5Bue
	vmmAPrCg1xcIDDFA7vY2heKU4bA==
X-Google-Smtp-Source: AGHT+IGqeY06WugE+f6xFNsS8xeFCBQw/6TOQOGCtpw4PCZBd5XxHX4TAt+/prfgf/QFIXCNENTg8Q==
X-Received: by 2002:a05:6512:a95:b0:549:8cbb:5441 with SMTP id 2adb3069b0e04-54b10dc7c04mr2303336e87.15.1743415078069;
        Mon, 31 Mar 2025 02:57:58 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b103721f6sm786241e87.108.2025.03.31.02.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 02:57:57 -0700 (PDT)
Message-ID: <2f977814-bd9b-4b54-aa77-a36edb56e194@gmail.com>
Date: Mon, 31 Mar 2025 12:57:55 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] iio: adc: add helpers for parsing ADC nodes
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
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
References: <cover.1742560649.git.mazziesaccount@gmail.com>
 <f1d8b3e15237947738912c0d297b3e1e21d8b03e.1742560649.git.mazziesaccount@gmail.com>
 <Z-mnNtYLkwsTYjMh@debian-BULLSEYE-live-builder-AMD64>
 <4d66b3b5-bfcb-42f0-9096-7c448c863dfc@gmail.com>
 <20250331104849.3eb748a8@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250331104849.3eb748a8@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/03/2025 12:48, Jonathan Cameron wrote:
> On Mon, 31 Mar 2025 08:39:35 +0300
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> Hi Marcelo,
>>
>> Thanks for the review!
>>
>> On 30/03/2025 23:19, Marcelo Schmitt wrote:
>>> Hi Matti,
>>>
>>> The new helpers for ADC drivers look good to me.
>>> I am now very late to complain about anything but am leaving some minor comments
>>> below that can be completely ignored.
>>>
>>> Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
>>>
>>> Thanks,
>>> Marcelo
>>>
>>> On 03/24, Matti Vaittinen wrote:
>>>> There are ADC ICs which may have some of the AIN pins usable for other
>>>> functions. These ICs may have some of the AIN pins wired so that they
>>>> should not be used for ADC.
>>>>
>>>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>>>> add corresponding channels@N nodes in the device tree as described in
>>>> the ADC binding yaml.
>>> Not sure it's preferred to have ADC channels always declared in dt. That
>>> question was somewhat also raised during ADC doc review [1].
>>
>> I had missed that doc and the review. Interesting read, thanks for
>> pointing it :)
>>
>> We did also do a bit discussion about this during the review of the
>> earlier versions. I am not sure if we found an ultimate common consensus
>> though :)
>>
>> A recap as seen through my eyes:
>>
>> - It is preferred to have either _all_ or _none_ of the channels
>> described in the device tree.
>> https://lore.kernel.org/all/20250201162631.2eab9a9a@jic23-huawei/
>>
>> - This, however, is not _always_ required to be followed, and it may be
>> impractical in some cases:
>> https://lore.kernel.org/linux-iio/6f6e6550-5246-476f-9168-5e24151ab165@baylibre.com/#t
>>
>> - We do have bunch of existing drivers which we need to support. With
>> some very different approaches to bindings.
>> https://lore.kernel.org/linux-iio/20250302032054.1fb8a011@jic23-huawei/
>>
>>
>> My _personal_ thinking is that:
>>
>> This means that we can't hide the binding parsing in the IIO-core. We
>> can't go and change the channels in existing drivers.
>>
>> But, we can provide helpers (like this one) for drivers to use. I also
>> believe we should still try to have common (and preferred!) approach for
>> the _new_ drivers. Eventually, the new ones will be majority. Some of
>> the old ones die, and if we keep same practices for new ones, the old
>> ones will become rare exceptions while majority follows same principles ;)
>>
>>> In short, ADC
>>> channel may and may not be declared under ADC dt node. ADC bindings often don't
>>> enforce channels to be declared. On IIO side of things, many ADC drivers just
>>> populate channels even if they are not declared in dt.
>>> The ADCs you are supporting in the other patches of this series seem to require
>>> dt declared channels though.
>>>
>>> [1]: https://lore.kernel.org/linux-iio/20250118155153.2574dbe5@jic23-huawei/
>>>
>>> Would something like
>>>
>>> A common way of marking pins that can be used as ADC inputs is to add
>>> corresponding channel@N nodes in the device tree as described in the ADC
>>> binding yaml.
>>>
>>> be a good rephrasing of the above paragraph?
>>
>> Yes, if we don't want to guide new drivers to either have all usable
>> channels, or no channels in the device tree.
>>
>> I think Jonathan said he'll be rebasing this to rc1. I am a newcomer and
>> I should not enforce my view over more experienced ones ;) So, feel free
>> to reword the description as Marcelo suggests if you don't think we
>> should prefer one direction or the other.
> 
> I've gone with Marcelo's suggestion because I don't want to be too specific
> here given the complex history.   We can absolutely encourage the all or
> nothing description going forwards though as it is logical in the vast
> majority of cases.

Thanks for taking care of it :)

Yours,
	-- Matti

