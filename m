Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED713263895
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478064; cv=none; b=K7SnIfF8KABHk0qn+sp4WAE1S8Kskvtf5BcuT0kwnKogWVUKD6cd9ZB9r4klGLmLkXjOZjXbDUwGa3Vw8o6Ks2utoM7YDQJp3rXjdNF/x4UmqbEgk/hx/ysI9QNsOI2v2dZP6hBaaiOKOJDgpxXkZvuIiK3x0fE7p/BgZ59+cis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478064; c=relaxed/simple;
	bh=YTqMj4ps1llscSuDb/2p+FJjVauDFbLTY2iu1MZb15U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bu0weg1qmANcnOtlBT7uhsFBEEkEmvDCdV6awaJALy8K/owPg4k2wSeHxhCr8O9xlsHEbtoDpjhti8QEvQi0+65jfPkxiNG6t7EZe8v2mzwM9F3HJTc6k3winkeBvCbUEpWXN1y7nqhMTSLuVPP5VgBG0fwx4lZZeiA9ZAYWSU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUUPlNBC; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUUPlNBC"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-548409cd2a8so3694859e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 02:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740478061; x=1741082861; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAEbqPgmBi60dC78J9e9TaRL3Bq8nEEXaJp+eattnt8=;
        b=CUUPlNBCh0l1VIVMJYDuZzZqeqc7jiGv+qEuHUWl973Pkc0HlKYMC37nk4um2JLuT7
         DD8Cfq1jK623XICmazyzjuYMrwqOCajEBbwYhm4GHg9g0h6iU9Vr+znLaLxq4kCNlLoK
         toulqDtFuFLzAPtGz89v8XopEON9Z+ZWRVG26vaLpgk7x8jtnu7eYOTWk180NK5hO7yb
         nrBHhLbIKZaopERpPQG15UsN9oledmcnHXCQA/F06SewCSMQAHFxKKlN2X8q89QUrcpc
         Sa64rNPEcWpb0xXxr+WNnKmKfVJnkwOe7ZLuC4i7x36XPiMqNMiSXvESAlM9Fx4U+k4d
         75JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478061; x=1741082861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAEbqPgmBi60dC78J9e9TaRL3Bq8nEEXaJp+eattnt8=;
        b=hyFRBpVLNfr7EJ8FnZxXZe4AuJ/YmpGSvCynlXRn7s954OZ9AZDXk0M4rsEICnVf1A
         PaUrOOUIMgdRL7szC5IsNGk51GiGyIjGVbNkiuumCYZJBCktFyGhyFpRleQsB7HIb1Eq
         pOzaXZ0CnvsNZepisPMfezAn6W8ljaqNZ+cHr1A7yxsgEQqzUB0m5HVbAuQPJ46sqlFg
         biionIdFWa0ibyBBPVzOISz/OGJnvrdgEzBgq71qc7CcnDcd+9lq2ehSj2PS8m+0kteF
         O+z2h0UQnUnECIk2ojOeH/GK/peNpwds9I71gZR0URe7RP1pUm/gq5CMiUZJIAMtvGuj
         Yu9w==
X-Forwarded-Encrypted: i=1; AJvYcCXdpPKNVF4181BJLeroonbnliRR74JevZmO0gYZ2EIVkhEML+Q7bBGdkSyRjTr88YssVvP9gjFeQ4xFQw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz6GKk6j16SjL3eoXUmNFJE0HINbTb1sKW5vNTpMqAzNBsSFg6
	Z64uROrD2EnjudMlBKdQIH7S2ysz+rWW+vpBKjRoxbMIGbW5n9NJ
X-Gm-Gg: ASbGncu7wbqt565Y+itj5Yhu/5XaxNjUn5vaFR8ITKzeIL/+m+Vf5qK5NRc8x8D4IW4
	/MugO7htRSpEDz9aJNzZVeL0uBU2rcMpG/xdjURcBWXduCok7fxFOGFYCtA/pyjzLO/iTqKScLa
	a7hRawlv9x+YlD0G61UcWm5kJqkCf69qBut9bF56KI9FPjjovWz8i7Oc0Z/CemGEmoVlHIboPpW
	cpJCzv9hQGtXU4OdvZkol/cezBpRm50x0klR2nPJh8r2sovLrSjpJf/wlMygnNmNI8L9k9ah3nK
	2Y213nShJEkeRxkLrcybVVKajhmoH/BjjVeocmc=
X-Google-Smtp-Source: AGHT+IE9LtSoTYOkptRbtvW+Pr2kFGMFaZQ0FPl+alwBphqqI58uxcxrb6TXfUP19MarHnVygwrw5w==
X-Received: by 2002:a05:6512:b8d:b0:545:2950:5360 with SMTP id 2adb3069b0e04-548510d7323mr856574e87.22.1740478060709;
        Tue, 25 Feb 2025 02:07:40 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f477esm130333e87.187.2025.02.25.02.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:07:38 -0800 (PST)
Message-ID: <c3cc7f2a-ea0c-42a0-940c-95735d008989@gmail.com>
Date: Tue, 25 Feb 2025 12:07:37 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
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
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z72QAOA9xXbP16K-@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/02/2025 11:40, Heikki Krogerus wrote:
> Hi,
> 
>> +/**
>> + * device_get_child_node_count_named - number of child nodes with given name
>> + *
>> + * Scan device's child nodes and find all the nodes with a specific name and
>> + * return the number of found nodes. Potential '@number' -ending for scanned
>> + * names is ignored. Eg,
>> + * device_get_child_node_count(dev, "channel");
>> + * would match all the nodes:
>> + * channel { }, channel@0 {}, channel@0xabba {}...
>> + *
>> + * @dev: Device to count the child nodes for
>> + *
>> + * Return: the number of child nodes with a matching name for a given device.
>> + */
>> +unsigned int device_get_child_node_count_named(const struct device *dev,
>> +					       const char *name)
>> +{
>> +	struct fwnode_handle *child;
>> +	unsigned int count = 0;
>> +
>> +	device_for_each_child_node(dev, child)
>> +		if (fwnode_name_eq(child, "channel"))
> 
> s/"channel"/name/ ?

Thanks Heikki for spotting this brainfart! :)

> 
>> +			count++;
>> +
>> +	return count;
>> +}
>> +EXPORT_SYMBOL_GPL(device_get_child_node_count_named);
> 
> I did not check how many users are you proposing for this, but if
> there's only one, then IMO this should not be a global function yet.

I have no strong opinion on this. It starts with just 1 user (IIO ADC 
channel stuff), but I've a feeling there are other areas which do 
look-up nodes by name. I suppose "channels" are looked-up in other areas 
of IIO as well. Lookups are probably done outside the IIO as well. I 
haven't audited this, but I wouldn't be surprized if at least LEDs (and 
perhaps clks/regulators?) could find this useful too.

> It just feels to special case to me. But let's see what the others
> think.

Yeah :) And thanks for spotting the "channel" -thing :)

Yours,
	-- Matti
