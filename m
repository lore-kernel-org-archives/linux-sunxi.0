Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73D21DF980
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Mar 2025 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740921352; cv=none; b=OOFARxo4rlKT2FMHBq/ZM8nF2hQKBqKGWbClTiF7nfmpxe02gMvsbYFNlqPJNJuYg8pkS6g/k6C23R1SdM0DGSbCbu3GKHWQx60R5Weqt3lcGlI0fQiSOBJ355s3QphwE323m1ipw+0t8pUTATorBicSCe+zs9zWddRSPm28KLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740921352; c=relaxed/simple;
	bh=E+tf5gJ3h3w6HycF9ratLCSZSX3tCmqhgj6Hu+c132g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qx5OeHtyaOs6HT2HZwp51RhBrTLk4TEaqbzyoDltZZt0iMI5GBLeHJYzyiO0hlNZch9+oQITR2TXJAdh14h2/510QdICYdXfZpYpQByn+XuOKvgvDZLqe8TpYD6BUlIuhBMT1HSN1XSgOPOyOR7+O4wnFc1JaQyLxgIlnNPBfEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsy0WYMk; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsy0WYMk"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30ba563a6d1so11103771fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Mar 2025 05:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740921349; x=1741526149; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aOHZ9RwHYzXMQ8jAnz//sM4ODepJhiFxm1L6Ef+fj6g=;
        b=dsy0WYMk0ys1vBtf782TJXimUKAuMf9R6xsYnnXNS+r7kywI38clGCqna0IykxbSSO
         kTdGQmPVOjI5+xaJyvAVLHPWcJhDjnSfk7sEGNKW9IYcriqv5OmUHC+u49HZs/N+EjT7
         HBZ6o7AHoLh7AY23t2Uixr8l48yqoQcK2c5B2OzynwYICO4YNtcp5WjXuLM2pqo0Z+hL
         osAS3Uvm2QOEnN8hQjTaU+yr850Bher55zsP4QrQvZ8IalKodoJAjAkovFEqOE7E75Gq
         uAnQhbRX+brwbPvCZkYkqPLoKhmdytXNJCLDx4Lr8hmjlrPISz0LLoBq6sV2abJQ+0Gi
         tU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740921349; x=1741526149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aOHZ9RwHYzXMQ8jAnz//sM4ODepJhiFxm1L6Ef+fj6g=;
        b=Ik06KtYZ8gGqN2CWsSje0qrGoVJyoqtNsqpOtKrE+VyQOHzqzObxnbWhlVWTwsYMyC
         gzzsswkLp+3KkqSZeRBDrHwq2aNE+fcwOPYJFa8cO/zHhEI7i2X+fQuWGJHv/G0Txk9G
         fl5Pjc9CXPuNuUpIdaZwUgAofCM3oWnBrA6hwOfrMUKlF6bzvfz7/lWoQAylBVzV/ds9
         2Jm8q7n8nlC5rC+VGUa3pCdNZo0kb7EZg+jy5qfwaI6oymb576A9sWUSru2EBNu8IMgm
         DiyrG6W98imwko2WILKqxEQeIUc3PUJwk6bVVAhhmNzvLL9JbmeMA20mhTv8gUFtTQcD
         dARA==
X-Forwarded-Encrypted: i=1; AJvYcCUdm9xQywPUq2VBUKPQch+FrlS6PaoBHv5jSw4bA5jNQQGGYGiiKO1+voEhXR12MKqVEkt2HdQklyp8tg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx02Iezn55DWYcL2qnhnD1Ou6/tmzkx+wsG2nsZAdzFXpEblaxC
	FCP1RWkBaEd08Df1Rukcr378UEcKTV8MQ5s9CK5CVG7PoWkwifKx
X-Gm-Gg: ASbGncsakPCG5PoMEu5ARVlHN/8aqiABDXV+Mv3WwVtbNby9kZvDf8fUcLMdpIdJ0EJ
	9DiB0TkE+N72I72bQf4sQ1uqkhd7zYjvsY9VqEttv7cJqU1W7OUnnGRkabCcEw5V0ljYFmFJo3K
	vMd7hqIfwfLUnsBk/K9wzq1FMMR6wVkPk4sqS80LnlBJG093J/3JnWShuAjx18ZyKuMa4wyoXq3
	u0TI60ekX1FBBccNzNZOuiR7AMly/hWLNsHrssbIgamIU80E0vs/EMcC4szuTkTK9mQ2q3lyLDp
	cuwwzfl/9k6JQ/XZW49cQOJ3llumyym68UIiCZbDZEvEQUn6BGhNXdRzZ6nBF09aCihxySTR1Jc
	uKQ1UWs7qmHQlWHhDHltD+t4tuA==
X-Google-Smtp-Source: AGHT+IGHFptw3pHDNvEkh6S8B9YASLA7Mxg1Ob35UR3qFEC4CECgPhwErw/f4EuhZrqOLOxsFMYCdA==
X-Received: by 2002:a05:6512:3a90:b0:545:a70:74c5 with SMTP id 2adb3069b0e04-5494c320d67mr3708996e87.13.1740921348639;
        Sun, 02 Mar 2025 05:15:48 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495bc78d51sm353840e87.27.2025.03.02.05.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 05:15:48 -0800 (PST)
Message-ID: <ccac509c-d063-42f4-a092-bee4014ec9da@gmail.com>
Date: Sun, 2 Mar 2025 15:15:45 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] iio: adc: Support ROHM BD79124 ADC
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
 linux-sunxi@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <4d1bf5df8f3b0f760422b6b67fcc8245ebf520e0.1740421249.git.mazziesaccount@gmail.com>
 <20250302041046.7fde3c68@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302041046.7fde3c68@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2025 06:10, Jonathan Cameron wrote:
> On Mon, 24 Feb 2025 20:34:30 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> The ROHM BD79124 is a 12-bit, 8-channel, SAR ADC. The ADC supports
>> an automatic measurement mode, with an alarm interrupt for out-of-window
>> measurements. The window is configurable for each channel.
>>
>> The I2C protocol for manual start of the measurement and data reading is
>> somewhat peculiar. It requires the master to do clock stretching after
>> sending the I2C slave-address until the slave has captured the data.
>> Needless to say this is not well suopported by the I2C controllers.
>>
>> Thus the driver does not support the BD79124's manual measurement mode
>> but implements the measurements using automatic measurement mode relying
>> on the BD79124's ability of storing latest measurements into register.
>>
>> The driver does also support configuring the threshold events for
>> detecting the out-of-window events.
>>
>> The BD79124 keeps asserting IRQ for as long as the measured voltage is
>> out of the configured window. Thus the driver masks the received event
>> for a fixed duration (1 second) when an event is handled. This prevents
>> the user-space from choking on the events
>>
>> The ADC input pins can be also configured as general purpose outputs.
>> Those pins which don't have corresponding ADC channel node in the
>> device-tree will be controllable as GPO.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Some minor stuff inline.

...

>> +#define BD79124_INTERVAL_075 0
> 
> Can we make these units in these explicit?
> #define BD79124_INTERVAL_MS_0_75
> maybe?  Nice to avoid need for comments on what the units are where
> you use these.
> 

Sure, thanks.

>> +#define BD79124_INTERVAL_150 1
>> +#define BD79124_INTERVAL_300 2
>> +#define BD79124_INTERVAL_600 3

...

> 
>> +static void bd79124_re_enable_hi(struct bd79124_data *data, unsigned int channel)
>> +{
>> +	int ret, evbit = BIT(IIO_EV_DIR_RISING);
>> +
>> +	if (!(data->alarm_suppressed[channel] & evbit))
>> +		return;
>> +
>> +	data->alarm_suppressed[channel] &= (~evbit);
> 
> No brackets around the ~evbit.
> Check for other cases of this.
> Otherwise we'll get some script written 'cleanup'.

Sigh. I had a lengthy discussion about this with Andy explaining why I 
like having the parenthesis to avoid any confusion. Well, I suppose I 
have no options if you're strongly opposing them.

...

>> +static void bd79124_alm_enable_worker(struct work_struct *work)
>> +{
>> +	int i;
>> +	struct bd79124_data *data = container_of(work, struct bd79124_data,
>> +						 alm_enable_work.work);
>> +
>> +	guard(mutex)(&data->mutex);
>> +	/*
>> +	 * We should not re-enable the event if user has disabled it while
>> +	 * rate-limiting was enabled.
>> +	 */
> 
> Is this comment suggesting something that isn't done or referring to specific
> code?  I think it wants to be in the function above where the decision is made.

I have to take another look but it seems it got misplaced during the 
road. Thanks!

Agreeing with all the rest, thanks!

Yours,
	-- Matti
