Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EC118E2A
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Mar 2025 05:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741672182; cv=none; b=c9cMI6h4MGndtmSAfwTNY4EXvXZ65nLPsxChIfnjzf6ezy+BBSy9flAS0xK6j/gBe36ihS+R6/+YsBArfgvVrfi0GqtRRV6sm+RxRzvJAgIxpTH/SGh11BKF9xUj0IadFLWGo3fXhAsuwaF/PVzWIlIFFxb7BF1JEDZQwxeKfYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741672182; c=relaxed/simple;
	bh=vcLPf/kGXdgNxEvJBEVrEREglMzwjiza70RRocx5oyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAwUL7iBHela0D5/8cJogohiQeqxXz2bR/QETKDcWTO+/1X/wDkafrNX1YjZiwfAwbcDc8882XSh5nQL1wXX2uS5cq1mVXYpEGko525hrrF8qb64q3h2hBDmchaR4l3FbcnMQmM83el1uNp6VZY6UkmxlfxKZjmzMBHgr6TFAFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAvkhkNj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAvkhkNj"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54298ec925bso6644077e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Mar 2025 22:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741672179; x=1742276979; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUlywhCQq4uCWufEMKrFo7MVjuzCwOMvUwcuZVYGs6Q=;
        b=JAvkhkNjEd6tGzvi404N+WXE1ZjMrix3yq8V+zCG/LB9H7aD8btEZ7Tjbi0HFXEV+P
         yybuALNJK0Pq9eIkIHM3LbGg2M7zP1v0gT7TUdlI4PmibOFEnYira1KVsA70PaoNS2o+
         5ZTXzQZ/5/VQfom9eLrrWWQDxtrZIX2DUHO8ZQBkzTda81oHDz0kC5BSGCkR94nnWI6l
         gcfaodZZKYQE2cnm830QU7UvIdMNrFfrzJAJ4qKPO/q3xvrFUa7a727xta5Rm2ABeOVe
         3o4QjCtoi8eQ7yCyMprUrBIFJj7LoQi5aPttFplNho0xnY/BBm/SyVZWP7BdgUWTtP8H
         i6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741672179; x=1742276979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUlywhCQq4uCWufEMKrFo7MVjuzCwOMvUwcuZVYGs6Q=;
        b=Jzs3Cq4ySgxRQJ53DfRNmW9KUWbfJg1lttr1+t8wuacjHmOjUbVd4I0E0zI/0axziH
         IvTeBOTnMyUy4yfOG+t0orZXKy31ICcp5pQOXkIAvAh/VW7Y41yd1O4sm6jmPx3zJ6wm
         vAt8qjuVISEOZ2pzqZ5xmbPQ9UHyZyCZUmhHmWJuoYlFlg3OPHMklDArFDlO7aUyOpP0
         1FkW8NcxHBr2rV06pUmkJTMLJ8OQGjVtCEx+kPQ2lmrGcLpu8sIJqFGpRvWGHDopLceo
         IXMNaUTlu1k5b5P4DZbAKBV/5C+w0HDEG4IHoxsYDy/H2TUo7NQkZQJRwtxLHpTBpykw
         BD1A==
X-Forwarded-Encrypted: i=1; AJvYcCWsFTEOduoFOZDjOiM47P0eKhl/4YQzrh/U5kdE5bE374t5fsmM7SR3vTjXHXAQDfQZs7D100qpWFwF3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjVZ2wB1+NUJbV2g0DJgUK/5gu0RP/DtBXVBQ7iKr6xBety8Ws
	peLRJorSdkbmFbgyzyVHqmvcrTsKfbBLz3elXXXnCmzdpMjySyXf
X-Gm-Gg: ASbGncut1bGXJbiOdYiKDy7eO/0/9TucIFRu+pnxhdSJmdNJC/kq2UKCV8Af1ecsHtE
	JnokW0qD6eQgGZBYYaTH1ySEO7COXtl8u2VTUzGPyAjNWujqAbRAl05bsFOug2vE4M+3QD8T1AC
	yxXpSOgiOoW2X3Gw7IkWanKBb3oyPuwK2/4fwPce+eKUrNxQmgJD87wd5f6puBQbQ+iOK0djrPb
	b1oAEKC0j3wmzD9dm2TBWdlAh76NzJTgXOv7Dtc7HRU+wtur1KsPfAVvvh2BV2PRx1C/rkZBK3u
	7DUDHC/BftwpQ3mcc8F4JquxMUH77fkQXOYKnAZhlwLwcMwh3ZqlY9xUmTQGZhBLdm1Tm8yeVgD
	UPH4b2BL+dEHD3ZrpRU1BTKOMrg==
X-Google-Smtp-Source: AGHT+IFm0afzcaF8TIv4cXHtJLsVwhvjYD4qt27mTceOLe/iKEGhGrdN2AEjY+GxRz1y2ryUkV4/gA==
X-Received: by 2002:a05:6512:2309:b0:549:7145:5d25 with SMTP id 2adb3069b0e04-549910b6189mr5273956e87.34.1741672178594;
        Mon, 10 Mar 2025 22:49:38 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae5904esm1651369e87.76.2025.03.10.22.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 22:49:36 -0700 (PDT)
Message-ID: <e685d31c-8cdc-4732-b3a8-8e70a6f82578@gmail.com>
Date: Tue, 11 Mar 2025 07:49:35 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] Support ROHM BD79124 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Herve Codina <herve.codina@bootlin.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Nuno Sa <nuno.sa@analog.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>,
 devicetree@vger.kernel.org, Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Lars-Peter Clausen
 <lars@metafoo.de>, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-iio@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 Conor Dooley <conor+dt@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, David Lechner <dlechner@baylibre.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Scally <djrscally@gmail.com>
References: <cover.1741610847.git.mazziesaccount@gmail.com>
 <20250310202738.13301548@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250310202738.13301548@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2025 22:27, Jonathan Cameron wrote:
> On Mon, 10 Mar 2025 14:53:50 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> Support ROHM BD79124 ADC.
>>
>> This series adds also couple of IIO ADC helper functions for parsing the
>> channel information from the device tree. There are also new helpers
>> included for iterating and counting firmware child nodes with a specific
>> name.
>>
>> Series does also convert couple of drivers to use these helpers. The
>> rzg2l_adc and the sun20i-gpadc are converted to use the new ADC helper.
>>
>> The gianfar driver under net and the thp7312 under media/i2c are added as
>> first users of the newly added "named child node" -helpers.
>>
>> There has been some discussion about how useful these ADC helpers are,
>> and whether they should support also differential and single ended channel
>> configurations. This version does not include support for those - with the
>> benefit of reduced complexity and easier to use API.
>>
>> NOTE: Patches 4,5,9 and 10 are untested as I lack of relevant HW.
>> They have been compile tested only.
> This probably wants an update.  Also, 00/10? There are only 8 that I can see.

That's odd.
There should be 10 in total. And the 4, 5, 9 and 10 was updated.

9/10:
https://lore.kernel.org/all/1c4b9b4ceb1995bce76a0ddef0e04ad0d1d81190.1741610847.git.mazziesaccount@gmail.com/

10/10:
https://lore.kernel.org/all/ab79cf4415d21ff2854fee4f4189fac555c30b7a.1741610847.git.mazziesaccount@gmail.com/

Perhaps it's because of the "net-next" in subject?

Yours,
	-- Matti
