Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B944268FF4
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490162; cv=none; b=KmrveaFzRXwOAmMjqbZOWV4D3h3B3x1AS/c0AbtXRhcXfKiuplokvTQwtZ0CkNl1p3S6iNbFpKqa8aycm8Ut1pKkJiex0NEXn3NhDCjNyqDUyn5S7UOqulKwk7Meu2WtDICghN/q4YT5CSqx50uzBEo0cJyXXBEudThPiGFHDIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490162; c=relaxed/simple;
	bh=rHQexzBVm+h27NJGWaGxccjhnh05Li9527fFlp5jf58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XA+mvSzbl4aH4ERIQJ9y5YixNDxG5bo/c6lPlM6qP1VqJpeHvC5IDQfgDLG8m2Pl2uwXa8js4O9h7xXwi8aj+zWHYIGpb5SWvOZwkfQQz0PZXZq/S35YAyrYTd2ZuodGgdY7UtwZ/qD8ONJLe5tXFWYk1r2+YcYp7M/WijCX1u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GB5mWHZo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GB5mWHZo"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5452ca02bdbso5239575e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 05:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740490159; x=1741094959; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+FbrRxOgnYTZyaA+lF8b6QjfgGK+98gNFHNL4vg+8M=;
        b=GB5mWHZoOthQtMXTrJ9n4y68BKDJncJLkjREmNGpcRyGkx00zZye9WTPSarofCHRjC
         p1z+7RIZBwyM9IawJDq5o0bpPuFDD59z8UxzEStisjTtPakRzP/vFFBbHyaTNzfxD3zB
         nIwVo/pjKXsZ2h0224gmGcZd+8xlPI17SLqPMj0Nn5Vr5A1JZgYtHbbbsNncqG23p1hl
         HP7WEMA1hMYQgy+q9Ln2kaZkGaE93UZckGOHhYHHL60eAxfFYKS+/NvGvOx5BqGnR1KB
         cb2PSfL5HChS47BAUb/VCQ0ukcZPP3iBBlHP+KW8V9oGukwn4oHELm9ozFsnHBH+f8UG
         BCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490159; x=1741094959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+FbrRxOgnYTZyaA+lF8b6QjfgGK+98gNFHNL4vg+8M=;
        b=pLLPIBnuW1HxMlTwCsjIgl5A1+fol07WF6k2WO76hAk7+Qb210belKA1IwgTTFVf/3
         ionZyxiXAb2yqEyB5qDyGRwKFV09eyO2Ger/q9iv9qTRQF9YyPCYNdZqias6Gcg2llmH
         w5PmrOC/8LDDiD9DgcCmHT6pwFu1N2djpEAf9Y6y14YjgDKu9b4RTr/9J3VB+hEKXRcP
         09zxWcrwvFL9JPUm1bZ5zh+NwSaPGmElf7ZN9zJkwqBDyaCPMg1GgvRttmdSZIlcGgC8
         8+fMAZIZ/V+Xp5EzrlPv7JXe67KJxQocg6z5PByEYGuW9Rk3Trj8u9H96HpGHq9F3wWR
         K/yg==
X-Forwarded-Encrypted: i=1; AJvYcCU29qlU2Fnfkc6C7hormYwMJfoApQGWyEh0a9GAG3w+k/2R0f+VFzf0wjU1uYsAa6U4cEDvmXfoshS7lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YylDgkXt++M8zU0gqyKg5xvDB8ebaX42aY1n5fliulWUqGIAv+N
	NLNaOM7td9KiOygO0xVWlM/YkosnyT1AuUxfaBmnrfnOsaQ6l4PW
X-Gm-Gg: ASbGnctNbYgT1C/gvCcXr/kxAukwmtKPamO140rz9/AwJEbvWtllpQZgu5POX7roNKH
	sr65HIjEweEVkan94S9xFmFFw/lxkUiySlddQ8DIAvA4YPkcRuYzmLc4Rqo9ZUqDWzSJwXjgSzx
	9cnLeGpt9o1qNDZpUjUZGnBK8C1CXveQozy0ZhUU2XA3YshR8iCOycTefxFTheGwMBhKRZsejQ9
	fZ1m3c7Kck18PDNW88IBn6HT3oS/MW8y78I5TGqXXoFilVRUd56dmK43iDbP/wlj44JkQi+2ZYq
	md3QoPtJDEQJllaADCHzE79jbBo2iTYgS953Zrk=
X-Google-Smtp-Source: AGHT+IGjIiZRQoCqQpRaub+un/XzTU053MAFUSi2TNm85/fj9TbmZ/3TfRa1taLP4aGsaQej3mQfPg==
X-Received: by 2002:a05:6512:224b:b0:545:54b:6a05 with SMTP id 2adb3069b0e04-548510eebcdmr1461663e87.45.1740490158959;
        Tue, 25 Feb 2025 05:29:18 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b9db3sm181711e87.88.2025.02.25.05.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 05:29:18 -0800 (PST)
Message-ID: <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
Date: Tue, 25 Feb 2025 15:29:17 +0200
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

...

>>>>
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
> I haven't checked myself, I believe your judgement,

I took a better look and you obviously shouldn't believe :) The gianfar 
used of_node instead of the fwnode. So, it'd be a single caller at starters.

Yours,
	-- Matti
