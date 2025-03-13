Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C107326772D
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Mar 2025 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741871857; cv=none; b=VWY/D185nIv+P0DpITojKHCo4ocW6BQuW35ZXEcAMO8X/Os3ibvbIBDYYpy0jHyfMlPzF92eLSRFqM6lifcP8RR+FCO4MOSJj6mw+vvyP4XZr3kY+6EUko8SljVA+puEIhKTUFWIcSnC//7bYguksEYpBXH8fOClcmTbnqju+Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741871857; c=relaxed/simple;
	bh=kkaM9TxXGoRauSWyPFM1CfAT8bnaddnIbIa/Vm9rMiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4GhLTOSOi/TAbtQGT2zkj5it3yMgSDWKJqhdbDZEwI/CpUa/02hLUly1QA1DFTakHgGmghPmDKucX3xv1eYCyrTLiIrA9K+M0fjiET+CpCvBKzPpx2Kv7LWkORJmITeb5TrULn/04FjTN3g/jvWwLKM6cThCNnksuB0cRVG6j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxC1kOsd; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxC1kOsd"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30c461a45f8so51401fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Mar 2025 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741871851; x=1742476651; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMtd4Ct3saMXFXwwgDnBOHF0+oIR6E5UNtteZil5UN4=;
        b=TxC1kOsdpOlq7/y7o4PWXdhHMDes6bAkcnVGtOSAuwcz77Gm7RYdVDY/U7BQDB0z0p
         LoY1kt5SKXSDhkER2AfONVU3JzIz/TyJyVJOgu93cv321sjn8Af5FGXVSoKm74XNgCef
         hY3dr+pSLyLGXxuU4dfCRHbfyZNVsFfAxQnC6r+gdMLqb4G8DsPCwwYMNL3aRVtmriUP
         IziZrGPm29vLELpsBoiXuyyhR/50/NrMg9iRd4n6qZO4kRNg8XACUQq1vFyhPSBtKTqS
         YBisdMiPOWw+3x+wDFa0UqqLMuHct3+HaK6uwkU6VQh9D11ydLjNlUkupEMez8i2LieR
         xl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871851; x=1742476651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMtd4Ct3saMXFXwwgDnBOHF0+oIR6E5UNtteZil5UN4=;
        b=UBGGLptuR+TJrpoLdlrT0GsNZixxkGfU2/NtrEIN+r0g0IH41grXa5DCsxGqvJTO8J
         OM2SAZiCGGRH9JmUOCvEKcgS8DFK5SYNl0E/SlD6kbtDXrZXJnIXI4tPsDkv5qcgDMnb
         gTWAPe1rkQV37u7l3XoYk5UJep4dwdLB2NMHO3f0WEzTeInMuKaDA//ODkFY0SycnpaO
         UpIyPWyRJr8hlMG+FtoGeGbhRFsgKbdzqbEZgJP0V9RGelpNXARaV10eX5XqR6xvQDK6
         NLW/l9sJWu4U4HlTlBttDVwtRRU4IqfaGLRw77GIYKzH0RgEaqj7ACbt/tDSetQODIyY
         1RIA==
X-Forwarded-Encrypted: i=1; AJvYcCUIoOtA47VmhVEv7oImfH1w9N0BG5zBvYlzrF7QqpwAjmosRrZwzSeTQ3CpKHmTwS4ExXtq+yNuY2c9bA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYqNAMUpURKMhPazJ/Msr0xAOocG/RGyMSOrr0nFsgwhbn6RM3
	G4sCAdPABlz1xQCm5gUQBIabvzF19xWlpmwLpDKaxaOlfs0o4BHa
X-Gm-Gg: ASbGncsqY25k1FG0cQiHqFCjM4SddIX9VZ76WejwJ4azISuhsGyrqobFjv4MaThVBss
	rOm+ZNrrs1z6P4TUzNivos/QAuk/uQXUW1Wqj61a15N+0FW6H6pI89C3eo4ZeBsQQmW2yRqNZpw
	En65UH6oIylmQuQhOaVf0VG0vb/r7edm92OONCZCsBqCtWmf7Sa/iS8p61Vz/sb/2zC9iOQZr0r
	f6X0kiIZ+Rdnoq7E+CDJO+JT0n8tNXIMNm80ea76m4RtE7B4+2ph73mWfVjbKb51LFYPWMFug+h
	4sNBBOm2me3iqXjnywotmh5zrw3Ksvv0ygCwR6UDtycGpPTH+DGC2vw0iTdTZt7br5i6iMG+938
	H8mh6eLkSzQTeIrz22Vl987lukw==
X-Google-Smtp-Source: AGHT+IGUUl0LVmN96xFU94Q8pBwvgPJWhTup+0iU4QVNU/cc+uuXO+92xsYm0ESUYd6MtzARCUk8Xg==
X-Received: by 2002:a05:651c:2106:b0:30b:b204:6b80 with SMTP id 38308e7fff4ca-30bf44eda0cmr93616221fa.8.1741871850985;
        Thu, 13 Mar 2025 06:17:30 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1da3d2sm2136881fa.92.2025.03.13.06.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 06:17:30 -0700 (PDT)
Message-ID: <bca95d63-fb6e-4d6c-8ab6-df67f0e697e6@gmail.com>
Date: Thu, 13 Mar 2025 15:17:27 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] iio: adc: add helpers for parsing ADC nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
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
References: <cover.1741849323.git.mazziesaccount@gmail.com>
 <c8899e8c535a1d93cd7588b7c160eb0fae5d26d2.1741849323.git.mazziesaccount@gmail.com>
 <Z9LQFqSweiV-zT3b@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z9LQFqSweiV-zT3b@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/03/2025 14:31, Andy Shevchenko wrote:
> On Thu, Mar 13, 2025 at 09:18:18AM +0200, Matti Vaittinen wrote:
>> There are ADC ICs which may have some of the AIN pins usable for other
>> functions. These ICs may have some of the AIN pins wired so that they
>> should not be used for ADC.
>>
>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>> add corresponding channels@N nodes in the device tree as described in
>> the ADC binding yaml.
>>
>> Add couple of helper functions which can be used to retrieve the channel
>> information from the device node.
> 
> ...
> 
>> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
>> +					  const struct iio_chan_spec *template,
>> +					  int max_chan_id,
>> +					  struct iio_chan_spec **cs)
>> +{
>> +	struct iio_chan_spec *chan_array, *chan;
>> +	int num_chan = 0, ret;
> 
> Unneeded assignment.

Hmm. I have a deja-vu. Thanks for the reminder.

> 
>> +	num_chan = iio_adc_device_num_channels(dev);
>> +	if (num_chan < 1)
>> +		return num_chan;
> 
> This is really interesting code. So, if the above returns negative error code,
> we return it, if it returns 0, we return success (but 0 channels)?

Yes. I don't think it's that interesting though. Checking the devicetree 
succeeded while no channels were found. I think returning 0 is very much 
aligned with this.

> Shouldn't we do *cs = NULL; at the case of 0 channels if it's a success?

I suppose you're right.

But, as you pointed out in review of the 05/10:
 > Usually in other similar APIs we return -ENOENT. And user won't need
 > to have an additional check in case of 0 being considered as an error
 > case too.

I don't know whether to agree with you here. For majority of the ADC 
drivers, having no channels in devicetree is indeed just another error, 
which I think is not in any ways special.

However, for 33,3333% of the users added in this patch, the "no channels 
found" is not really an error condition ;) The BD79124 could have all 
channels used for GPO - although this would probably be very very 
unusual. (Why buying an ADC chip if you need just a GPO?). Still, this 
wouldn't be an error. (And I need to handle this better in BD79124 probe 
- so thanks).

> (Under success I assume that returned values are okay to go with, and cs in
> your case will be left uninitialised or contain something we don't control.

I see your point although I wouldn't be concerned with cs not being NULL 
for as long as number of channels is zero.

Anyway, I think it makes sense to simplify ~67% of callers by returning 
-ENODEV if there is no channels. The remaining ~33% can then check for 
the -ENODEV and handle it separately from other returned errors. So, thanks.

>> +	chan_array = devm_kcalloc(dev, num_chan, sizeof(*chan_array),
>> +				  GFP_KERNEL);
>> +	if (!chan_array)
>> +		return -ENOMEM;
>> +
>> +	chan = &chan_array[0];
>> +
>> +	device_for_each_named_child_node_scoped(dev, child, "channel") {
>> +		u32 ch;
>> +
>> +		ret = fwnode_property_read_u32(child, "reg", &ch);
>> +		if (ret)
>> +			return ret;
> 
>> +		if (max_chan_id != -1 && ch > max_chan_id)
>> +			return -ERANGE;
> 
> Hmm... What if max_chan_id is equal to an error code?
> Or in other words, why -1 is special and not all negative numbers?

-1 was just picked to represent a 'don't care' value. Old habit. In the 
old days I handled lots of code where -1 was defined as 'invalid' for 
APIs with unsigned ints as well. It works nicely on systems where it 
turns out to be maximum positive value - leaving most of the number 
space for valid values.

I suppose saying any negative means "don't care" works well here. And, 
dropping all negatives here will also make the check below just work 
with unsigned comparison.

> Also note, you used unsigned type and compare it to int which,
> in case of being negative will give promotion.

Right. I didn't thin negative IDs would make sense and trusted users to 
pass only positive ones. Treating all negatives as "don't care" is 
indeed better than trusting this.

Thanks.

> The ch will not be
> big enough in most cases (unless it's great than (INT_MAX + 1).
> 
> TL;DR: you have a potential integer overflow here.
> 
>> +		*chan = *template;
>> +		chan->channel = ch;
>> +		chan++;
>> +	}
>> +
>> +	*cs = chan_array;
>> +
>> +	return num_chan;
>> +}
> 

