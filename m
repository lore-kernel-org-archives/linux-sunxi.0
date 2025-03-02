Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21FA4431
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Mar 2025 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740920428; cv=none; b=SifU/NdpD2l0Zmx/ParAovYVU2l/getB69lWmhcSle+5DTkQkNOf6y4T8mtEcsH7+4Zs60FoMlVK17jSiLIkdFWKYPovdBfj6MvZvTB4alR3oo1EFNs3A7ZTMLbA9J7SVBWgX+odkLltaRNKwSKKQJhUKJHAEZpD2yb+ai9FePc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740920428; c=relaxed/simple;
	bh=F2oW1i7xFQ5yaNfg8aSg4BfxUAemyDWnFE4Dx9ylQcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4YzJxItOvb6YPpWZLw05FfFVcDfgjzzuYkMBSRruF23RpiFlTJkIFXUUkFiOQEJVRt7OmktVprr1T4785BSy9oxpMb2SEVPPvMFMo/TFXuvC9xi6zGhNLPH9JZqA/UdY6+PAwpe7pE3gYL5P2sh2Grm68qtmbeCmt9c+Elx2+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdXYxnYv; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdXYxnYv"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30797730cbdso34921811fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Mar 2025 05:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740920425; x=1741525225; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XfGXlQMIJZXRSzz9b3y/679wpg6DJoBY9Odmd3DiDb8=;
        b=kdXYxnYvPQ5SvxhwM3bKSuevwt9/iOTvGAnA/VmokwX7U867yH+gNCHIGxpD/m6n2C
         Ip26Lr1PtMNEAjdc/VJnHBs40v+yYfWCOCNr4rrVNzZ5QxPp9WCAzxOFf4wTc6DPwsop
         uWD0lm2CnPQJarqzDafulECoEoqapccp7XTQrClAvpHXeQQjiudtkYmC0InyjirKxGKU
         hY+e4peo/iPRbxFSWvodMLpRcwZJCKo6OIaIgPbhuoKs1OsHZWPAmHpfy3BpftL7Hrqh
         L/9yhkTwjGzJzu2oEX9DxiOmT/ourAoPsftOz7Ti/JeYF5OtaTZNuqbl0Jtn9yMIPOUO
         RqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740920425; x=1741525225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XfGXlQMIJZXRSzz9b3y/679wpg6DJoBY9Odmd3DiDb8=;
        b=nb4WZk5F80GV8NPk7cNOkLakGsyP2tIWQjMfEh+qMGLOYU3hRNjSWyVasd5bwjnSrv
         FshPH0kxD6erRh/F/s0LBmRMrE93Ym5DWKZmwyAtANnUlDGiFLKtRE6XmMuqaWDwLMEr
         kOet+5ISzG6tX2lM3USN4wIZjEaybctGhrd/GMbK3IgSsPPq0LvUZfvsCwnsYkqNSZ34
         bZtIk52B50pbegyaBbK3S3jktneImQMl7yZAhCIMBpcaETY5BpRvmUxAGINxWVZXpxfY
         OXHvhkT+SmesK2zCs426wFCYwP8SBrkCoi8jMFKCARcDd8O+KqmB4dGJzhtweXpvxtNa
         cauw==
X-Forwarded-Encrypted: i=1; AJvYcCVMW36vEWaPB6nGSweGTNe0mZuzeEBKXSKsDGFC+nSzjDhLzNFUYDhOXAuXP9RJ07hvbidxvVQsdvxRpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhkBIRwr4UidqT0pwfeFDnZkztB5t1lvswDhvXrExMy6PbQf6y
	72V7kin4Hl+zyEDMvRuyVZR2yUI9yrpo8uGlHdnm4PKKRO4LZLSR
X-Gm-Gg: ASbGncsWKlS/5HwBF53noRL2PocSfhB91Y+c4BzFpEKHpRkLVQ+83z4mAyc78bZMTrQ
	hMVJqe8AmPYFe59k1B8y/TQKO2rb+B7zINh91NFzvNDY+7fFIcjqPP38PzA0oqBiSnNY5Gc6d8t
	mGZC8d7QL4SZEEpLH5CseLtWQzQI+o1SiHNRUrEqzl6Jb0LyV88cPXlzx0R53da8a0fhPr0hZ11
	nTrXrEJwf1hbvb8YezdEubxwNyj4XwTajUDayL6wOyqqI1tUnGwAHQcYWIk3netKHeYrIU01Jew
	OfTERgUiNt60QrqwCfxW2Cklyagc4ITR0Sg2X3f+Nfc8VDkhccQx1rNFq6U0nwK4lpY62PRlVxy
	H7PH2HGDDe9+WNjp2tDEArMSt3w==
X-Google-Smtp-Source: AGHT+IEJBMocHt2Jgr18dEspZ7moKiOE2FRAdMPLkXLThDcOzKqgxp1X7Z/SUDkFQeJFZlY+0pzPtA==
X-Received: by 2002:a2e:be15:0:b0:300:26bc:4311 with SMTP id 38308e7fff4ca-30b9326afc7mr48040971fa.18.1740920424456;
        Sun, 02 Mar 2025 05:00:24 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30ba19df7a0sm5519091fa.34.2025.03.02.05.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 05:00:23 -0800 (PST)
Message-ID: <f8f7154b-460a-4ca5-b31b-746bd23a3d61@gmail.com>
Date: Sun, 2 Mar 2025 15:00:21 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
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
 <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
 <20250302033507.7c166743@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302033507.7c166743@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2025 05:35, Jonathan Cameron wrote:
> On Mon, 24 Feb 2025 20:33:16 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> There are ADC ICs which may have some of the AIN pins usable for other
>> functions. These ICs may have some of the AIN pins wired so that they
>> should not be used for ADC.
>>
>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>> add corresponding channels@N nodes in the device tree as described in
>> the ADC binding yaml.
> I think it's worth exploring if we can tweak this slightly to make
> that something a driver specifies.  Either skip the unspecified or
> fill them with default values depending on a parameter.
> 
> Would make this code cover the existing cases better.
> Might be a little fiddly as we'd want to maintain ordering so
> the code would need to index slightly differently. I've not tried it
> so maybe not worth it for now.

Thanks for the review!

I don't remember seeing users which would have benefited from this (but 
maybe I just quickly discarded them as unsuitable for this API and 
forgot them). Anyways, I think it might be cleaner (from the caller's 
perspective) to have own function for supporting such cases.


>> +
>> +int iio_adc_device_num_channels(struct device *dev)
>> +{
>> +	return device_get_child_node_count_named(dev, "channel");
>> +}
>> +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
> 
> Maybe one to promote to a static inline in the header and avoid need for
> the export given it is very simple.

Makes sense, thanks.

...

>> +
>> +		if (max_chan_id != -1)
>> +			if (ch > max_chan_id)
>> +				return -ERANGE;
> 
> Might as well combine.
> 		if (max_chan_id != -1 && ch > max_chan_id)
> 			return -ERANGE;

Ack.

Yours,
	-- Matti

