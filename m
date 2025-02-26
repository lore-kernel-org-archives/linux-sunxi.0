Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5993318DB27
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740578650; cv=none; b=SS3ATA1k1gHxW3hbkKk8OcKjWFAp1/O8T+mDeQ1vZWJSwWPD/DFjmAsgCNxaiIB1kSgqNJ0vOBg25Zrtire0qeqRcVu4hT0cDQx6KxkQYLtSXz+Q1h17RVj9LWccQJvDCzVQGlcXmag49RJYg7E4Y58cGxiursAPoH0J+PdTrqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740578650; c=relaxed/simple;
	bh=S2p3Ef/P1krdtUktIdrjzgBiMwDtsBQhT0pWSVjIEF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oh90EB4if3i3CaAmFZh58h58GP6hVCgY5zC6D3WRqA1hcmebCt6KaHB2Ea1fl0GxkTyVymRjdvHta0+GklZrLUETDhmcnzz2psErGeLSKVyRVQvvQ3Keo/Kryk8qEd1TYEXPzM82qv+la5P5FTY3lFjpgzK0hsH53/nPSeCfPZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSua1ftE; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSua1ftE"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-547bcef2f96so7011368e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 06:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740578646; x=1741183446; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iklNm2KayquShiYIwOiveLvoWuecEHw4Y693C3rLQds=;
        b=JSua1ftEnpgy4RCHiBvyxalr/pkzIMSFBwqucGd014ijucbKR/TwF9NGm3KHvijUHC
         lxOuL+wHQ3SENMU7ePfETsI5yLxhQys3MBtXXAfRaStEA943BkOIyh4IGetXYz6nh/Su
         dM3qJz8uIgoEnMGXdvCOcRhUTVZ7qtdZ6j7ZHGM62fWj9x4/Fx8+YjzYkzBfiHCbPnp4
         FIUQzmCe9TLh1Bxi7V+ZrTPwPbTP21lUzxVLW4iW7CAFARiuu9azFfDx7Dt8u03wnpIr
         wMpvMUmE6Q7uzrDe688QjKb+OtEc3VDc/KfVAkiLGH4XAGJNzaEH1wapGFfQos6Hynhi
         ycsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740578646; x=1741183446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iklNm2KayquShiYIwOiveLvoWuecEHw4Y693C3rLQds=;
        b=Kxe7M72NGlO/Ik4Fm19kDXKgDAfjZPJe5XP9dkzabJ4mI1gVeEaMOIZPL3gRV7De05
         IlFrUEVluk9jpl21fTex3UvIV5Jh4WfNR4iiEOp7R9qJA3YzxNKXQ2VZAYl8auBDmSul
         jxHGVNVG6J4AVz5V4lSwkjtELwExOqHhgjdpH9N7GlJa6m8TOdF4BKRrrNyOLKrieocH
         9gCtqclmdUq06n1XUHE4wSxoovFR25qAcEv67TTRPdLY3yp8BV4oTRmabGDhweIpujGE
         6AIVmHERbmWVQZMGSoXORjPXykx18LZjjNeblW/K3vkYIiCNJGf5fvJo43D6bpsqVS00
         1TrA==
X-Forwarded-Encrypted: i=1; AJvYcCWjdxoTVkDk1MQl9XFxfW0F0mv6TArfHhXV5HgQt15Ax63xlP6NMLSB4hKKRp5XZo03nwjwsqmYcDIkPw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7O/ibfy+ImDl5P43vPyFgufpacaJm7XDr7fb+BoxwYbtleGOb
	ml/pNiJcPDpCCzHXGSjH/6y7on7NsUSusy0McxVV2DgS1E+sA7yC
X-Gm-Gg: ASbGncuAbxwi5k0WjsVtZ5IgZrI1cPX8XDFrbBlxAogY+CgJu4DCqxfFHJEJLjTCvzM
	uOrm5CWnPNM5zgmSXL4eXvO3seFdjLtPVRn9sk20KDbeMOzs6r5PK4LZW6SGT8yUSgay7q8USLB
	i9I4YhD2wo1MNZp0cvuCQODkysvN3sGG+H8vXPb+Cfei5qgH/ed/JDdTm22hTJ63lU71N1Ek66b
	9+tglPxq6XKIis2GpQa9AWwvHtC+Jthbm4UV35Xj/GgAJSE4toI0If6CKkHcmbPviQxOKJkBZPt
	hVQKDrnfqnq1dwwnctjzVxnJ5gNR9rA8OSMR4zm317EGi8evCkguoQjG/2HLGHs3+BR2xdS1kq0
	6hHKa1tw=
X-Google-Smtp-Source: AGHT+IEpGk7dlruxQZybiX5fxanW29Ro9PxXVGS1JEbV3E8cZgaWlz6jdZJLrmU850dRn2ngJkTU1g==
X-Received: by 2002:a05:6512:39c7:b0:545:f4b:ed58 with SMTP id 2adb3069b0e04-54838ee8b18mr11567732e87.18.1740578645999;
        Wed, 26 Feb 2025 06:04:05 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b72bbsm462711e87.56.2025.02.26.06.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 06:04:04 -0800 (PST)
Message-ID: <720f9c69-ca1f-45cb-9f6e-c8e4703c9aad@gmail.com>
Date: Wed, 26 Feb 2025 16:04:02 +0200
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
 <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
 <Z73M3Ua6u1FpgBEK@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z73M3Ua6u1FpgBEK@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/02/2025 15:59, Andy Shevchenko wrote:
> On Tue, Feb 25, 2025 at 03:29:17PM +0200, Matti Vaittinen wrote:
>> On 25/02/2025 12:39, Andy Shevchenko wrote:
>>> On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
>>>> On 25/02/2025 12:21, Andy Shevchenko wrote:
>>>>> On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:
> 
> ...
> 
>>>>>>
>>>>>> I did not check how many users are you proposing for this, but if
>>>>>> there's only one, then IMO this should not be a global function yet.
>>>>>> It just feels to special case to me. But let's see what the others
>>>>>> think.
>>>>>
>>>>> The problem is that if somebody hides it, we might potentially see
>>>>> a duplication in the future. So I _slightly_ prefer to publish and
>>>>> then drop that after a few cycles if no users appear.
>>>>
>>>> After taking a very quick grep I spotted one other existing place where we
>>>> might be able to do direct conversion to use this function.
>>>>
>>>> drivers/net/ethernet/freescale/gianfar.c
>>>>
>>>> That'd be 2 users.
>>>
>>> I haven't checked myself, I believe your judgement,
>>
>> I took a better look and you obviously shouldn't believe :) The gianfar used
>> of_node instead of the fwnode. So, it'd be a single caller at starters.
> 
> ...which is the same as dev_of_node(), which means that you can use your
> function there.

I'm unsure what you mean. The proposed function 
device_get_child_node_count_named() takes device pointer. I don't see 
how dev_of_node() helps converting node to device?

I think I could actually kill the whole gfar_of_group_count() function 
and replace it with a direct call to the 
device_get_child_node_count_named() - but I am not at all convinced 
that'd be worth including the property.h to a file which is currently 
using only of_* -stuff. Well, I suppose it can be asked from netdev 
peeps but I am not convinced they see it as a great idea.

If I misunderstood your meaning - please elaborate.

Yours,
	-- Matti
