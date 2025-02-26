Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D81D16DEB1
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740551321; cv=none; b=EyVT4OZLKpqLadF4zsu6+WZZBKD64nK90ezw/MgHj07d0TpNmjI5iotzDh7jt8WreUtl9d7OBNSz5xZXwpMYUHnGsa2ADlECaUqQoR5/RpMDuSyhNEFFnxdyEbPADn4DPPQ9GSPQ4hnMdjJDwvSmZBWBeYKWjqiFvCBHsuCjxWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740551321; c=relaxed/simple;
	bh=NE39zml/fo6kkr8UQOJnZ81sJEhYJwEMHR7KD/s6HFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6MJUz9CgwhdJxeD8xBj/zboVv+dLfEZrH2mBrd2UXqjWR4rTi/kfJ0Gz9zI1DReHGHNe/P0Yi42XAU+A+0qukZq6TJIjtHaFz72Fe/l+t1EUUmURN5nWO4tcpVHCQv/vKc+EPMRntzQUXdHvrRlkTptOlQyGheag9j4WLRP8nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqEEHUhr; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqEEHUhr"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-548409cd2a8so4698736e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 22:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740551318; x=1741156118; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpCHqbGuoQ5BJqZTNRzllttmReMvT/yiMaLd2lRv7bo=;
        b=HqEEHUhr1VSTYiga5sGWZHRx1cOJjz1EzhJrScpT/QP8NTpJp/5t6p7yHvO8RWK+hE
         ZAcG3Lc87k6j8tFfvBTCmYAR7ws3rNWI7Dfn+TGss7lyiLW4aaN7Mb4V+g+kvlmZ8RtY
         mmoo5Q+SkeGXBMEzJ9+9LoI9EiIAHUiNwnoWsr8HDPaBkFzUxZcO581ZU0ylyO9eDpK/
         2KxjPTxBE5u/AFPqaGiho8xEeyPVAEhuyMymc9slYNN3wUHAQjcQWonNI49yojx3e9Gu
         xHITlz0Uevx76VO2K+iDj0l1sjHQqgSfkZgolC3VtJ7PRfWyAklnaUwz+VJ+6xCOSzDZ
         e7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740551318; x=1741156118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpCHqbGuoQ5BJqZTNRzllttmReMvT/yiMaLd2lRv7bo=;
        b=e90XE/XJXx+i/22ht81zLYBO9JNYkMddbNvjulDGRdoi5WLZhQYZO40ew41SWODqTt
         Pof8Av9hGODZRuKj9/stp2WQ8xWNgt92puScwYJ9PKB2B4zv0WAopxBZbNS8jZxQUBIo
         5Uk1Fk4xW1QAoyzIQQP3T0naVki98WB0qWD35gpq/+ZX5unIrq+co6uADKhbElH+0ey1
         o/0wDc24chHydCOB5NizzOfDm32AT91yoRRROZYZmFSjHnDOv4E1/2zFylhDXViGY9Zk
         PS1Pu8oT9GszUi9kXf8zcSVTeu6TWhE0SUxq8iaTK2bneQQYtGIjLANLYWzmost48aGI
         7bNw==
X-Forwarded-Encrypted: i=1; AJvYcCXrpvcicM3R8yqdGEt2cWkqHxeA08qrKmiDCQG6ieCyIrfRyY9eMz/ZzBRebTaetXLzp1fb/pCh9enAig==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO9A7Z7GOGQR2mMwswhm53Gu/xuIFrXj7Q76THqw4Wj7NPJDPY
	gkNylETT5YPFGQmJJmzO1SI2dKXsIch/5+BXXPMHz+aVrAqYkwhs
X-Gm-Gg: ASbGncuCO6tLyCqrh4KZGUs5oeZq4r0jwy2KUG7S28lqMXjNIVjsygtSeEZEGD1T6nC
	NxlWIfvin8fkonJ2pnjpHx+wGhzDISS6vLgu6zjPb0jzmtbMinWt5NDwiJj14LfZhEQVKpRd9j2
	KCfIwKyepvJjhXaxiuV5cpMjcPSWepG6W6VjqDII5UEO93vxjPc4lO2nIP2UqURO933QvY4Dkj9
	Ttqv4DF47Hi49RoOTq0/tdL+l3iEwfVw0eJIgPPkYVNL9CsH0fuidHrK66taxyYevMPzBlr+v6x
	+NBXHPB0DV3kQgZqwaoQhhrLJLxNhfeXE7Sdrre8ELF6VOCFvUdcEjQesWZtpbTSvqcj9RC8pxZ
	5Z3S+9WI=
X-Google-Smtp-Source: AGHT+IFZty/ud0vv7fnUaxvQy7Ed1PaMJjnJwRZzX9uN4JbCQgsINREjjhWVQBBguASQBVPYxKCBhw==
X-Received: by 2002:a05:6512:104e:b0:545:e2e:8425 with SMTP id 2adb3069b0e04-548510ecfa1mr4349214e87.39.1740551317973;
        Tue, 25 Feb 2025 22:28:37 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514efaccsm356242e87.155.2025.02.25.22.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 22:28:37 -0800 (PST)
Message-ID: <1b308a10-9622-47f9-b489-bd969fbdfc34@gmail.com>
Date: Wed, 26 Feb 2025 08:28:34 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
To: David Lechner <dlechner@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
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
 <0de7b0ac-eca5-49ba-b1b3-f249655f3646@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <0de7b0ac-eca5-49ba-b1b3-f249655f3646@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

Thanks for taking a look at this :)

On 26/02/2025 02:26, David Lechner wrote:
> On 2/24/25 12:33 PM, Matti Vaittinen wrote:
>> There are ADC ICs which may have some of the AIN pins usable for other
>> functions. These ICs may have some of the AIN pins wired so that they
>> should not be used for ADC.
>>
>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>> add corresponding channels@N nodes in the device tree as described in
>> the ADC binding yaml.
> 
> I think "preferred?" is the key question here. Currently, it is assumed
> that basically all IIO bindings have channels implicitly even if the
> binding doesn't call them out. It just means that there is nothing
> special about the channel that needs to be documented, but the channel
> is still there.

I think this works well with the ADCs which have no other purpose for 
the pins but the ADC. The BD79124 (and some others) do allow muxing the 
ADC input pins for other purposes. There the DT bindings with nothing 
but the "reg" are relevant, and channels can't be trusted to just be 
there without those..

> Similarly, on several drivers we added recently that make use of adc.yaml
> (adi,ad7380, adi,ad4695) we wrote the bindings with the intention that
> if a channel was wired in the default configuration, then you would just
> omit the channel node for that input pin. Therefore, this helper couldn't
> be used by these drivers since we always have a fixed number of channels
> used in the driver regardless of if there are explicit channel nodes in
> the devicetree or not.

I think this works with the ICs where channels, indeed, always are 
there. But this is not the case with _all_ ICs. And in order to keep the 
consistency I'd actually required that if channels are listed in the DT, 
then _all_ the channels must be listed. Else it becomes less 
straightforward for people to understand how many channels there are 
based on the device tree. I believe this was also proposed by Jonathan 
during the v1 review:

 > > Hmm. That'd mean the ADC channels _must_ be defined in DT in order 
to be
 > > usable(?) Well, if this is the usual way, then it should be well known
 > > by users. Thanks.
 >
 > Yes. We basically have two types of binding wrt to channels.
 > 1) Always there - no explicit binding, but also no way to describe
 >    anything specific about the channels.
 > 2) Subnode per channel with stuff from adc.yaml and anything device
 >    specific.  Only channels that that have a node are enabled.
 >
 > There are a few drivers that for historical reasons support both
 > options with 'no channels' meaning 'all channels'.

https://lore.kernel.org/all/20250201162631.2eab9a9a@jic23-huawei/

> In my experience, the only time we don't populate all available channels
> on an ADC, even if not used, is in cases like differential chips where
> any two inputs can be mixed and matched to form a channel. Some of these,
> like adi,ad7173-8 would have 100s or 1000s of channels if we tried to
> include all possible channels. In those cases, we make an exception and
> use a dynamic number of channels based on the devicetree. But for chips
> that have less than 20 total possible channels or so we've always
> provided all possible channels to userspace. It makes writing userspace
> software for a specific chip easier if we can always assume that chip
> has the same number of channels.

In any exception to this rule of describing all channels in DT should 
just avoid using these helpers and do things as they're done now. No one 
is forced to use them. But I am not really sure why would you not 
describe all the channels in the device-tree for ICs with less than 20 
channels? I'd assume that if the channels are unconditionally usable in 
the hardware, then they should be in DT as well(?)

>> Add couple of helper functions which can be used to retrieve the channel
>> information from the device node.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>

Yours,
	-- Matti
