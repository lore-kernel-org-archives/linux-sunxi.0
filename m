Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A658266EF4
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740480734; cv=none; b=TnkSmEKoDPRJZhlOx/eKTCvb+uFlHag0wOpg5duTjBwpT8Oqjnb0V41fIFViIRfW8ZMBDPHsTg5VS3gYzmpUsy3q3rJVrdrwhMHciK3eo/tznzBBN0lvc8pzTasgSuSn19HdElR5qFbu2Omvg0/6LKoE64M3HFmdtRvBmgvIOLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740480734; c=relaxed/simple;
	bh=uAXx1+xeAFyV+SUI7uXjsB9Thym7OEsMYo16qDBycS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BszqI1TQoLpgLv3zOeg9vyPHyKTmP0EjTyhtfhhV2GXsEa4Dh0Pq5JA/y1GfIhPPOR5niZrLyLMD03TxHngkJqCUGP4wtfMLgxMOqL257EfwjGULccMVg6QYv0oC7iHz+eIlCaOVkwqJlOLtTck1M6lPzI5hVqsmduEmonbVaj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrfMvG95; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrfMvG95"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30613802a6bso56879321fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 02:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740480731; x=1741085531; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oh6sf/0cKXadcZmQR4PGzWs7fubxPpGtogL6k9WOu9g=;
        b=DrfMvG95XSMr0ACFSI07b11+q9eVOEprQxFhteafXW9yexowcnKPj7UzE+YZbsO4CB
         Nb92fQqBbv8Jc6+wjLZzc+4ei/cjCD0Fkab1Y1z+piNREVdd0L2XSlSPIRLsNmQ6deaa
         7x+c7RylrN5HKKn9MBQTUy7oEmGfHqtVbfTR9Xj6K4JrUclBDCOj3aQnOjGMoknWZBbC
         uFh9HFGriIQkpIJm560idE6r9xZ6XhsKy5SfUSnEUbSFyglJxEFJULLCm0HUrXcWptZi
         F/voStCZoo2RUSi4YYwiz549NE31fexMxi8cHvxATDOQsFGnFkv9xlzBFM2mllyjWc4l
         rVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740480731; x=1741085531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oh6sf/0cKXadcZmQR4PGzWs7fubxPpGtogL6k9WOu9g=;
        b=iTSd3oc2X0MjmsVX3NezzE6tTFzhSpwz7pyidZUyG3TRqZR124Px+mgy0FM385U+1T
         DfXpjZm6Oh+E+6qiUaeconY8Vjx/4TGpan2b7jy+8x6Vj1cddIws9Ctwmn/7L+FfeeNK
         62GPrGzRRKSRP8JXxOuCoKLSeGliDB7Ht7qYDQon7LYtaXoaERkJkVGnU/TABdOX/aWE
         Dqj0t6JmDIms4DRVCL2NP0UoH/INji5wsvM75/f/DS9CnitboKyQQrnfMGDRrbxvmAnN
         lXSlZfMopS+gqNdvFpEoUnaWf/m8NTR83myuXAGbV9a7Lm/6IXgv9juMvJBwpgWG68lp
         7BZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUF2PXtmq2Urmz4bhAcujQ2R83QrGrSp0b0J6rz8VAFQ7ZTs1A5b6wUf8JBGEM17OJL5CJF0PvJStZdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyegMnqwMTWjNH2pgz/6kQUP6pOx3I4pPq9wCeSEuc1Alw8hGT2
	XGucYqcqKorr+rgk2sVjFtlnbemHQwEI//Y9u6knSdww4tPoou7z
X-Gm-Gg: ASbGnctpTr8pj+ivLe+8YQIJ2YAg+leX9EvjmvTlrpqmcSTEgPJydZNIJvfpZw7GMRM
	PKpKdWd/HVBetVxL1XPviXs+6DafYzgRWXLqnMb9GvvLml1se3DwQ5desZnO4kQmxRxdgcNRGFk
	q+J9u25hSVLJon9EHrLkyeLJVb4mrqsPO1sEqMjJ+tn/7cBrVcol+aabVO1YEFOjJdv7O26ra9r
	LAnpZxVs/36ZYA1d/+cyfGiVQVwI54Hcao5UranIwRWoMmsce1jnJUncpwC/v8KfYrpa9wW8Ldc
	DIcVdoI0L3rKUbuoESQOh2b5XBz2S+O3VM/HNZQ=
X-Google-Smtp-Source: AGHT+IHos/L3fbLnhOLot3czcjTdpc0kSS3ue5NjEpFQm5GfsKczAy1WAOw0rIcb+pgC1rLfhfv55g==
X-Received: by 2002:a2e:98da:0:b0:300:de99:fcc7 with SMTP id 38308e7fff4ca-30a80cb8079mr9573441fa.36.1740480730280;
        Tue, 25 Feb 2025 02:52:10 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ac3190sm1936591fa.80.2025.02.25.02.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:52:09 -0800 (PST)
Message-ID: <f92724d5-e9b9-4cdd-8443-4866946d4568@gmail.com>
Date: Tue, 25 Feb 2025 12:52:08 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
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
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com> <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
 <Z72d7TzZ21WITW3f@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z72d7TzZ21WITW3f@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/02/2025 12:39, Andy Shevchenko wrote:
> On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
>> On 25/02/2025 12:21, Andy Shevchenko wrote:
>>> On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
>>>>> +/**
>>>>> + * device_get_child_node_count_named - number of child nodes with given name
>>>>> + *
>>>>> + * Scan device's child nodes and find all the nodes with a specific name and
>>>>> + * return the number of found nodes. Potential '@number' -ending for scanned
>>>>> + * names is ignored. Eg,
>>>>> + * device_get_child_node_count(dev, "channel");
>>>>> + * would match all the nodes:
>>>>> + * channel { }, channel@0 {}, channel@0xabba {}...
>>>>> + *
>>>>> + * @dev: Device to count the child nodes for

...

>>>> I did not check how many users are you proposing for this, but if
>>>> there's only one, then IMO this should not be a global function yet.
>>>> It just feels to special case to me. But let's see what the others
>>>> think.
>>>
>>> The problem is that if somebody hides it, we might potentially see
>>> a duplication in the future. So I _slightly_ prefer to publish and
>>> then drop that after a few cycles if no users appear.
>>
>> After taking a very quick grep I spotted one other existing place where we
>> might be able to do direct conversion to use this function.
>>
>> drivers/net/ethernet/freescale/gianfar.c
>>
>> That'd be 2 users.
> 
> I haven't checked myself, I believe your judgement, but can you add a (rfc?)
> patch at the end of this series to show that? With the luckily event of acking
> by the network people we may have it already done.

Sure. I can add a patch to gianfar when sending the v5 - if this new 
function is not completely NACK'd before that :)

Yours,
	-- Matti
