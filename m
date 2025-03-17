Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE3A1C6FF3
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Mar 2025 07:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742195475; cv=none; b=VToHkiDW+XGskuikpcdrE65GsQQBoYocdpdA6Fp6df+Vh559j5HIt9/hlLmxkWJBT2XRDn5XuYq2lsNcW9NXxTLNI+EOpTzyRzrGBvml8BjCTzYrHRfHlU3TNJ/4jguBpMMrxNSsD0KT1F0XNSIN6X0nfGqlnXGbpSh49PQAvW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742195475; c=relaxed/simple;
	bh=bxC9ANzFX9uX0dn0RdpNnhuv0Rw4vLPvZggRh2iBFK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ysuxt37fM38zTdbnCOzhu/BBVUcLCZEwRoKEFeOYupf6fbGrF9rTzkMH8GsXUO7yp9lRmvyJUo/4bLerVyBt6rg9CbtBrIx5WAHFVHjUY1FJLq1/3FQLmLxS6YDw97YjodlY4yqCnHCJQux5LmpWhA7PagN1ak0yz99j1ErjXUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b09un03i; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b09un03i"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54957f0c657so4198148e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Mar 2025 00:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742195471; x=1742800271; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HalaitR3wNqHBLiZ26kGsVTmgpsmEjHSTSSRfu+eT1s=;
        b=b09un03i4+2/lXU/5NhkBsCd+fiEKByxJKt5c1hIzN/rN6Hx/v2MAtOtHEGHO6/KbY
         mcdmGznPBBntWD9OfWVeyyqN+wY+Rxe//0OpmQwuQQ/ApHHJugak81wl0y0sJOxe6QdT
         EOOBlP9o8E3PFiGcK6/wxWB8CTvywz1On2RaFBGCQ2y4dJDMC+/BKISe2wY3oAqpziwi
         kT5YXtudoEEqpKo3hvZFU/BOOiS8/hOGN09WoaNjEVndbM2zh2or/ZZ2QmP4oasH7WIb
         66ZXw0pnPReEkQPKo0a3GbHc5nDBonby1e+aq5w5ErHG/WaqQ+QjFA5Kgi1qamYhFJat
         fAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742195471; x=1742800271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HalaitR3wNqHBLiZ26kGsVTmgpsmEjHSTSSRfu+eT1s=;
        b=R8GsCuxQ6NwpTaynPYj4rzbHUKoeFZBid8lgLUZme3bMEbzYdpQ+app/t08+npPTGI
         JzesPTs/I8yPJz5DAEkzgzZKmuCw1MHSKW2Mi8xdBTCZvGMARRRt+IjtGJZ4yBJ0PCcj
         AhKzsnllPkqTnsU5/TnFsufp7Nq4Ag7c+h+vZo0UWsroqpn1QjXSfvZpK48jUCdp0z9C
         dK65mshh5k7T6Jg3+2ea8Gzib0U1Zgjsk5OMbn7GTxQgfOGq1fFxVqeVV23Vmb9NVhYG
         /3/brZmIjkZ00Tr4TiRPPuFW0SyiQUMYGe0pzWyfU6y7F5RvUXZI6m2oV/f5AjAGYEaI
         0pCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5rlAk4RlcXAHiIzrW7gt7SZix7lpJMFAOEDR6pcWHVj7EYtfixlcfPcAy8wkxBCWJzXOaAjo254SdlA==@lists.linux.dev
X-Gm-Message-State: AOJu0YylJqOd4PqKp3bK9JwWcaK+GO17H7Vdoj/cj2+khz6RemXfTaeX
	lzlOZeDV3BCeaUzPZ++68GeS2uUW6tJdFy1Z7qLd8cTxv/Z+OKmW
X-Gm-Gg: ASbGncsnbZJVKtC/gvdMl7qNZXJG1tI5Gnfzf4XEJiS6uqUoJmWfO80JfEMHMVFatZx
	CjXWDp9sBI1pWCCvtx9+I8RQ4MF2J1S5lY6yzIfwvAZIgALs0bYLLFsQ6FM8wW5xgvg8LELqAd+
	Cuk397hOLbhexBtgnk9vDxIM1l0gzj7oaifV2IZDDsEpad25nkzP5KgJPYPOrim57ZI5WqqxldX
	w80Vvbx3XMOt+Cs9Pp8S5MGewbcSxxdKZApRZLCTTCx+v+Xi2+e/pChfDDpmkfF4/JmI6IbM/R2
	OLIkOX+4tX52v+19R3MI40c1JtbDgOL+6zsvWIJWeBeXoFHGVgPhh8et2dnLIXLif+5Zb3BUh7F
	i4EP3hmziPm9MwhiUCM5ggCfpsA==
X-Google-Smtp-Source: AGHT+IGYn0VINpzgzh6MdKG0thylUkI/oz83FeKBKYjY8VACZiA9L37BUf8dAo+M8/olFMTjah+v2A==
X-Received: by 2002:a05:6512:118a:b0:549:8f14:a839 with SMTP id 2adb3069b0e04-549c3f23817mr5553692e87.11.1742195471393;
        Mon, 17 Mar 2025 00:11:11 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a761asm1220851e87.229.2025.03.17.00.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 00:11:09 -0700 (PDT)
Message-ID: <50b126c5-248e-4694-9782-4f28d6db5fce@gmail.com>
Date: Mon, 17 Mar 2025 09:11:08 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
To: Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1741849323.git.mazziesaccount@gmail.com>
 <df0b2b53affbef5ccb7219328cc15db3ba843737.1741849323.git.mazziesaccount@gmail.com>
 <Z9LQ0O34EUM8WZku@smile.fi.intel.com> <20250316094112.6731bd01@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250316094112.6731bd01@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/03/2025 11:41, Jonathan Cameron wrote:
> On Thu, 13 Mar 2025 14:34:24 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
>> On Thu, Mar 13, 2025 at 09:18:49AM +0200, Matti Vaittinen wrote:
>>> The new devm_iio_adc_device_alloc_chaninfo_se() -helper is intended to
>>> help drivers avoid open-coding the for_each_node -loop for getting the
>>> channel IDs. The helper provides standard way to detect the ADC channel
>>> nodes (by the node name), and a standard way to convert the "reg"
>>> -properties to channel identification numbers, used in the struct
>>> iio_chan_spec. Furthermore, the helper can optionally check the found
>>> channel IDs are smaller than given maximum. This is useful for callers
>>> which later use the IDs for example for indexing a channel data array.
>>>
>>> The original driver treated all found child nodes as channel nodes. The
>>> new helper requires channel nodes to be named channel[@N]. This should
>>> help avoid problems with devices which may contain also other but ADC
>>> child nodes. Quick grep from arch/* with the sun20i-gpadc's compatible
>>> string didn't reveal any in-tree .dts with channel nodes named
>>> otherwise. Also, same grep shows all the in-tree .dts seem to have
>>> channel IDs between 0..num of channels.
>>>
>>> Use the new helper.
>>
>> ...
>>
>>> +	num_channels = devm_iio_adc_device_alloc_chaninfo_se(dev,
>>> +				&sun20i_gpadc_chan_template, -1, &channels);
>>> +	if (num_channels < 0)
>>> +		return num_channels;
>>> +
>>>   	if (num_channels == 0)
>>>   		return dev_err_probe(dev, -ENODEV, "no channel children\n");
>>
>> Note, this what I would expected in your helper to see, i.e. separated cases
>> for < 0 (error code) and == 0, no channels.
>>
>> Also, are all users going to have this check? Usually in other similar APIs
>> we return -ENOENT. And user won't need to have an additional check in case of
>> 0 being considered as an error case too.
> In a few cases we'll need to do the dance the other way in the caller.
> So specifically check for -ENOENT and not treat it as an error.
> 
> That stems from channel nodes being optionally added to drivers after
> they have been around a while (usually to add more specific configuration)
> and needing to maintain old behaviour of presenting all channels with default
> settings.
> 
> I agree that returning -ENOENT is a reasonable way to handle this.

I agree - but I'm going to use -ENODEV instead of -ENOENT because that's 
what the current callers return if they find no channels. That way the 
drivers can return the value directly without converting -ENOENT to -ENODEV.

Yours,
	-- Matti
