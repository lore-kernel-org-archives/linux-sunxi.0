Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F070820
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Mar 2025 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743365884; cv=none; b=LmR8H0cEwCcDldRZNks3loxhQPTc1dmN3EJjdQ2nYc7LmBGFBrZ/ryUJNnkY57eJcQzvsuLB7xBaVbF5cAACv0+OcSTxDKDcLlse0mv1ePFotg9edpVHoCbrplvLyEy6dUUmhcOxNlCrwmm7TVI+fZEmW204x7EQYytDuJAL0OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743365884; c=relaxed/simple;
	bh=i/zZuquizU3rNnjsaeo6z64PLYbXEl+OVKP9uiO7kOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lw9GLiid4UP9ciu7/snS2gljGqRN5ywgDZnfuqGrmIPb226GnX+ycl5tTGjLnm+0GVSZFp3Rwct0UbMqfUKPxTldbXwUJxo9uFJpAe/mLYIAAS9ZB00CqDA87d6WMnLjMcok3iGhkY4PQeHhSWAeCy5uDMDdyn6zkKjsTyIJ5Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVMSwOuE; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVMSwOuE"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223fb0f619dso73405115ad.1
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Mar 2025 13:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743365882; x=1743970682; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d5coYYRPMmYyk90hyfQos6Hfk3JtJvsesMjWEHhnPPg=;
        b=MVMSwOuEDsHBLL8hUp23gdnt+5UIERm/+pB2P6cGMygdGWWShSNNSUbg6ZU1SgquDd
         Dg7S0ksGmxu2IqsAr9AwVnVEwzmhsxiDnfRxMY4mnHvClvvNwUjadrFwRZpkxwxMN/o6
         myU7vlu24jhTtzGeJ92/g6t3gVfhSfbAPl+qMYLTE06zXEn8Ss9m7yFpEBv6KmhAlbyR
         QfyLP/VVqXBc9v2iOxHeqVAawLzHP5kwstz/mvZSnmdIbu7DNd8ttQUgvDcs7t6oX6Yo
         YDr0vXe/A7YIRsd/10iLBxLADaMhKHhO4f2b0+ny0ChdZO3QNQI46GAMacexi35ubsHW
         76rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743365882; x=1743970682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5coYYRPMmYyk90hyfQos6Hfk3JtJvsesMjWEHhnPPg=;
        b=eMEzhUCEi4HmALMEEuK76q2PIny6QnVWkJZ/b4FHqwViJEccSjhMzzQqoe4F+FznO8
         PdBTJqzAACMKPxlAG5ZZoBPbd41GJrIQ9FsrvN1421fyHq53D+gdJFBUNxnzDRaJY/9a
         WNfO7uIRBVFhb3BNqxOaUBDzeY4IfQJKVmqi4io4wDuS/+DEQWj7f1URmBOUDX3U0sjt
         HWnry34uekP7C6aODtg9hs97l2NNKeAnnB2qJUMdHUUgIoiXON2fzhtvNp3l0VDGGW6C
         5rqlOORRpB2tfZ3ruSm49tQHtQzaq4uFa+k2YfhfxMzPHbkmwLbzui4PG2zY9yfU8VhI
         LpTw==
X-Forwarded-Encrypted: i=1; AJvYcCVeK5A9mfyAk+pgZ0GiKK7oxxJAUjdE27JPK02PSdm00FgEufNHPqT6n5WdNNwcEcewN2bAjS8z6W9GFA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxklc2wdOgThOosw6fM5C2xijY/y17KAdRPs4vyP8VmOGTcojnu
	bnqfbxPhONJZHjRFnbundE0uv7MqJKkSPmb/JHW1WbbX+wKEdx9v
X-Gm-Gg: ASbGncurWw/AehMIsOXIaBKJ7D+MVjBA94UEiiUhPiyZ3sOLks113sXkMoJeuXPCxvJ
	zCyFE1dG7egUO9hg2GbuG3fBkpbzP3SVM1h+Y9d10+TgEh8P5L0ymtrvToXqJpjJEtIiLlxzV8G
	XFSFqCRQcASX2tgKc/tB9ADoU43GeBVjCFuamucJVdy2ONzpeVp27LbDkuMq2ZCxaIIBDZ/qmu1
	7C43g7oJpWlQDLyQbOQ9NirczIAphfNN5eJ9XRUpVquaXj6LWIocS5gOWYk1zV/g5+67DjWq7vB
	eIyxh9x/xMVeoaHDgaxxLS/ezHsRK4sdkSHsA4LNvYDdyTdzzogqaw==
X-Google-Smtp-Source: AGHT+IGdRb8RSEY/uMCLsBXs2PCUKzrfAlPuylZyCRqePE4ThlWVOzd97jd96fvdyjccpN5hsZkrrA==
X-Received: by 2002:a17:902:f644:b0:224:1af1:87f4 with SMTP id d9443c01a7336-2292f974b63mr133802185ad.22.1743365882249;
        Sun, 30 Mar 2025 13:18:02 -0700 (PDT)
Received: from localhost ([2804:30c:b03:ee00:e0b8:a8b8:44aa:8d0b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3039e1139fasm9042555a91.25.2025.03.30.13.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 13:18:01 -0700 (PDT)
Date: Sun, 30 Mar 2025 17:19:02 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
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
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v10 3/8] iio: adc: add helpers for parsing ADC nodes
Message-ID: <Z-mnNtYLkwsTYjMh@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1742560649.git.mazziesaccount@gmail.com>
 <f1d8b3e15237947738912c0d297b3e1e21d8b03e.1742560649.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1d8b3e15237947738912c0d297b3e1e21d8b03e.1742560649.git.mazziesaccount@gmail.com>

Hi Matti,

The new helpers for ADC drivers look good to me.
I am now very late to complain about anything but am leaving some minor comments
below that can be completely ignored.

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

Thanks,
Marcelo

On 03/24, Matti Vaittinen wrote:
> There are ADC ICs which may have some of the AIN pins usable for other
> functions. These ICs may have some of the AIN pins wired so that they
> should not be used for ADC.
> 
> (Preferred?) way for marking pins which can be used as ADC inputs is to
> add corresponding channels@N nodes in the device tree as described in
> the ADC binding yaml.
Not sure it's preferred to have ADC channels always declared in dt. That
question was somewhat also raised during ADC doc review [1]. In short, ADC
channel may and may not be declared under ADC dt node. ADC bindings often don't
enforce channels to be declared. On IIO side of things, many ADC drivers just
populate channels even if they are not declared in dt.
The ADCs you are supporting in the other patches of this series seem to require 
dt declared channels though.

[1]: https://lore.kernel.org/linux-iio/20250118155153.2574dbe5@jic23-huawei/

Would something like

A common way of marking pins that can be used as ADC inputs is to add
corresponding channel@N nodes in the device tree as described in the ADC
binding yaml.

be a good rephrasing of the above paragraph?

> 
> Add couple of helper functions which can be used to retrieve the channel
> information from the device node.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
...
> +static inline int iio_adc_device_num_channels(struct device *dev)
> +{
> +	return device_get_named_child_node_count(dev, "channel");
> +}
I wonder if this function name can eventually become misleading.

In Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml we have
temperature sensor with channel nodes named after external hardware connected to
the sensor, leading to channels having different node names. Can anything like
that ever be accepted for ADC bindings?
