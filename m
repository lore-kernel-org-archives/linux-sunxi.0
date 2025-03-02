Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD861D7982
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Mar 2025 12:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740918182; cv=none; b=C8LkiSWupzkhQAfmsEfSz++Mvk0WeP9ScTnP5e+N4dCTng2aEQanYN3n4RNVuyrVHlc4VCi1oqGJ7TyJC71eKcCWT5bAQfyDyx+m8iXvOwsl9WdDF5o137Bw2GgF3cUnwQCc78HYfizfIgzIlWmXH/egqDJL8/rOR4TXjCtHAmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740918182; c=relaxed/simple;
	bh=hKBTReK3pH8mU/iYRfyBVCfJp0R5KMbvtZlOdcY8Wf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWzqzqVnwQNhviyMgJNOPb+yCEYL233GZKluLLLur90A6Pm/AdOf4HvzRiVJAZ+PIcIxuv+SgD7qbRe1FpqC9L8iaAz4igAoALzzKtyjwzdCpXfRk7NZ7KyKbqVF7gxJVS7gr5hSYQsWBLN8KKJh7Jqhylb6CESCv5o36NBMjcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tte56qKR; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tte56qKR"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5495e926364so631908e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Mar 2025 04:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740918178; x=1741522978; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fEnnc1dXj5lNrYUNbaQiHP03Z2g3b2VRGVuLnQpfuiI=;
        b=Tte56qKRVdAVDWWmfst4CNo0uHnNyDy2s4F1VfLC3nBFTNhTEJ8PbfkAVGcR/fIG3S
         ItuORIsD+Paz7t6zXaoR4vsUanYMoBp+aL86H5Akox3INa/BqFFP/sjKCBEmmEZvweTj
         RYcdq48YXjufVOpmlVYuQVV5Odim9XDAMK8s2IhzQBqyYpcvcA/bHtiRGBILgNVl32M9
         4TTfQn1QixDKjLeB/DbDOI6GwFpqFS3PMIUVHziOpy1Gf/8XyHt+nd+BbmXH9tM5UyY8
         Aknwa7RUvUuDg3qa+GoWsyCn5QFgKTj2vgitaIC50QK2Q5UjUHQL1ID/xptTorns/dyy
         nNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740918178; x=1741522978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEnnc1dXj5lNrYUNbaQiHP03Z2g3b2VRGVuLnQpfuiI=;
        b=REDOcOsUNsiOfa7tz+DCV1+YHfz6SM/nvRSiEECMpJ3k1C+EBRegq1AFarsGl0PhLN
         nh0URxR/ErADtTHI/pmEEdNHUxwyiPjoHF1yylvzlA3BnVHcyMfRrt2VPhNUYEOGb+PS
         kz95AG3spbXV+VUKXkylyOL3U6rOho/iu+3dlicX19jwhd+Boq/AAxPSABJQ32IKO4Yo
         lqLI9H59FBJuGpsaGKzg8NXnNlhVXJ2lkFWq6rS5c6gtdmls+dqtzDR7Q6vuEglpAnFU
         LuhI9oT2q1P5PEtTbHV2dp2ok1oiIQn30p6EDB3ecdHLt1L3zr0OR64q/vq73OfoA94+
         N/Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVb5wavxptoKyZA2ci/HMowHJnsFfvF17T4t8jbB94d9oswC5aFwt7yPx21OpAgvofH9qVy/oLLfwEF0g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9fPa0/aAwXtCbTJeA0LVE2umIvZtHK3XqBTWy3mP72qytIDQZ
	CAwsm/OFq+a9d82CFok/uJWT82NMGsBt7XkGffZ8CkrhNvx2p8v0
X-Gm-Gg: ASbGnctZbX8AXhiuHSnwvUsHtfrt+K/4kXtZDCa0QH4IobBY+dzZOJntTMekI9FmTNo
	98f3WUOSFtzeEaeUxIV0812GtGyr1XNOgt9qkXswovV/Ew3pb45O2YW1NtuJJCsUIG6N5n/syNp
	D0VwrdgAIiyuenrDWwKOiwaB3pDZY1a4aMKGG0aLuKGsuah7ttqfNKTO6AK6dGagF7ZEl9IsBsN
	RcsgrfrkFHreeo1FENI9NXoAPvGn0USMkVoa/Epsl9/frsrARW7we6eVm2yBtJuAnZkS0Z4gOfB
	oas4diMtUSH5W/LhCxWoUCCgta7FF/kU8kMpzYQNgUANlJNsZU/ocS7WsVQLir7zi4F/zGr2Tku
	ScCOfq5o9lRLQCw10ATObdPSWuw==
X-Google-Smtp-Source: AGHT+IGzZOd1/B02IxZfr4aBje6krfoPxLPc1fsPRoUlTQWF7jrLAwZCd5QWTmq/yw9opL1lzwKo7Q==
X-Received: by 2002:a05:6512:1044:b0:543:baa3:87ab with SMTP id 2adb3069b0e04-5494c354581mr4068349e87.47.1740918178086;
        Sun, 02 Mar 2025 04:22:58 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bb1098ef6sm2276001fa.42.2025.03.02.04.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 04:22:57 -0800 (PST)
Message-ID: <44b1cc7f-a5e1-4c61-8b9c-1ba0c51e6343@gmail.com>
Date: Sun, 2 Mar 2025 14:22:55 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Rob Herring <robh@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
 <CAL_Jsq+av-fptMQqBeVieKwA9c7+uUCaqZMLGu-RVJzWZ_7+Vg@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAL_Jsq+av-fptMQqBeVieKwA9c7+uUCaqZMLGu-RVJzWZ_7+Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/02/2025 19:07, Rob Herring wrote:
> On Mon, Feb 24, 2025 at 12:33 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
>>
>> There are some use-cases where child nodes with a specific name need to
>> be parsed. In a few cases the data from the found nodes is added to an
>> array which is allocated based on the number of found nodes. One example
>> of such use is the IIO subsystem's ADC channel nodes, where the relevant
>> nodes are named as channel[@N].
>>
>> Add a helper for counting device's sub-nodes with certain name instead
>> of open-coding this in every user.
>>
>> Suggested-by: Jonathan Cameron <jic23@kernel.org>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> ---
>> Revision history:
>> v3 => v4:
>>   - New patch as suggested by Jonathan, see discussion in:
>> https://lore.kernel.org/lkml/20250223161338.5c896280@jic23-huawei/
>> ---
>>   drivers/base/property.c  | 28 ++++++++++++++++++++++++++++
>>   include/linux/property.h |  2 ++
>>   2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/base/property.c b/drivers/base/property.c
>> index c1392743df9c..3f85818183cd 100644
>> --- a/drivers/base/property.c
>> +++ b/drivers/base/property.c
>> @@ -945,6 +945,34 @@ unsigned int device_get_child_node_count(const struct device *dev)
>>   }
>>   EXPORT_SYMBOL_GPL(device_get_child_node_count);
>>
>> +/**
>> + * device_get_child_node_count_named - number of child nodes with given name
>> + *
>> + * Scan device's child nodes and find all the nodes with a specific name and
>> + * return the number of found nodes. Potential '@number' -ending for scanned
>> + * names is ignored. Eg,
>> + * device_get_child_node_count(dev, "channel");
>> + * would match all the nodes:
>> + * channel { }, channel@0 {}, channel@0xabba {}...
>> + *
>> + * @dev: Device to count the child nodes for
>> + *
>> + * Return: the number of child nodes with a matching name for a given device.
>> + */
>> +unsigned int device_get_child_node_count_named(const struct device *dev,
>> +                                              const char *name)
> 
> I think this should be implemented as
> fwnode_get_child_node_count_named() with the device variant being just
> a wrapper.

I thought of that but it'll mean we had two very little used APIs 
instead of just one. Well, perhaps we see new users though so I'll 
follow this suggestion for v5.

Yours,
	-- Matti
