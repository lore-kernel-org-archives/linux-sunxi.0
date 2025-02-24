Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CE21428E7
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 05:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740375610; cv=none; b=TU9WVxaz5if5lf/VSwdYoSPAp0dO6qUcH/oEVQ15/EnQUKdXGgvZjkncmYvWkjKEnp8DQ+iH/9K5NadNWxreDLfsSr00gau0z174FIGzu86IIEhCgU7ZLmstsjNLZdQCKXpBmBgPVu4MAHg4RnJyMbG3FwJIpezOtysFaRVpUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740375610; c=relaxed/simple;
	bh=ykTMvo5vM3ocHCW3+XjjML8AL9Bu7U93zqzCE7rZaq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufkSxPKRvIQ5K5lxyQ9vjsBlx+Td40mK03pP1KmWuEDJQDloke94eCpXvzfFqjCiCIf9y1oeogCtw/QxHXM4KggbFZOrhxEVLRIffdiZSZrKh2Po45r4b279Fmf0wELulvoHa8O/x+E7GcfofpbeTl7sbwdioemfXxlEGRVJr6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnUdatG6; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnUdatG6"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30a317e4c27so35006971fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 23 Feb 2025 21:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740375607; x=1740980407; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pki/JYWmmXNym2xztTz0HjhIt5MhQfFEcSVfA7kjWRY=;
        b=EnUdatG6gK+Ae9NPGJ4qo/CD8AFyUUuUqV127ipGPVSpL+ME/txVXPpZUwqa5Yc846
         YQ6x3tHymuCsBipvOq+RyNhhd2ne27HuFinnH0MWQDODe8SGAnHaKe0sNSBoTUNvWpWZ
         IrAy7wE6m8AjbGqDoGtIXqLfs8j3fGXvS2zdKkMteMkJqXZk0Awbxy1K9BLIq6NQKz0x
         AaUETDAaeXyH/WY5BYnqIw3Yxf7AEN99Pt+KzG1AK7cEBQf9dmb0aa2QPTTEGf8FUlBp
         ky33LhBRtsVO2j4zAM/aJi0p3RiEVm810OfjiJOZyNDM/C9EqjWee2LmpItbXQMlDBaE
         Uldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740375607; x=1740980407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pki/JYWmmXNym2xztTz0HjhIt5MhQfFEcSVfA7kjWRY=;
        b=BZpxwBXiUjyVytQ1C/8tQLCU83XR/Sf19xWYAzbZeB7vU69fezs1UpkUgsGzT7gny+
         voH4EkhejhcZ0xvXIFpTNR/dFFx8H4oYw4uBikA37XE9xl6tmMftvs7nLw9Sbw2I/lBa
         V82eFpF3szBZMd/eexM0ZWFN3mcLRejSM7iF5f+49QxpS+24DzSL63otiohcO6++rY3S
         C5VYYGwaLbvTnwCiP24iHA8fPF37DL/wRKO9N4OTkxb5LYRNv7qsH0bdJ5gwfEOIhrLS
         /03Jk+li8YCybT9sb7DDcYnxezVt7XovHonkDEeZTfcVzSYXswzfPNXVWDbTwZXLrB2k
         +E2A==
X-Forwarded-Encrypted: i=1; AJvYcCXnI/23lQrxmiQIrSiRYNloIeKXJ/WCQRCTUoa1IeM6c7VaIbleVbc6w4WKOsqmArJur3wcOCiL8iCKsg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+7A8sUnbt0SQnjATVjI6g8DtOIuSvvYkUc1hGMdVER8YiPRfc
	mlGOVJg1VJos5Q74nCoWm7bsVPYDRXNcUBTzITIxhJG5Wr/uTjpO
X-Gm-Gg: ASbGnctVwlyRuWs7OnAr3aF4bdk41id6c7vVJP/4wAdRuXVlU534IUstllrLRf1wazV
	OgiAT+gBBcarfAGlTLblzMnEj7KheIsTcVj9s/X86NfSWuaqswSca4I2ak6m1GsRroVeyiq/PCz
	zqRTfKkPyg+eN2igcBl5pFLdxori6wXB1BWMgOcgsdHbAUgmFrynegcguX24r3nrgoM/e7IeZ+d
	cYPhLFRac/cDY58vyW/lc5n45hN46k+LyVpQBfXg/ql8IqXza6ygLLN+PP5ZTl6YG6pE0UG9Dyr
	y9HzC7xEP5A0Mpe9ph3NvD4WjvAHzvA2aknTJKmbg6r/NhyWwM5362QtnpoJ3Sa8h9Vlwvz1JHd
	rjaUe564=
X-Google-Smtp-Source: AGHT+IFYZsWHIGkUkgzUKAjiHsIv/QlXdd4k8rwaFgyu16UEoKiHj3ay571mZ+VYAfS3uE3xpBBTaw==
X-Received: by 2002:a2e:8ed6:0:b0:309:2012:cc59 with SMTP id 38308e7fff4ca-30a599a6943mr41956421fa.26.1740375606698;
        Sun, 23 Feb 2025 21:40:06 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30917da0e64sm34665291fa.88.2025.02.23.21.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 21:40:04 -0800 (PST)
Message-ID: <24609799-636d-4e8f-8406-f83b5db08f90@gmail.com>
Date: Mon, 24 Feb 2025 07:40:02 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] iio: adc: rzg2l_adc: Use adc-helpers
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <cover.1739967040.git.mazziesaccount@gmail.com>
 <25c5d22f6f0cbd1355eee2e9d9103c3ee71cebdc.1739967040.git.mazziesaccount@gmail.com>
 <20250223163018.2c0290e8@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250223163018.2c0290e8@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/02/2025 18:30, Jonathan Cameron wrote:
> On Wed, 19 Feb 2025 14:31:38 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
>> drivers avoid open-coding the for_each_node -loop for getting the
>> channel IDs. The helper provides standard way to detect the ADC channel
>> nodes (by the node name), and a standard way to convert the "reg",
>> "diff-channels", "single-channel" and the "common-mode-channel" to
>> channel identification numbers used in the struct iio_chan_spec.
>> Furthermore, the helper checks the ID is in range of 0 ... num-channels.
>>
>> The original driver treated all found child nodes as channel nodes. The
>> new helper requires channel nodes to be named channel[@N]. This should
>> help avoid problems with devices which may contain also other but ADC
>> child nodes. Quick grep from arch/* with the rzg2l_adc's compatible
>> string didn't reveal any in-tree .dts with channel nodes named
>> othervice. Also, same grep shows all the .dts seem to have channel IDs
>> between 0..num of channels.
>>
>> Use the new helper.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> I should have read on.  Definitely more convincing with these usecases.
> however drag them to start of series.  Better to add infrastructure
> so some use and then on to your new driver.

Ok. I'll reorder the series.

I'll drop the differential channels support in v4 - and thus also the 
expected property types parameters - which will simplify this and other 
callers.

Thanks for taking a look at this!

Yours,
	-- Matti
