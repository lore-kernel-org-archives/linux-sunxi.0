Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237B72DC777
	for <linux-sunxi@lists.linux.dev>; Thu, 11 Sep 2025 18:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757616331; cv=none; b=qsRMhydTU9uhV1sXfE0hnJv6bk2+/7dCWMY7m5R/71DnFJg1JavABr6lmMz5yFIR+Dd0sXw73E5kjzrEsiKczJAGBpf3VmA4jGcM6GSlUl+/wh9iCQY1KlAaxmijkgTQq6ofKY8fg5FiuEO68f/VlpMOQpBI9ue3jEXOg18QH5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757616331; c=relaxed/simple;
	bh=PU72Key0SVmvWQm9PWpGLknK5t1ThOCAfthGViLodCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D57HAnNhbxzmz1d1OK452DQRssBCd+MzI3pig9t05cNmwTJuNPJHUTO0/TfDtVqQzdZtUhCPtBOzQ6xCzZjXX6uqQMSrhstvUjdaR/moVrTpd7XpqIyNQh1tMN/xzx7zlmj3kiOLBc7mkYx8jKIOrglHx3/05WPgTnn5y6n8kOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKWVt8q+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKWVt8q+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dfb6cadf3so9994055e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Sep 2025 11:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616328; x=1758221128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgoU6ODnHJHjlxJ7O2reyqhOrHLfmkxgDzAUfsAuBJc=;
        b=bKWVt8q+8aKWHWw/SRKLCkH0V46P0adKH7Nbtf0UtpJyfeHFQQVSAVxFviMjT1sDeY
         Wuqb6aLeLGgBikADQ7EF9PDlUUECDlPWMKoVnLXuGhcwl8C+FkN12PL+hd3AC+p8KUmT
         wiXhYoGkFUlvQNTRmvv3PwdtGpftJb63P7/+Gms6QSr4UYJJySAGvoLOEdVEJayYeKu1
         eOADkNCH//4LKDZqUlhBtQJwUd5uc4Tars7G48Kf+DGcxgQnmQsBK958Csij2oMqNrdw
         7LKcd5jxiVyEcddKBiy0m57pR/W9dWfs4Ms8SzwffbAd5Zv7mELF7hRe6wJiGfQRVNnp
         vbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616328; x=1758221128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgoU6ODnHJHjlxJ7O2reyqhOrHLfmkxgDzAUfsAuBJc=;
        b=n80czLDeZNuJkbyaFiG2m9jgimofoVatLjbdeuoPTTnVAonQA07Eq1k41KmipWFQ9e
         w6X/Gez/DDse9vkjGRe+dsvGf3iE/BqBVQ7gLxqbdKS2o7hE04c7fVGJweWkZlG6o57K
         4c7XrFa7h9TZ62YYtARErCNXkJIExm7T0EzXILoTe0fhgFkWgXaZw2IAiUpKTsbIa3pJ
         pvH0pQi1LmuFQ4o7efeLrB4SMf/6vgoO6KO4C1pTgKTckCTkB+uA/W/plgGgxADfFV7+
         lEbIcDA3s1Z19lMLtSu66WfpdQuNwYYWRMFqALSkTUhP8fYg2a+taFxK96tFDxNdZicv
         mrEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfxmJ8hdoy8K9DHs/GxzDZw9ykztyRjqndYHDyzN9XuG6swcYT+FUbzLOdppDyU9LUObBZSRinsI6UAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlwSiBs6fPqM8UFqHlKv4O34v09zQAPYOXVcR894REnqR2hHsf
	kL75KkNPRRpNDbtZUMheizzOChNIhgcCZtH9V6eNgSxSmvX4rbvjUsgz4qWb0Q==
X-Gm-Gg: ASbGncuklTWPp2MGp7Dng4G+PcH+pFXW3CytIUAOT7uqh1iQCzy7XDMDxUrKWhVhp9w
	2qYc3T4Kvu7ERJAthgQi+DD1NSehBVY6LdU4APS36rsbbQRPMxehM3Kr0kltEc9EyffYYKE9kT0
	bgVAK9WvKe9EGStfvh1lssy9uqR4a8Ygv5k9xyvuKqOJQfzZewKHPZhun3o8aJ/dREpSYi08PzP
	9GXrqm/JyBxSMrLYxO43poNKWYmw85Z2kSRrR1bNQlcqm6Hk56jyNwuBohpuLcE+IN4OkE7Yr1B
	O8cuNfu/hM8NW7hyyIPnkSincZlt7JmiXj0RsLhLM0OLHnBhTGIkaYrfAAJXr0g942iv2pASc9A
	fC+2piWaZX5TG8cdFvIW1pE2wHGyvkRjG9SOfKoLMyNG6npT4L8gcYOticvrYye6HS3EJ8v1J6r
	jLzC4QAwzeWRluJEjMPz4=
X-Google-Smtp-Source: AGHT+IF35WXiz7qtt5E7pbWdiKdOZLXpqRy4oaXj/fJmaGWMagVTnOpk2kyKlLObTat0jClq3/mWxg==
X-Received: by 2002:a05:600c:34d4:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45f211d008dmr7116755e9.16.1757616328099;
        Thu, 11 Sep 2025 11:45:28 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01575fadsm36130825e9.6.2025.09.11.11.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:45:27 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 5/7] clk: sunxi-ng: add support for the A523/T527 MCU CCU
Date: Thu, 11 Sep 2025 20:45:26 +0200
Message-ID: <5037780.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250911174710.3149589-6-wens@kernel.org>
References:
 <20250911174710.3149589-1-wens@kernel.org>
 <20250911174710.3149589-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 11. september 2025 ob 19:47:08 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523/T527 SoCs have a new MCU PRCM, which has more clocks and reset
> controls for the RISC-V MCU and other peripherals. There is a second
> audio PLL, but no bus clock dividers. The BSP driver uses the 24MHz main
> oscillator as the parent for all the bus clocks. But the diagram
> suggests busses from the other PRCM are used in this block as well.
>=20
> Add a driver to support this part. Unlike the BSP driver, the SoC's main
> MBUS clock is chosen as the parent for the MCU MBUS clock, and the
> latter then serves as the parent of the MCU DMA controller's MBUS clock.
> The bus gate clocks also use their respective bus clocks as parents
> according to the system bus tree diagram. In cases where a block does
> not appear in that diagram, an educated guess is made.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes since v1:
> - Added comment for "fixed" dividers in audio PLL clock
> - Corrected variable names for audio PLL divider clocks
> - Added comment for the reversed order of some of the DSP clock's
>   parents when compared to the manual
> - Added comments for clocks and resets only found in the BSP driver
> - Corrected register offset for i2s3-asrc and bus-mcu-pwm0 clocks
> - Made "r-ahb" and new "r-apb0" external bus clocks the parents of the
>   bus gate clocks, with comments if guessed which one applies
> - Moved .num_clks to after the list of clocks, making it obvious that
>   the value needs to be added if more clocks are added to the list

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


