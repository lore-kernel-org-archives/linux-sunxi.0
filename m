Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3961EA7D0
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Mar 2025 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740987193; cv=none; b=F5R1RV2N3fbtz2jYvETt7ols0tCuY/nOePwdEdHtFs6ZwSlDbNwIiB0TNdW59HSm7PCqOvsdWCwX56Tl1dff9QjZv1A8T5tZfrHOYozK9inlJoHFunJSZzTv11h5QBDOFcA6+QhzTZI34k/YeAVdTz6uZTMfhZ2lBoE8vQTR+GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740987193; c=relaxed/simple;
	bh=5eF7GEXxzpWu4yOg9pvtBatpJVXLkGtCFTy/RS33fx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cX2ah5eks7PZ+DUXY9m4htQOmUtGrUTiFyJqf1VviWTkpFBVBPwi4qPVtK0v5lpQpGArHQuWxF5H6mBztw1b5DveQqWt9zUKjBm2+oYTX8VGGri0Ig5D5YaFn7b0xDKMbOWTYm/kUiRhLqrRvCyAWzYRFak6F0eFCz48P6YLJmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5pubGq2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5pubGq2"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-307325f2436so42491341fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Mar 2025 23:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740987189; x=1741591989; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrfT43/ChI686f8asUl/9QZweWrcr9+CbhtUfhxyfBk=;
        b=F5pubGq2opFNMZPyhFBdlVD6Wq0SsJ2ORyEuV2BQ+UJkCFb1IqufMjUL/64zY/EPsr
         3qqwM8xKGwA4ojntRXv8cMsnxc7BYnEkwLISRu7B3sNsu+YYgEjs132XFffOisFULRgn
         o2lQdDWBHS4MP0W56Rj7J2W8Q2wa7hvNH7NGwZvCgtdSduJUv6hlQVWJBpxp+y+5p5Hi
         ohNXJmWWVyDpgpcUyi+w5p41ZKK4ZAGDNuj6t8CbQWgK8TMiKzoP7P8Vlsk0NNDk4jzX
         P3wA7EhlkSueAwpKW+G3/lnmWvSJuNMZ96gza33PcgNZEqFWkGTEBn+wBblAA0f+3obP
         Pdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740987189; x=1741591989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrfT43/ChI686f8asUl/9QZweWrcr9+CbhtUfhxyfBk=;
        b=LuTLmVLH/mIgxwSenABg1p2Dvrh2BMNDwALr3XGKASe431OSwhIzldkCv+Ulue7+hQ
         yWD0ejBYquZXqxl3hU6D+GB6wQxoTCom1zsVbQn0TazAdhDPSsjB+ADUu3WKzBwvht2v
         GW0slbj9aNOkxExDTZDxT30OayxpS1ixLVAoo9vULB0xkPSGU2B3PJSgML0mWK7dmM6r
         Z3pwRKYDQLnhRfQFS0Hu4ZHReX4XrJnX7lEZOg9s+sVvXJd1O7HoVFWuALZYZHC0TfFN
         2fAU6FFAhtm3Vp3IvdOwdTqT8v6BfYLCTToAuJCsa7tkETKfMmjw83qYAJJi9oPRWxqM
         Dcrw==
X-Forwarded-Encrypted: i=1; AJvYcCVx2F8AS09Z70cYsfRXkVeGXymYJrU3QHiXAdqy91bl+QDQEGr+38vX7ryk1m0YBD+huZVB++TbUVfIHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYrzhuvTdunDxTtWTxWWN/xfhX/7dMM1vTx0p2PzgxyuM83ziH
	m2/DYqTEMH7BgMHkKDM1AvSBBXRE8KmCL99Shvzpa+bkAsyxZ4L6
X-Gm-Gg: ASbGncvqAaI8MvtlwE+NICSkPoPk5IFzxvjkcDCWEpGBb1dxudmkMbqeG1FJO2RDMNY
	SCHjI+1ulP5jQXf7OT/KRNBnRsgqzwl3l3qE1+h8G6C5gV5gQedBRHLrJjawdsDnV1Hyj7qsiFT
	zXAUqVKSG3vMyj0y+X4yi5kwmLHOYTHDdwS5pUTWl/wXYOHDHdpTCXCRZZypdfZhMwNEK0FoRz3
	CPlEwxaBXP4eUpGzZe6IJawQcgxcuT0qk95kT/MS23aAH2LGB2ET6YesK3/jarQ53A/dea/6G96
	0Pd/GejFwzsNk7VLRtc0Us8SZkcT94BHxUAYdrPuhdLJGxyvCZsqpoVd83OZaOPm2wEnunNTULa
	JeOYNxEIWp+vjD+ymVJa4FL83UA==
X-Google-Smtp-Source: AGHT+IFYoPik8tqIuOOXAJZxxEM4FjnMpyrSDbqpvuiBUw+N4rWidoyXw4/acgqr1fgBuicookECFg==
X-Received: by 2002:a05:6512:693:b0:545:b28:2fa9 with SMTP id 2adb3069b0e04-5494c122af7mr5686831e87.16.1740987189050;
        Sun, 02 Mar 2025 23:33:09 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495a7d6a2csm602975e87.227.2025.03.02.23.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 23:33:07 -0800 (PST)
Message-ID: <ce2c1a21-f418-4ed9-9cd3-fe2a68f08c31@gmail.com>
Date: Mon, 3 Mar 2025 09:33:05 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] iio: adc: ti-ads7924 Drop unnecessary function
 parameters
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
 <38d39befcca110132fd4349c87fcb5d7ff51a2c8.1740421248.git.mazziesaccount@gmail.com>
 <20250302034649.2d9ec2a4@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302034649.2d9ec2a4@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi dee Ho again Jonathan (and all),

On 02/03/2025 05:46, Jonathan Cameron wrote:
> On Mon, 24 Feb 2025 20:34:01 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> Device pointer is the only variable which is used by the
>> ads7924_get_channels_config() and which is declared outside this
>> function. Still, the function gets the iio_device and i2c_client as
>> parameters. The sole caller of this function (probe) already has the
>> device pointer which it can directly pass to the function.
>>
>> Simplify code by passing the device pointer directly as a parameter
>> instead of digging it from the iio_device's private data.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Looking again at this function it doesn't seem to be doing anything
> useful at all.  It checks the channel nodes are in range, but
> does nothing with that data. I'd just drop it entirely.
> 
> Ah. I see David suggested the same.
> 
> We can't really 'fix' what this was perhaps intended to do now
> as what it does has become ABI :(


I took another look at this.
The logic in the ads7924 driver (without this patch) is actually:

ads7924_get_channels_config(...)
{
	device_for_each_child_node(dev, node) {
		if (fwnode_property_read_u32(node, "reg", &pval)) ..
			continue;

		if (channel >= ADS7924_CHANNELS)
			continue;

		num_channels++;
	}

if (!num_channels)
	return -EINVAL;
}

...

ads7924_probe()
{
	ret = ads7924_get_channels_config(...);
	if (ret < 0)
		return dev_err_probe(...);
}

So, it still returns an error, if no channels with valid 'reg' property 
were found from the DT. It will also fail the probe().

Thus, this change is not quite as likely to cause things to break as it 
seemed. Still, for now anything with even single valid 'channel' has 
been Ok, even if all the rest were garbage. This new variant would fail 
if any of the 'channel' nodes contained no or bad 'reg'. Thus this can 
still break things.

Anyways, I'll follow your suggestion and drop this patch (unless you 
have second thoughts) - but I will keep the function so it still 
requires at least 1 valid channel node to be found.

Yours,
	-- Matti

