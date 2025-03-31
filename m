Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BEA29CEB
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Mar 2025 05:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743399583; cv=none; b=YUxtTWEv5TDB8Ety80aXTrKHLxnrX3ORrJQRHIcABOl2aRNwx2IlohjHmUlQTb4dBF5ZVLf+bBYYskDMZFUtR2AJzbwmrqqxiUQv9LfOfEy1bAvhc2OLcXduxPUsBpZdA0hr9pF0SqLE3t5OvBCN1SGFFVzJGmBGCYa2ZkJw06g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743399583; c=relaxed/simple;
	bh=IeA4lf0PVKOwd3spaqPGr7Zxq2RRfIFFLFhFKVVuUcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tIksl1ugw3oPC7wIeUTeI9BDW51xHMERSQfOXzlmS+L4QVdnVEhpzsRM6X9+Bt6nC+C4fzPWuKI+UFq77soCPI4lm9gFw0ULrfjNLh1jEfAHBiM8aWSvJ7ogIUR8UXbfaH6q59WXqoGWAXN9M2SfENg89ANK0e9siy0bQmnlVPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4hyAZ41; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4hyAZ41"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso40923191fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Mar 2025 22:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743399580; x=1744004380; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4AaMaaA3HgI5ZgkbFyIrsVuNy6uPjPTFn+suKBrfMsc=;
        b=Q4hyAZ41vSo+9TExGtpmD/9rAHXP4jGUsXKQVr0vAhh/Xh/YN1xChhQJSgFUUsId1P
         GQvwKWW3G/11iulohi+51I6Umu9W4aEceGeLV728FEEsfKYdM2cL/DIwVrqLY2lZu8ku
         30S+IE+sVkTe3aBOS7TlMMpUR0rtLcHNnLJUuNIAIGbxmLmThKeRzLwnb+S6WwyVfsMP
         GcgPah/djZaApCUC2dtcdTiy7e5XPkuqNRLOOTyt6azXNBCZ4CinSNGa0Lffn2mWUfW7
         l7gfvoXVGpA+Hipimlk+QiU+xFB7AlNTdFyPDL/utyLG1Iqpd2SfEarNdK8g/3IvwNmY
         3y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743399580; x=1744004380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AaMaaA3HgI5ZgkbFyIrsVuNy6uPjPTFn+suKBrfMsc=;
        b=BZmWcN0JUOgUuwrldHaceuHZtHXz7fjlC2DDcv2M26qvOwWFK9AnQ8KTdL+X42PJGE
         TAvvSiK9d7hKD36rNI4hAZIrG+WsqfBhJoEj6Gg5OGD5DSNNb8nvsXLQaZ5XYdB2+gIx
         vkL5Ls7ZfohpnQqD4IsJ623du+8fFjOu6CdtpWTP/vUnqEVvyj9bkSpgAcsX8B22CkcO
         xTTNY8ttrMu5G6tfXH/OPRysxBX8jCifrtrLFlvAY09tuQPPU3aI+GzD10n3O4ehl2wI
         ykZUfxnfiWZJm1ljTmxVwr3j1w7ZuV4v32sPUi12j/wXs7raoaBw0NjSpDtxu5kK3qwj
         TM+A==
X-Forwarded-Encrypted: i=1; AJvYcCWvmGIkb4GovXFlWEOsPAaN6x3PbVvcQdbaU5PugKF2yjBD00PoieubxkUmpgzXjDhF3FGwbRw/N5Ee0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPWp+qvBnQ/TRaKcro6tSor4zmy0h6DEurCcjEgH/AvAugtVo1
	sDKMygbzTvBRUeMaDeLX5h2mw1nSkYRA2yzZ9iOt5JKxvsF/rQkT
X-Gm-Gg: ASbGncsBLmCmyTqS39GwyUd8TJs09gL1EuaOiSOsINcezdC3yQ2I8x0xXZOj8mlBBkW
	MRPHpwA2zpoiOZRibRlrwlSXfoemmR0/sXx3Ne1NvSflqwsA/bzQoBvr3jkaAAY0xzQStyJ5nGL
	iGTG312L+95ToGn/Lxbn9f5+xM/4a2ZiMpSTseV/JM4bgakJVem5O4VM6A/vwis38vy4GVq/06r
	L8arHkwfDd6qiE3FCuEHhl11r9UPwaqHOl2dzVmytJ2Pwrx/3+ZpQJKAGXuNKuniSd7ojqDZriN
	XHVASG9MC1pq4mfrADP06+uJeA07uTfd7VVwbl/Ui6ymevkm17CVPgIGTs+LZJoAe282Gk3jyiM
	CCq6thNH7EOnjfMUMyzj5k8Wipv1wzCI4XfLb
X-Google-Smtp-Source: AGHT+IEax/bYtDNpsnoS8lp2/Xv0SOwDw+X/Qx+Fp6+LfV4yGOljFnL11rqq5UXPyHcC3DYhadI4bQ==
X-Received: by 2002:a05:651c:1590:b0:30b:b132:43e5 with SMTP id 38308e7fff4ca-30de0278988mr32677431fa.19.1743399579629;
        Sun, 30 Mar 2025 22:39:39 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b4ccdesm12941591fa.67.2025.03.30.22.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 22:39:37 -0700 (PDT)
Message-ID: <4d66b3b5-bfcb-42f0-9096-7c448c863dfc@gmail.com>
Date: Mon, 31 Mar 2025 08:39:35 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] iio: adc: add helpers for parsing ADC nodes
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
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
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z-mnNtYLkwsTYjMh@debian-BULLSEYE-live-builder-AMD64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marcelo,

Thanks for the review!

On 30/03/2025 23:19, Marcelo Schmitt wrote:
> Hi Matti,
> 
> The new helpers for ADC drivers look good to me.
> I am now very late to complain about anything but am leaving some minor comments
> below that can be completely ignored.
> 
> Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> 
> Thanks,
> Marcelo
> 
> On 03/24, Matti Vaittinen wrote:
>> There are ADC ICs which may have some of the AIN pins usable for other
>> functions. These ICs may have some of the AIN pins wired so that they
>> should not be used for ADC.
>>
>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>> add corresponding channels@N nodes in the device tree as described in
>> the ADC binding yaml.
> Not sure it's preferred to have ADC channels always declared in dt. That
> question was somewhat also raised during ADC doc review [1].

I had missed that doc and the review. Interesting read, thanks for 
pointing it :)

We did also do a bit discussion about this during the review of the 
earlier versions. I am not sure if we found an ultimate common consensus 
though :)

A recap as seen through my eyes:

- It is preferred to have either _all_ or _none_ of the channels 
described in the device tree.
https://lore.kernel.org/all/20250201162631.2eab9a9a@jic23-huawei/

- This, however, is not _always_ required to be followed, and it may be 
impractical in some cases:
https://lore.kernel.org/linux-iio/6f6e6550-5246-476f-9168-5e24151ab165@baylibre.com/#t

- We do have bunch of existing drivers which we need to support. With 
some very different approaches to bindings.
https://lore.kernel.org/linux-iio/20250302032054.1fb8a011@jic23-huawei/


My _personal_ thinking is that:

This means that we can't hide the binding parsing in the IIO-core. We 
can't go and change the channels in existing drivers.

But, we can provide helpers (like this one) for drivers to use. I also 
believe we should still try to have common (and preferred!) approach for 
the _new_ drivers. Eventually, the new ones will be majority. Some of 
the old ones die, and if we keep same practices for new ones, the old 
ones will become rare exceptions while majority follows same principles ;)

> In short, ADC
> channel may and may not be declared under ADC dt node. ADC bindings often don't
> enforce channels to be declared. On IIO side of things, many ADC drivers just
> populate channels even if they are not declared in dt.
> The ADCs you are supporting in the other patches of this series seem to require
> dt declared channels though.
> 
> [1]: https://lore.kernel.org/linux-iio/20250118155153.2574dbe5@jic23-huawei/
> 
> Would something like
> 
> A common way of marking pins that can be used as ADC inputs is to add
> corresponding channel@N nodes in the device tree as described in the ADC
> binding yaml.
> 
> be a good rephrasing of the above paragraph?

Yes, if we don't want to guide new drivers to either have all usable 
channels, or no channels in the device tree.

I think Jonathan said he'll be rebasing this to rc1. I am a newcomer and 
I should not enforce my view over more experienced ones ;) So, feel free 
to reword the description as Marcelo suggests if you don't think we 
should prefer one direction or the other.

>>
>> Add couple of helper functions which can be used to retrieve the channel
>> information from the device node.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
> ...
>> +static inline int iio_adc_device_num_channels(struct device *dev)
>> +{
>> +	return device_get_named_child_node_count(dev, "channel");
>> +}
> I wonder if this function name can eventually become misleading.
> 
> In Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml we have
> temperature sensor with channel nodes named after external hardware connected to
> the sensor, leading to channels having different node names. Can anything like
> that ever be accepted for ADC bindings?

My initial thinking is that the hardware which is connected to the ADC 
should have it's own node - and there should be only a reference from 
the ADC to the other hardware's description. I think the connected 
hardware should not be a property of the ADC channel.

Anyways, the current ADC binding (bindings/iio/adc/adc.yaml) says the 
node name must be channel[@xxx] (which, I believe makes sense as it 
makes it easier to understand device-trees for ICs which may provide 
other nodes but ADC channels too).

properties:
   $nodename:
     pattern: "^channel(@[0-9a-f]+)?$"
     description:
       A channel index should match reg.

Yours,
	-- Matti
