Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66A321D3D6
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Mar 2025 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742200933; cv=none; b=UshZWSFmqrTvrkRp8fGr6Kk8/c8BWVPDkV8M2Z61XdbE28RzZWfdSp0lqOSUAW9b2+uF1Hol99FUiD7Wmq/gEfTCvF2WUnXX6vSh0UtGkA6vtXdC7hbScMwSxNrOs5z6kxD4BpwG/Lvind0pwUHESNpXmhwbZftBIkMWsUep/2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742200933; c=relaxed/simple;
	bh=lKHWj9V8Nq6zT3iZ1PBCgGEfS1g71F1u7pC1RxEH4jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRP6aqxoqivMN9Pj3nTO1ESSu414P1f4tS6ZTmLY42cr+1u9HMPvM5f/v/tZIu17ALLBqZyMoI/PQVV1t+v9t5f3gJkpCPO5QGr99BxF61rTp6oTindZYuF83hQnSr3U2aAUjFVaq7Hk13vjoksogPbIIFJ1oSVbkvZoumDX2Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJ15Y9L/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJ15Y9L/"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-543d8badc30so4803757e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Mar 2025 01:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742200930; x=1742805730; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FpO3HnxuMJXBU+70F/zOGGDYlbCQDeNotNwoR3G8/gw=;
        b=WJ15Y9L/ZY8E/9T1IF7x35C0iW8at89R9Q1Ah7pN5LtycSYbmz015nUn5Z5OXN3KpI
         DVuQnXLewED+aR/gARkeUuiqgYr2BvocIv+OSoB/D/gj0YzW0dOSFNizX67ZGKC/AzPW
         SJfUmAyRQeMoCRsv6oE5WhZWvP/Vr0w18z8FDw1lv0A0IyHLlp/2Gjl8brrYxfm20h8z
         /b/lHcYmaDQXNM7cEvR+9Sk802+OohLaBsyVYJeU+o3U2py/Yt0GO1gGjqeRk8eaSyJl
         H6gbJcUhx1haE2+vAwVgIW9at/efV07J+E1Ix9xBTY9D1eqkboCLU+4kBXbOGGw/EMoA
         ZdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742200930; x=1742805730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpO3HnxuMJXBU+70F/zOGGDYlbCQDeNotNwoR3G8/gw=;
        b=vIMtAGcpHKHFxjVXHvcM8zrROyMT5Oa4FMmldtc8H9681ZR/Yp+UhpOTE/rBUDCKZv
         hOhWTze+2su75LBfcG9pQaZ/38T+MdTIc/hx7xcxSI8WHLdhT3oY4JqrqcRjOAcTbqFY
         qafKFQppwQbgx0Ay0ZKdeybt8XAcbtHg/pc1muiH7eRi0OuZsRW5cKFUQGxCgw1Gx5A4
         zsW2fuX/xx8Wy4XuovFrgxAt7y7/96fQ99TXrO96Q6jxFfMD3RjCYH068furZpdURdDM
         un+1jHcsbgfiZ8pdHrIK1h0nHclday2g+vfK909nrAbSRlvZSV6B+qWvzOgQyopDGAiQ
         LeHA==
X-Forwarded-Encrypted: i=1; AJvYcCVV2rF6UmBfD4bitB7Sm6ymn34v8jOy+2R0fBpBkdCzjKdsKh6huRut9bFf4qrlFPMwZl5nG5iVRUMT9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDyLrQ6vIsNQCR5OnZXaoquJOvPW/cnhxVBQqmWh2ZWMyhX+fp
	IPv0au+amb0zI/Upv6b3RZeg71IJbbKnRbj5v9cJm6BxIyrj1vRM
X-Gm-Gg: ASbGncvd8/822GNvpnjUkx7nDK86yfeXm+hig0+zNCQl5IZPES9lislNJc8G1mwhCJV
	+ZN47f1fqV0c2UPBoNakcW5eCnPWp/0QWDNF4Dexipr9Kx76ht0sC85A/66xcmjKH57Mgej8wkM
	RfIlcp/hkYtUrnt6BWVrTCUftWL8CJaBcIUvIUHmCS3ZkSDwYXVnt6iQIVRe4Voctcd/mxTdv5T
	KSOt/CXKCfCCqfn1eGzVL5RYmebdLz0aRVUjCRHtNzXx3ettGyiXCflWzEQaO8IzRBEEjlH7qt2
	JaoqGrKM+W2bt1Rpix3rcWR3m0Dw8nCUps2vciMpuzwgb24b1T58OwhhXU0suS+/M9G4yuoljxt
	VDQz3Fg/qEWJyaQhxDfnaWG77GQ==
X-Google-Smtp-Source: AGHT+IEaEugzJ+pYBfCBL4Vt0JndH1mF1+5wo43FEa3qzrXwIQyPae9SAqetesylNstTDl/wwv+/dQ==
X-Received: by 2002:a05:6512:1286:b0:545:10eb:1ab2 with SMTP id 2adb3069b0e04-549c398d167mr5642074e87.33.1742200929794;
        Mon, 17 Mar 2025 01:42:09 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7bfea4sm1224769e87.67.2025.03.17.01.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:42:09 -0700 (PDT)
Message-ID: <0db2a42f-d393-4e75-afbf-cf30c0e06cce@gmail.com>
Date: Mon, 17 Mar 2025 10:42:07 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
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
 <50b126c5-248e-4694-9782-4f28d6db5fce@gmail.com>
 <Z9fUmo5wp3EcNWzm@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z9fUmo5wp3EcNWzm@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/03/2025 09:51, Andy Shevchenko wrote:
> On Mon, Mar 17, 2025 at 09:11:08AM +0200, Matti Vaittinen wrote:
>> On 16/03/2025 11:41, Jonathan Cameron wrote:
>>> On Thu, 13 Mar 2025 14:34:24 +0200
>>> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>>> On Thu, Mar 13, 2025 at 09:18:49AM +0200, Matti Vaittinen wrote:
> 
> ...
> 
>>>>> +	num_channels = devm_iio_adc_device_alloc_chaninfo_se(dev,
>>>>> +				&sun20i_gpadc_chan_template, -1, &channels);
>>>>> +	if (num_channels < 0)
>>>>> +		return num_channels;
>>>>> +
>>>>>    	if (num_channels == 0)
>>>>>    		return dev_err_probe(dev, -ENODEV, "no channel children\n");
>>>>
>>>> Note, this what I would expected in your helper to see, i.e. separated cases
>>>> for < 0 (error code) and == 0, no channels.
>>>>
>>>> Also, are all users going to have this check? Usually in other similar APIs
>>>> we return -ENOENT. And user won't need to have an additional check in case of
>>>> 0 being considered as an error case too.
>>> In a few cases we'll need to do the dance the other way in the caller.
>>> So specifically check for -ENOENT and not treat it as an error.
>>>
>>> That stems from channel nodes being optionally added to drivers after
>>> they have been around a while (usually to add more specific configuration)
>>> and needing to maintain old behaviour of presenting all channels with default
>>> settings.
>>>
>>> I agree that returning -ENOENT is a reasonable way to handle this.
>>
>> I agree - but I'm going to use -ENODEV instead of -ENOENT because that's
>> what the current callers return if they find no channels. That way the
>> drivers can return the value directly without converting -ENOENT to -ENODEV.
> 
> ENODEV can be easily clashed with other irrelevant cases,

Can you please explain what cases?

> ENOENT is the correct
> error code.

I kind of agree if we look this from the fwnode perspective. But, when 
we look this from the intended user's perspective, I can very well 
understand the -ENODEV. Returning -ENODEV from ADC driver's probe which 
can't find any of the channels feels correct to me.

> If drivers return this instead of another error code, nothing bad
> happen, it's not an ABI path, correct?

I don't know if failure returned from a probe is an ABI. I still feel 
-ENODEV is correct value, and I don't want to change it for existing 
users - and I think also new ADC drivers should use -ENODEV if they find 
no channels at all.

Besides that I think -ENODEV to be right, changing it to -ENOENT for 
existing callers requires a buy-in from Jonathan (and/or) the driver 
maintainers.

Yours,
	-- Matti
