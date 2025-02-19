Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F1B20B22
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 13:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972182; cv=none; b=JYB+YIeuOwlCDlixUIbwBreIzZCUdZAyv81yISCxaifwZQInPzoMmqWqK/mKhzvJysKbiWOZ+a46Kw7tUVpUb+YbaMKtUSVFA+05MVP84A2CtVh0chxjmhJncRiygLT6Z2w0K19W2ehqHS6zKngga9XAQHVKpaxuLD5sMTP6DCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972182; c=relaxed/simple;
	bh=7ihWjXMDbjH1f4hkfj9yu5zjMSN4SJcUGVD62F9f64Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8k6kTEqDmYZKymSLv5/lwIKip9BXwD0E1QZJq2laH7ywK1iJCj78S0xAHlEcVXzs9InM0mij/NXe2CXPuxCKUUJg4ed53n53dbjFz3fpOwr0OZZmBQ/8dhf//HZ48CWe+DltxQrgJh27U9jlqbiinUJXAdPkw6PftKWyZryn2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkmwG2mR; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkmwG2mR"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30797730cbdso70356471fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 05:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739972179; x=1740576979; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSsnV19R3euCe7A+mmLLwP9bRWysONanwRs/f83625E=;
        b=KkmwG2mR53bEAVSjZWc+PAXhGiANzzgGXlhWHLzZjDpfYAGzEYngVvxi8Eoe6A31R+
         ru4KXzQJAmOq4cN/sxCcu3P3C5Q7RUFe9PSRmeM7428Ko1gja4MLbI3vPJi84feT1OCO
         rVoJD00omz7zpiPbHmfF6Wnw7q6yFpTInQxEVFda45iLtyDaNFpEYL0rvw/l/ZnJ1BKM
         YXT6/MGIrv0armNOb3GAvyInvogz2NUHTO/WjIlADUKENiuhME3sukiM9nfiTdGT6/wq
         +z1314khVRkregZjG5jn1oXo4kSg8bT8jxV1p0HlcbFyHTLygPbDuYm6aknjgtdp9WSv
         AgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739972179; x=1740576979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSsnV19R3euCe7A+mmLLwP9bRWysONanwRs/f83625E=;
        b=bJqH3ntsbnWJPFopKtgPVgNiAG6iDsZQiiDoINLFPpYVI8Qh7zaqrq0L7czffEPxb1
         gtqxFkaM/ro9fDNrZvx7UPYpMsLNQf1gmODr/nU4+51/o6+greD9n5HU5Hsr023adwIv
         CAnRJf7kBW+uy3qK541RVFV4vwwKKh+ZYxFN/Zpym0jH4WJTqpOjVQxBKjlbn7D99QG5
         i4R6zcHQdxYAEo34Cz+qxQ6JcFAd+y6bCWDViRINGxnB1mgi1Ylkb8RXKKqCwfZeLECw
         Q2gVxMEsSCaYJ2oIiVH4Mp2ubLgX1lGBdwRu3HTRFyEnIVRD2Hlt8Uf0cRtlBhl9K9xn
         chcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqKpeFQwjQh5pQEL8FnCNAF5N+GGyrXMyV6LVTa3PoXimDFOYPJUaBSEQdiMtIMYYb90bwMz2VaPJ3uA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbAwV2ughUH9VPecvwE1ZUxNOBTYUeYWQ3kvJQNdvECvOk/e9l
	FuMcHsvgJogeAtybcL2czTKiMLE+Iw1mUNiqnvCSKACPkMn6t94d
X-Gm-Gg: ASbGncv/TdNO/x2OQGUMxYpau9mbUIuyvoO0rwP802VDPWj815ol76YVVkP1XTcfLpj
	1ebvR5KtkedM1E18NykVarvBr9R7c44cLW6ldtCBiapIo9OaN3YsHfNXlULMh6ErHSVWnPIRzsE
	NhnDKqgfBqcMa8LYVPSuSXcBPv3P+47OpZ4aBnxrGobKA1J36Jp6OPEPPXte9M9bo8gAm+pBwgu
	NMiPbxhR6bxYOEH2VfvTKDhXTMpHaBUioRJU+Tyj+b54tArtJwxaDreEJYhTNsiMfLrN/fcJYWr
	f3771QHYDNPqys8YXcIywe80tWPdHWhNCYomc5BKxLgmgnDwD5+BRCEatpTbmYh5zarpPd88
X-Google-Smtp-Source: AGHT+IECONOuwKIydK//bT3AGqnTWMmCdF2rv/KJJHD8I1175BIY8l67zp+r+qNFr42gMLhOkEmBmA==
X-Received: by 2002:a05:651c:2222:b0:308:f4cc:951b with SMTP id 38308e7fff4ca-30a45035a2fmr14037951fa.23.1739972178597;
        Wed, 19 Feb 2025 05:36:18 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a258703c9sm13795701fa.7.2025.02.19.05.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 05:36:16 -0800 (PST)
Message-ID: <f1c6078e-39bf-499f-b7ab-17526b3e60a9@gmail.com>
Date: Wed, 19 Feb 2025 15:36:14 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] iio: adc: rzg2l_adc: Use adc-helpers
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
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
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <25c5d22f6f0cbd1355eee2e9d9103c3ee71cebdc.1739967040.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/02/2025 14:31, Matti Vaittinen wrote:
> The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
> drivers avoid open-coding the for_each_node -loop for getting the
> channel IDs. The helper provides standard way to detect the ADC channel
> nodes (by the node name), and a standard way to convert the "reg",
> "diff-channels", "single-channel" and the "common-mode-channel" to
> channel identification numbers used in the struct iio_chan_spec.
> Furthermore, the helper checks the ID is in range of 0 ... num-channels.
> 
> The original driver treated all found child nodes as channel nodes. The
> new helper requires channel nodes to be named channel[@N]. This should
> help avoid problems with devices which may contain also other but ADC
> child nodes. Quick grep from arch/* with the rzg2l_adc's compatible
> string didn't reveal any in-tree .dts with channel nodes named
> othervice. Also, same grep shows all the .dts seem to have channel IDs
> between 0..num of channels.
> 
> Use the new helper.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> Revision history:
> v2 => v3:
>   - New patch
> 
> I picked the rzg2l_adc in this series because it has a straightforward
> approach for populating the struct iio_chan_spec. Only other member
> in the stuct besides the .channel, which can't use a 'template' -data,
> is the .datasheet_name. This makes the rzg2l_adc well suited for example
> user of this new helper. I hope this patch helps to evaluate whether these
> helpers are worth the hassle.
> 
> The change is compile tested only!! Testing before applying is highly
> appreciated (as always!).
> ---
>   drivers/iio/adc/rzg2l_adc.c | 41 ++++++++++++++++++-------------------
>   1 file changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
> index cd3a7e46ea53..3e1c74019785 100644
> --- a/drivers/iio/adc/rzg2l_adc.c
> +++ b/drivers/iio/adc/rzg2l_adc.c
> @@ -11,6 +11,7 @@

...

>   
> +static const struct iio_chan_spec rzg2l_adc_chan_template = {
> +	.type = IIO_VOLTAGE,

I just rebased this to v6.14-rc3 and noticed the channel type can no 
longer come from the template. There are also some other minor changes. 
I'll fix this in v4 if this same approach is kept.

> +	.indexed = 1,
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
> +};
> +

Yours,
	-- Matti
