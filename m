Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EF71850AC
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jun 2024 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717668775; cv=none; b=GIM2Y9UJJsbyqyZUTIX1LAVg6zY33b0Zfm2AcVEYgTgWfamUOXhPvMwZmnNcyPiFbBXGbkE/8AJupBy1VdHJEcIgPVphfEwngBCsAnPsxINXba513tm716OI3wdLcS7yG3iKqWVPosD47QiMZp+Gd335m8d8QKTP7brPAXpj5Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717668775; c=relaxed/simple;
	bh=FpruvuPD/Bh18bogFae9RpIep/NtvqwBxSmz4eQZHgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVy/7WHSowIN5ybsbdIUnJiZAgOJ9xINxzWy6wlwzJMt5Q8oDFS2ztX8M9V68ukrH5jKXVjq+T3iWHf6bP++CVaXdq9K1VjUER600fnJq1pyttmZPccnIN7fWQSBxpdubks+MnYaRbezRNxre4wdokr2B3qvkmZw35Vx73BQvho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hAGaZQHt; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hAGaZQHt"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a63359aaacaso117755366b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Jun 2024 03:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717668771; x=1718273571; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYT9tVkTJ0UAXf8TGzWVnjnavb5dtCMnGfW04T5qoh8=;
        b=hAGaZQHtgvA62susQI9L9UpcUJiz1kLacxoQuOB14+iUbTs6t7c1f5G4KUwvKduELc
         Q05NLyWZXtSmu3rpeKTYE9OTzx9fdn/v/kk/+PGQcznOxeEz45G5PAe3uCjXZH3J4f24
         tE74tY5yAhoo4PJ6uV7o361nckXWffBOqOrcEPrVz4Ahj0f9+wO44cX3CGCAaN4zn40x
         vfFzya452o61JsovWcR3IwofiI1cz7swkyJiU5o8UxcFkJMitkWC+qzXSqfF3GcFaH11
         zN14fHqZq/G394ZYTPY8Jjz4wxP1JOn9ZGCQOluKlwDHpX3lxFD+FfleKDA7hfsgk/UA
         ZeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717668771; x=1718273571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYT9tVkTJ0UAXf8TGzWVnjnavb5dtCMnGfW04T5qoh8=;
        b=dENOPU2UWAHPmB/B4b6ugB1iQ6Jgo4B4Z4PUsvmA+iez4QtlRcoF61oIwars1j6Bzw
         uLv/2F2KWGCI4+K/SayV3/cfdnKlUNOJyzBFMvYmWb8qE/nzgQWJkF2/Am9SyGLbTRbT
         ZrwilSTBNVbjii/9hrQPkCqkhW0+gT/ZdUsXmjm1X7IresELwl/SIGdtAOB50zNU5L4k
         Nc4PIYOQN4OAvpC3wIaIeeytW97R/pUograz1wowc/QiAopjA0/3uWBqyvSMRgRpi9kj
         MVMIHm7pJjk1JzAOdkMBzQGnLU3uB6NKlOJIprbjJ8zuyLjnpDw1xbJd9Z3YyL4Sx6LG
         Ii/A==
X-Forwarded-Encrypted: i=1; AJvYcCV7kBTXDI7iTC1c78fPT6y2wKj9mJdMAtO8DABF1vU69f4eGP8qcU67RiuJ4HYlTs3DTC6NMaFREvbO8Nav8ikNWPRp8ppp8YfhNws=
X-Gm-Message-State: AOJu0Yy9G5tJ0AVOrcXrzWWjQkZfMchgofaLyf5xJPD/+FRVXOd6fEam
	WTmZQj0dzBA+JjwKQb9UIinELDdymxgNDpL6iP4QEfXSYEqyYBfs5BjoYuZ7U+A=
X-Google-Smtp-Source: AGHT+IGXEvwhigvaa2F7LH3u2SEZD2GotxH0tm3Qb9rzSgbG/zs824MHzxfnZBM0j8XV9T2jW92teA==
X-Received: by 2002:a17:906:38d1:b0:a5a:1562:518c with SMTP id a640c23a62f3a-a69a02363f3mr311414866b.48.1717668770651;
        Thu, 06 Jun 2024 03:12:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8070e82esm74598366b.161.2024.06.06.03.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:12:50 -0700 (PDT)
Date: Thu, 6 Jun 2024 13:12:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	manugautam@google.com
Subject: Re: [PATCH v1 06/17] misc: eeprom: at24: Change nvmem reg_read/write
 return type
Message-ID: <e5f3e798-0fb9-4dca-9449-cc1ab0677700@moroto.mountain>
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-7-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605175953.2613260-7-joychakr@google.com>

On Wed, Jun 05, 2024 at 05:59:50PM +0000, Joy Chakraborty wrote:
> Change nvmem read/write function definition return type to ssize_t.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> ---
>  drivers/misc/eeprom/at24.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 4bd4f32bcdab..0e8d92d6ab1e 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -424,8 +424,9 @@ static ssize_t at24_regmap_write(struct at24_data *at24, const char *buf,
>  	return -ETIMEDOUT;
>  }
>  
> -static int at24_read(void *priv, unsigned int off, void *val, size_t count)
> +static ssize_t at24_read(void *priv, unsigned int off, void *val, size_t count)
>  {
> +	size_t bytes_read = count;
>  	struct at24_data *at24;
>  	struct device *dev;
>  	char *buf = val;
> @@ -465,11 +466,12 @@ static int at24_read(void *priv, unsigned int off, void *val, size_t count)
>  	if (unlikely(at24->read_post))
>  		at24->read_post(off, buf, i);
>  
> -	return 0;
> +	return bytes_read;
>  }

This is called like:

   574          ret = at24_read(at24, 2, &val, 1);
   575          if (ret || val != 11)
   576                  return;

So this breaks the driver.

regards,
dan carpenter

