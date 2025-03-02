Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F891DED69
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Mar 2025 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740920814; cv=none; b=jeJ53+d7dIOpWmZbYtH6aGrjrTqYalsmHcqX8xiv/aQLIxfmt19SCorBQM6HNTKtQCBobPmgtirBfxvSPV607Ikqy2MYf47yUAIoDWYVi3N4grXNdpJoWoNrcGHEWQaN0UD8xyTjA9CIE7lB++DM2Ezy8G1Fn7QaMOm/u7WNQJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740920814; c=relaxed/simple;
	bh=Wc63yfyqZGwbD63CYJ3J2dS4oj/xXBruMTdVa0We1vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsIydtUa3d+xCMObLi8jvdwYNBRk0smBqeHEBVOCDXKjywA1F+XKt8+jDHaICtBFOH4bj3y5aqu3qpH2G4O8tca6zpTA68vixUYuHw5yQStWpXAqVvDISA55tohxypiqBw6ToMeFI5lgqWH2pa9VAyMO2DbFdYToroXCL5BDxgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4CLcO3R; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4CLcO3R"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30615661f98so37032211fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Mar 2025 05:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740920810; x=1741525610; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+axkLd7tQFz7zR9h7JCTxpVngu93rFLR93Lw7kqAh8=;
        b=W4CLcO3RsV95DdjNYN9D52X0dR5ae3Q97kHy9eyV3fLfEideLNxxQ/TvUrWKo6siNb
         Lt5jXDZu2EnFUk/hi4euMN8Md3RhyAO51IGHygJdkViktFB3vx7omfKNq+VWwOZwYyo4
         0f1kmmogtnZp5hadbYJz53SmKBdpxSnxUZgmUTXJntxC968uUDDas8pPuC1WBiscxXTQ
         WcCBrWxOO2quDDN+8GV5PEifps28QCcDTV9od3gWT7HwFvP7hUMF2dpsG4SZ9rdGGK+f
         deASvZZnCPdOT2S5NST/cFXS84JiQOUYM6iFTx4OI/mFCp5ZXcpwii2MTXkPHW7g5EuM
         Uqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740920810; x=1741525610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+axkLd7tQFz7zR9h7JCTxpVngu93rFLR93Lw7kqAh8=;
        b=blO2ukM27Ub2lyDtkqpriWrhAfPXlPW8IkFDbG+CZmgYwwN2DTEtvFhDq3MzXh9+D6
         JVyAvU827snveaRgk/3ahY/9kBq5+ila2ENb9BcJYw7ehD2gs652iFjmADDcVlN4I8Me
         KmqZ4XaNVxtHjwGWgyVQhglwv4rDUMfRRDihI9nZtr1kQGsKxPBaONUiL/OwbpsKi5T8
         9TcBsn6QKxIZg4A18VVESTRfL1yTO3APGbvz5xCrDamKTXc6sM4v9paAm11T5x7ksktA
         CctGhyfDWM+t7nmRbgYuGob4bb2N9JxuG98yZnYD+wXI4N9xHDh3fewBp9d1jNEMWio4
         pFdA==
X-Forwarded-Encrypted: i=1; AJvYcCWFLaYrapDaw8HroUoEeN8BwdgxPLFQJVJcFrUxQgVeV74joguev5E5sPZd4+QzFpPwITJppzn2CPw3gQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLggRHm4FkdyyPvLIc2wnTK0Y9uIfxjAN/EOg4FIEqeyzsX9NR
	2tKoOwBnF2aafMGBjb0Q1gO1eF5QRgi6MIZq5MeyOk/mRt7lVf4G
X-Gm-Gg: ASbGncsezlrwlpztsBrkJpL56V8Q3PLGdf9DPFotjABsPl9G4mv5d45GcsqVNZmcQya
	a2jJYwTL4c4XLuiTs6MmSBe0hx8caKwnkfyXOSgyt6MZFgD5vFVpnY8RGBlGxYznKCWvRsAb82+
	lAi87hPJGqH8ZNybtyTxL1F/jNOjryYgQsWX+C9a6XtdkuA47owzH+sxBTiSkX5OwiE0MrjpxRu
	7VPMudZhO3IDnTN+6ckptvp3Tvh8E56lEYuuFpjGyG1CxM1kXCb2EuoeBVJb4JZwhU9jJMxdlJk
	O7YD2j1i6Ag2nCw9FXmlP/12JEVwrNQXgvAJHFU6sELz+jMBFq4YJFOThFXJ+Fmw2vCGbtLH+3h
	ZiAtwJSjm4fdswMbBa+3fpIY9eg==
X-Google-Smtp-Source: AGHT+IEucaK4C0/jG/28ToSGCMqDTpO1LwC3UB+LxRq0hxN98edyDZiBux7h98Elv5EsCRuxmORCqg==
X-Received: by 2002:a05:651c:1545:b0:30b:8faa:9544 with SMTP id 38308e7fff4ca-30b9320c44amr33012291fa.7.1740920810359;
        Sun, 02 Mar 2025 05:06:50 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b8dbd1ad9sm9547021fa.76.2025.03.02.05.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 05:06:48 -0800 (PST)
Message-ID: <45c0bf5a-f821-498e-8a9c-99e53bba5307@gmail.com>
Date: Sun, 2 Mar 2025 15:06:46 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] iio: adc: rzg2l_adc: Use adc-helpers
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
 <5658fbdd886cc7ada278a42c63a140bc14d1277d.1740421248.git.mazziesaccount@gmail.com>
 <20250302034042.59d83f53@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302034042.59d83f53@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2025 05:40, Jonathan Cameron wrote:
> On Mon, 24 Feb 2025 20:33:29 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
>> drivers avoid open-coding the for_each_node -loop for getting the
>> channel IDs. The helper provides standard way to detect the ADC channel
>> nodes (by the node name), and a standard way to convert the "reg",
>> "diff-channels", "single-channel" and the "common-mode-channel" to
>> channel identification numbers used in the struct iio_chan_spec.
> 
> Needs an update to reflecting naming and functionality simplifications.

Thanks! I should've noticed this. I'll re-read and alter all the commits 
for the v5.

> 
>> Furthermore, the helper checks the ID is in range of 0 ... num-channels.
>>
>> The original driver treated all found child nodes as channel nodes. The
>> new helper requires channel nodes to be named channel[@N]. This should
>> help avoid problems with devices which may contain also other but ADC
>> child nodes. Quick grep from arch/* with the rzg2l_adc's compatible
>> string didn't reveal any in-tree .dts with channel nodes named
>> othervice. Also, same grep shows all the .dts seem to have channel IDs
> otherwise
> 
> (othervice does sound cool though ;)

Thanks :D For some reason I always have difficulties spelling it!

...

>> I picked the rzg2l_adc in this series because it has a straightforward
>> approach for populating the struct iio_chan_spec. Only other member
>> in the stuct besides the .channel, which can't use a 'template' -data,
>> is the .datasheet_name. This makes the rzg2l_adc well suited for example
>> user of this new helper. I hope this patch helps to evaluate whether these
>> helpers are worth the hassle.
> This doesn't seem to match driver. It is messing with channel type.

Ah. Yes. It was simple until I rebased to never version. I'll change 
this. Thanks!

Yours,
	-- Matti
