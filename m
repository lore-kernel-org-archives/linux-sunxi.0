Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2775F38DF9
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Feb 2025 07:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740642374; cv=none; b=ZgzLELbZuM2frZ8Mbg/mebfSFfgur0ciDGwlmT466YgmIRHKaMV6S2/JfgveBCGvKG2OCryZ/WuD1ZmJAfTSwJcHxs0v/d4moQ3FIgQ3+yfPWKZxwKFLzXNKt3TNZRxlQ1yqvVJI1GfG5OmgmEfF7BXbZXGwoX+BudCZcjhg80U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740642374; c=relaxed/simple;
	bh=NW+ec2UuJ/FXy8L1uMkrLm158JtfwpfDLNYHmBO9VdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJ1ZikzKqe1gc1qarjoEvXurdQaarhp+E5rpcCGELKEEFPfGYI1HdWSzA7IdiDkW5rrEHJG+3vxqG2R4LMuRCIT1kN8v5LbwAUeT33kEuQbqCK0dK3n+Dr/N3c6Cnc3mAdmLDbr0BM11VKIahj6yYYDDls2XVB1WIjUfgMcMiWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7vjEcov; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7vjEcov"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54622e97753so670405e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 23:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740642370; x=1741247170; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtUYvUWC1AkG8jyAiGXYjz4SHzVwMltIbWsY/nE9gH4=;
        b=Y7vjEcov//0qeEVm6qwRpyrwJ1G99poRS3DkU3UbZlMZux6C23kJeEsCDBwy96NMsI
         WBW2EznimKffoZDhR/W/FKqXQexSQBTjxESXgc1SaJlX8kbrewvfTXIQb8P+FIlTx6nM
         yDv0LS1tTLjAQxemqCjZGszQb8sojTFJjRX+YAUIrxqq4J0qL9GW6SkWurMbQg25lfZ3
         cZXCHunFigHjmdk4/NwzVNPCLRQk3dHiHjGIDVgsR9K2wQ5n1RcOtvdZcXyYgxFuGG/0
         nuREAKFRQSvCv/vIBZK2pO2gvh73QE/Cwa6FwPclbO50SsalB8ceRM4BmfYeZIbyWwA8
         IO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740642370; x=1741247170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtUYvUWC1AkG8jyAiGXYjz4SHzVwMltIbWsY/nE9gH4=;
        b=Nr4ERf0CaszoH/qkTdmaW1a/8tARhbgfujFXbL8lIuLBcHwk9KE2i4EUx9+Jb0ERk9
         3Ufe+iKFc2znmgaX9U8fMCXgLMotOBdmIBhr2auu1e73CxzIzwz/cLST1P5/NEq2DcHl
         Ya4R1IW0MSc/5gTrkDJjg0P1Kg5ZvNeB3DSVPqvr14m5978PzvqlJct0WMz9DSd4Fenq
         fUK4NgXjP4DO5MehY9cN/PMehWD1tOmzrH3aQhzxrnuTUWpjBtspJoRLYbiP8R5PCLAV
         lsjUYhGDQ6cxMsmMzTHkI7mRRULARQrU1WbghVe3vdY/+AYs16ii56hoi81JjB+mx6IO
         J2Sg==
X-Forwarded-Encrypted: i=1; AJvYcCU+QfDOBuyTNfAMBW560PBAvMqj+bNYB5/jdE4RPDsHk37Q4w026yxJfLA7Pjv+QFLoSLosQykS6MYUoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoOgzPE4qL1qNUVb8rpUgNZIibbR2WE7tHcrxepL56WCH/U5G5
	qrxNyAQFsdmSbT8OBL8SreE4HXM3F6wTRD4eYhXC19SV1h1pDJez
X-Gm-Gg: ASbGnctm+FMSoH5zoOYAWNx39UH5EgIGwTT9ngemHpj3dS8Vs6LQmAHdtJ/hhdTp+ns
	y2UTp3t1Jwts4n6S1lgS+OOrOeZHg0Lsiiz0/UoN/GwysTP4x0O1q5Sd3fCplqhXtnbTTSxdoqt
	navRJEqfQpwI8S8gfkL4cSduod97nTPlg4V2Q0Te5/yzRXJj1O+4i9LBh+YBKkCp5uY7cZkXedh
	pV5OyUA8sxa0QrZrXb6eoqlzewP7CC2dLtiFtCTGZP19bnF5DvGTQY/8jioN3/QvYCCAMZ1+qX2
	MSOuucmkYtHlJLiDC34TLbUmXUgBf6EDJa5tap5NfkBGYaZWZXfFqHr2ClNmdbSNBuGc5eir9IM
	+mZLmwkc=
X-Google-Smtp-Source: AGHT+IFFyAsXsY4HRaIHHuW3BNl5wcOAhXKEwTKsY23Y5b/QvWafl4HHhRh6kgPntviPRCAyMbQxbQ==
X-Received: by 2002:a05:6512:1093:b0:545:2bc5:e27f with SMTP id 2adb3069b0e04-549432de182mr953232e87.12.1740642369865;
        Wed, 26 Feb 2025 23:46:09 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443b1143sm93497e87.116.2025.02.26.23.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 23:46:09 -0800 (PST)
Message-ID: <9180ff11-888b-453d-9617-4b3a0fb38d91@gmail.com>
Date: Thu, 27 Feb 2025 09:46:06 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
To: David Lechner <dlechner@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
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
 <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
 <0de7b0ac-eca5-49ba-b1b3-f249655f3646@baylibre.com>
 <1b308a10-9622-47f9-b489-bd969fbdfc34@gmail.com>
 <6f6e6550-5246-476f-9168-5e24151ab165@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <6f6e6550-5246-476f-9168-5e24151ab165@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/02/2025 18:10, David Lechner wrote:
> On 2/26/25 12:28 AM, Matti Vaittinen wrote:
>> Hi David,
>>
>> Thanks for taking a look at this :)
>>
>> On 26/02/2025 02:26, David Lechner wrote:
>>> On 2/24/25 12:33 PM, Matti Vaittinen wrote:

...

>>
>>> Similarly, on several drivers we added recently that make use of adc.yaml
>>> (adi,ad7380, adi,ad4695) we wrote the bindings with the intention that
>>> if a channel was wired in the default configuration, then you would just
>>> omit the channel node for that input pin. Therefore, this helper couldn't
>>> be used by these drivers since we always have a fixed number of channels
>>> used in the driver regardless of if there are explicit channel nodes in
>>> the devicetree or not.
>>
>> I think this works with the ICs where channels, indeed, always are there. But this is not the case with _all_ ICs. And in order to keep the consistency I'd actually required that if channels are listed in the DT, then _all_ the channels must be listed. Else it becomes less straightforward for people to understand how many channels there are based on the device tree. I believe this was also proposed by Jonathan during the v1 review:
>>
>>>> Hmm. That'd mean the ADC channels _must_ be defined in DT in order to be
>>>> usable(?) Well, if this is the usual way, then it should be well known
>>>> by users. Thanks.
>>>
>>> Yes. We basically have two types of binding wrt to channels.
>>> 1) Always there - no explicit binding, but also no way to describe
>>>      anything specific about the channels.
>>> 2) Subnode per channel with stuff from adc.yaml and anything device
>>>      specific.  Only channels that that have a node are enabled.
>>>
> 
> Hmm... does that mean we implemented it wrong on ad7380 and ad4695?

I believe this is a question to Jonathan. With my ADC-driver experience 
I am not the person to answer this :)

_If_ I commented something to this, I would say that: "I believe, this 
question is a good example of why providing helpers is so powerful. In 
my experience, when we provide helpers, then there will be a 'de facto' 
way of doing things, which improves consistency". But as I feel I'm on 
the verge of stepping on someones toes (and I am really the novice on 
this area), I won't say that comment out loud.

>>> There are a few drivers that for historical reasons support both
>>> options with 'no channels' meaning 'all channels'.
>>
>> https://lore.kernel.org/all/20250201162631.2eab9a9a@jic23-huawei/
>>
>>> In my experience, the only time we don't populate all available channels
>>> on an ADC, even if not used, is in cases like differential chips where
>>> any two inputs can be mixed and matched to form a channel. Some of these,
>>> like adi,ad7173-8 would have 100s or 1000s of channels if we tried to
>>> include all possible channels. In those cases, we make an exception and
>>> use a dynamic number of channels based on the devicetree. But for chips
>>> that have less than 20 total possible channels or so we've always
>>> provided all possible channels to userspace. It makes writing userspace
>>> software for a specific chip easier if we can always assume that chip
>>> has the same number of channels.
>>
>> In any exception to this rule of describing all channels in DT should just avoid using these helpers and do things as they're done now. No one is forced to use them. But I am not really sure why would you not describe all the channels in the device-tree for ICs with less than 20 channels? I'd assume that if the channels are unconditionally usable in the hardware, then they should be in DT as well(?)
> 
> I devicetree, I think the tendency is to be less verbose and only add
> properties/nodes when there is something that is not the usual case.
> Default values are chosen to be the most usual case so we don't have
> to write so much in the .dts.

On the other hand, I've received comments from the DTS people to expose 
all HW blocks in the bindings. AFAIR, for example, marking 
power-supplies as 'optional' in bindings is frowned upon, because they 
are in the HW whether the SW needs to control them or not. Hence I think 
marking either all or no channels in dt should be the way to go - but my 
thinking is not done based on the years of experience on ADCs!

>>>> Add couple of helper functions which can be used to retrieve the channel
>>>> information from the device node.
>>>>
>>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>>>
>>
>> Yours,
>>      -- Matti
> 

