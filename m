Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8601DED69
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Mar 2025 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740920518; cv=none; b=rdMj4K+vbesBAoB/thO7XRMuF+VRMF+iRBsjTUHLKMc4biO+HeW5asX76FIRWpo0SXSsrHuTi9OApKp2UU2Vvk8qXxPDubavJVzBy4xj6Y+qPBSkUoNRyLbjjOsJexFwUKq2DBen9woTuAnSXeYvDh0DS6p4RK6p6gah8sIV/SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740920518; c=relaxed/simple;
	bh=VuF9nBfwzbT9nOVFfJnCaaKblH68O1S1/g9fD+tpvp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYwpGrgoFNLoI4TSAIcJP4GQyRMn6kudZfqJfLVzqDzPPO1Prko/PrxX2WOZhmAUBcgm+mGjd2QsdvPoJ8BJSRzc9ov/2dmQlZO6ZPfV0PjCaxv+wKpOf4QjUcWeW4SU0YJYTk799vfJL4aZl4s8wdya1qWm+jdIT/97vbVitPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fe//gTuv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fe//gTuv"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so4112304e87.2
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Mar 2025 05:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740920514; x=1741525314; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKMpELokI1Izo5JKWkdqhyiLCCqSlpg1TEXyzHNbP8w=;
        b=fe//gTuvCyP3suV1U6auC1w/DXe3oFixOE+AJpuhaM6GhW1pSZh+sPIyV4nzt9fYGB
         kwfE/JInmCnml8Hr2Opmo97UsOG3e0obRrd1r1QpyP/IdNKnMgcZNPBkqnmUHIqwwrUh
         UjTieK7ZmVyZtOJuBAnrpwht4SVnzJ/1F8a/5Tq4+A7zhDPRGJyZeSbEgUHrdCRAJpo9
         7tljdy7YkmF6DZSrXjLje8owBOaPxHchf1zDXr+S9HosfmKhP/CpimKSIUufckUIkNTG
         OiWbxETYjt1YE4/OWkrIqTXGu+slVEPCSog5jG8abB9PHGo4QooJY22jUrzukneMzN99
         Dfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740920514; x=1741525314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKMpELokI1Izo5JKWkdqhyiLCCqSlpg1TEXyzHNbP8w=;
        b=w5Gb6h7QExUUCSsNnUPu7JxXVpcKddkuqQKQGAapCOo/TII9bKe6VWbKbPqaoX2GPI
         Rbp4/fUxsQfzwraJSRm5VHBT9GhNPlIouEKab1vKQ782zWIf5i2bokdEQDe0+PEy5hKj
         7Pi3kDn8Lag8n22GVUgeDgxiLHzI1A31KFVapReZHNSiZZ3xoYOQ2SXtGmGST4ir3rGC
         MoagKmWdK4EUquAsgUnSFoJItrIsQW/mdPzax17FRcEtld/3OLh+Hssga407uTcBEzXf
         +Ljc9UwMJPrMHrqtgNtrwI3jdYRerWZL25QEK9jYbhcvJ22xtshKLMPcJ8ecbWvnYzn2
         P7xw==
X-Forwarded-Encrypted: i=1; AJvYcCXDlRXuDelxzgsplQbnzIQDuUFqkw0Xcbc38U4iYOKXBXM0ZcTDE7l2H8uPGqvEBOsqdeVaH5QvGQiumg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyL4hqPv7zKw4qo59ua5zNrjHU+zDzIHxqhJOOOQR6VnISTGyUW
	fGNG6wSobMuAdin4K8UVUqa9oGev5HG042Fvs9ZKcV8gpMsCYjbG
X-Gm-Gg: ASbGncuh6e5mi8OaGKAA8oVXMXrfwYfwvYpb0j1H+iCTI5Q3CMerxYRWDMPeTUJCI8L
	UfphWWlCQ+5ywLPegN8R9LWiaeRe0/AiVUOq+pL3x+e0f6R54POcayQxRXU6Id5V42Ee6iaPvgp
	LpU7WMMcWC9n+sy5O276h/WDVBlFkRNsflT/IKWR7zOx2oVflU3GISF2V9YHHz9uwOyGISIrAp3
	NH6FUWPp8coQ2mc0YkWL55HTpxTQaj9wfOi/84YjdIETcB+vzyooo+/B9HE2gcevWjW5gbqnaq1
	1a+N0rBdvwJO9/OyIYld5nQrj7s3TZrSvM4r2vFOd4lWUAVEWBxD3353ImxDynCRl/9ASDQF3sB
	890MtOK5Pha3sQDJofiSKmPLrbg==
X-Google-Smtp-Source: AGHT+IFLfMqcH2cw9dr7pix/TGEb+jliFWHuNuFd3kEBSDMMDq3K44UkAX694UgEITw4mLC34ErNXA==
X-Received: by 2002:a05:6512:b90:b0:545:a2f:22b4 with SMTP id 2adb3069b0e04-5494c37d8e6mr3183877e87.40.1740920514146;
        Sun, 02 Mar 2025 05:01:54 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5496094e126sm201622e87.51.2025.03.02.05.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 05:01:52 -0800 (PST)
Message-ID: <023c8a59-55df-4484-a2c2-f629b237e21f@gmail.com>
Date: Sun, 2 Mar 2025 15:01:49 +0200
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
 <20250302034807.680a3971@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302034807.680a3971@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2025 05:48, Jonathan Cameron wrote:
> On Mon, 24 Feb 2025 20:33:16 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 

...

>> +int iio_adc_device_num_channels(struct device *dev)
>> +{
>> +	return device_get_child_node_count_named(dev, "channel");
>> +}
>> +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
> Just noticed, this isn't namespaces which is a bit odd.  I'd drop
> the export anyway in favour of static inline but if you don't match
> the namespace of the next one.

Indeed, thanks. I'll inline this in v5.

Yours,
	-- Matti
