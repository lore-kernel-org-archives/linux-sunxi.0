Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771321;
	b=L6Hkvt79I8cjUHcVQ9umqjFuSrN/k7R7O9D8D+foKcn4tMa7LUOPTWuUFN8WyQk6Hwc7
	 D23Lo0ADk+HSmTjqek7u+F3U3erfiKyvpEC88wR4zMe9/AtplR42LaNhIYVACrvMS/BM4
	 THfiIKxP4Mh0/fdOBViJzb90g4crWeCkHtLiFC7m7RFHM2gXDGe0BPhMAp3ni0BcEWJ8d
	 aUg0XJ9H585OvrwKAYl+WvD0b0GHP7G05ldqa6+1FqVJ5UxG6a3iwYBYzta3QVr2BkmOQ
	 J7ObJlRGchIWA2NFbAgeUFfJkJktLOp6V4cn7vB3bSLrP7hp1MHJNrsmqJJrhYkqo0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=XqN+LSE4nSI9/z7BXHGFyErjuKwOTgsn0qz0X0Y03jY=;
	b=lG7qcyTAFUU5vO2UPyxWKhMbr6HmcWqeJPdgFhAqf0xJYg0LdVTl4KVLggdQbbISbkDx
	 PVFJWFEbOK9w17KS9QAjxq66d6SwBA9NsW+x2izHoxHofuQsHjS3FwjYrEDkz8P1vrq/o
	 J6PN1oiEeYAlxnPREaoGb0l88AXpv67JRSr8fyvTHobKEkLy/y9whVIbK6rUJ1RcRfWKn
	 B1TmTMVcY1UH4UVkPjtpwOY8DiuMcCQ524ST+EgMlQ9EwZto8Xj33wmBhqHhOd59sVdbr
	 0/ykX7PwBD68fV6xynhk97epl/U3+e7awOqELO5jM00BQWacJbArKowvVfCq7JjWvXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dz8ZJM5X;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6C0606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 09:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D6C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dz8ZJM5X
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso72139715e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795771319; x=1796376119; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqN+LSE4nSI9/z7BXHGFyErjuKwOTgsn0qz0X0Y03jY=;
        b=dz8ZJM5XCpCYBIqRXMSOZvrcu/6QC/ZotyJmJ5XxeWUKVMQ5W82zuJ4LBPGVqb7VDN
         HFp8aZRiodnONJJoaclMWeFslc7mlvGGh7EiSqvzMllgTCAUoQLSmJ2WZdm8uzNM3469
         misosnivkLYhnHo2NE9inAf3NrVXGiCPkcU0HV1ZxcT2w0eijz1dpLoukldZ9R9mRqhx
         p4JtqFuviQxkH+LBk9b4i1+MdOcU06a3dAeby2HBGp06y4gxeWQTByGEkplKDAhyzwr3
         lpx5pbNEkyR/W1ypARmT1jnrp2DCuuty+nKLZYEZ99B6u2CxMFsIDbgurwkT9gQ3A61V
         WExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771319; x=1796376119;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XqN+LSE4nSI9/z7BXHGFyErjuKwOTgsn0qz0X0Y03jY=;
        b=Zp+2dEz2xdjXl5/iZE2+LyjKgT3g+2Mj+jGfJWIoQWfbTYJOSlD6A9db2gO67wWNU4
         0+bmBAC98QlPJeetr67xImT9FKMwNgP4rGxw4GnTIY8bfHs9AOr65VU5vc0HzDG9+tpT
         idE1JjV/6AOQH4HdRvNfzACftk+MvD8ZEKWWMXCXXtDdj/mURXzwRIpHLJbQt8CEvLvP
         LxeBA0a7YvmR/cr7PRcCWrVvfb2HTgiPTZU+J6w+wcqB6j9Du1ldZEsVqK0rJ8dqhr0t
         tZ1UlAsHYf6ZT1u9LOPd3LQuFXhcffbkIL1aeT05ZG+M55098jsOu0OiTDGZMhf4Ki/G
         6l3A==
X-Forwarded-Encrypted: i=1; AL+hErFedtLPiHSHH6LlmdH47If3glc7gyzrvAY4NbwrOLEz8bUF2WRCO1H50+QT7nT4BKMuBAexvyhAnCiF0w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/tFWxu5kMY4XewIVCtlEhu8aQXVV164JHZlGIb3zDYzmXAsG98
	KPrjrM4nJxIFxcXB62S61igzu8O3WCWB4IuSCtom+3k5YHozZuxtTUi6YqtHmQzg8Eo=
X-Gm-Gg: AZFdTZcKY0CGBfOamcKRtuusdlcYD2vz0Ipe1QUY1XZHZRaYbE9cppUlV6j6DsILdlU
	d7WglSroPhVpeD1tNLY+42sE7BLC9O+88zh5miNm7omDoOXVTs00MbzTgN3rKIkrdJHC3taY4uO
	EAQW1db1m8UuLpJH4tbLyL4PlqwoLfRrUkz+eIy/9zL5z7jlPrGR9NdPYLr6TvILKBzYbXZMNAr
	gfIuB73r4vgDiQU2t3wgWNsiS8w9do3AoFBYJIwVUVGApaGTGkXSIrfDUTnFl+sn7mhnN/HsNVW
	yiU/cFw9bVeB/7/8krk1jJskg01rQIkMpVczKxeRhz3r010AArdpInJzLSd1AKk6RJpQb6jdSOi
	2y5l6YKoDzjGpKE3S01wUSVRAbCRayoRTTdx5/eF+ud3IEZjqXtZYNV2oXRLXTNSbopSb6zcZIv
	SPjRLruIpMVa9KKyEgC4c+is9QspIPCWuAvB0xiH1cnxw/smBdqZTCheCtXHjr6TbbYGrAtpABX
	YLSnNSoEVyHDj55MO6MLuGgvrsL+TcdAryfXMNsoDNlHh7kv/I562i76HGSFMn9P0t6ZTiFuR6a
	bWvZBfbO1/UEWX4hr07acU069Dp7Z6xcSPwdrBC6iz4EVFBz
X-Received: by 2002:a05:600c:4f10:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb88804d35mr538864655e9.10.1795771318996;
        Fri, 27 Nov 2026 01:21:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm741305005e9.14.2026.11.27.01.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:21:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Hans de Goede
 <hansg@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>, Conor
 Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] regulator: Add X-Powers AXP318W PMIC support
In-Reply-To: <20261127084820.GN38590@joneslee-macbookpro.roam.internal>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20261127084820.GN38590@joneslee-macbookpro.roam.internal>
Date: Fri, 27 Nov 2026 10:21:57 +0100
Message-ID: <1jzeuu1vey.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On ven. 27 nov. 2026 at 08:48, Lee Jones <lee@kernel.org> wrote:

> On Thu, 10 Sep 2026, Jerome Brunet wrote:
>
>> This patch series adds support for the X-Powers AXP318W PMIC, which is
>> used recently on new boards with Allwinner SoCs (the A733).
>
> Doesn't apply.  Please rebase onto v7.4-rc1 and submit a [RESEND].

No worries.

In this cycle, series based on -rc1 and devm_kzalloc() in them tend to
conflict in next. This series would be impacted too. I can rebase on -rc2
if you'd prefer to avoid this. Just tell which you prefer.

Cheers

>
> -- 
> Lee Jones

-- 
Jerome
