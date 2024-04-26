Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C3F1E869
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 16:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714148186; cv=none; b=iDHIAxHscjt/VYAJ5oDHnBxH3qQ0JEvZD6XEMeNcd2M6BdPl6M2228w07UIUsEqNHH6E+kWnrPDcKQoZnCCHzvxfPmnC6P19IDYFVfSOxDvzePOoDmntlx2ZWyRXKtHBFtlltHCnq8qG7Y3bNqcCqLLevNfiF7+UNzvuC8rP/S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714148186; c=relaxed/simple;
	bh=YlgomcczVIMyRSOYOyR831S+Vzj64QGTEr2HnBDhr0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bv6wQEU9XxIq6naY8rU4Pgdd3hSyU+0ULdMi+LHtyxulOhWabYVjBNbqE6rkIHc+a96J9PiYEFSvUT6+zjAzC+m9Xq1U9QEZJxmjLwBl2yLawxJG+8XzZSnT1ZohZzZ4VSf3SVewffSmOc0iGDP2XJ6HvyH8W+beDJdashziJI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6y+QtpX; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6y+QtpX"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d8a2cbe1baso32547771fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 09:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714148183; x=1714752983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGfOy4DaO5gS8kNNeFIezxzCvy3uX2BGixV57btaRag=;
        b=h6y+QtpXP9KOFjD5K3c9HUxLll4aSBY0T8JVUFXmU5SnRNJE/sbi/gOO/w6Oy5Gmiu
         JP5zhz9EsE1m9SeqzilmzuVC86cfQ+n+KptiNKdpcgMsPSvF3U2DJoXSxDYubuKUm5qO
         uesP9gtlLEpk92rC4JcmRBZwY/8l3AEkMm6khkL1ZZqy3eP1Y8OBOjgoNLaUm6piwwvK
         lxLXdbbPA0KhKB2PNbbLT28NrgBGEglkB1brY9L+3ALHXNg86QacjN96rzVaGL1eE5oH
         F+jNkK7Cg+WLfs0T3IYrteixMiEnwZsJCYxY94rIB00CG6js3E4cySpVQtEaOFVE7VG8
         Q5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714148183; x=1714752983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGfOy4DaO5gS8kNNeFIezxzCvy3uX2BGixV57btaRag=;
        b=NUuHPyfwLsdQcVnsZH8N8t0pjd6QXDfmEWZRJkx1gQQj3xIYZNViHcAalSFUtLGoIV
         dh8xMxB9UURMjAA0YLBbbguuYNsW4rQHcm1GNURqdKbfJoOiyg9lxU2r/2z5t1vk6y4O
         9pC6eHteTeVgQzxMCXBEO3CQngT4JqJQB/fZnrhamTxp0Nhwd5i9RR7IJbpW+yYgQLBJ
         lr69J+VaLbpKF/PC03bAWUXJLTNJZzromcV58nZrf270+LoojUKoZY8JkRHZO6vBa6BG
         rHnz62M1MUQgRfmdT6lI5ixAJ7nrXEPocE96jkxbAp8AeuU/egdPB97qDYuoqzrVopEn
         wTng==
X-Forwarded-Encrypted: i=1; AJvYcCVwjUJG48FWofVzXolTO8XfqdFEp5FX4ESdkKn5YL/ByvJgsXVr982KT9BCsDmXfkayxOGSa1wee3S1o7DNhVoCfUovvE2UTKYm2AM=
X-Gm-Message-State: AOJu0Yw7rkssxEvUSgKwTfbJJ4VUkM3t1Iw4c6j5ouN51ym4Cto+5EGY
	18XHnrq04mEpnq7Ls4CJa7F+YchKlbPbNDkIVlzE6ZqTBCIz4zUE
X-Google-Smtp-Source: AGHT+IEaY/5PF1O3GKLX2UijPlZzPUU2Lk/ybUXnsz5xFF4VbiGCQZUO64eVlapQZuD4NBGT+Oskyg==
X-Received: by 2002:a05:651c:10ab:b0:2d9:fde0:86e2 with SMTP id k11-20020a05651c10ab00b002d9fde086e2mr2468610ljn.15.1714148182574;
        Fri, 26 Apr 2024 09:16:22 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c444d00b0041a3f700ccesm19542085wmn.40.2024.04.26.09.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 09:16:22 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macromorgan@hotmail.com>, Ryan Walklin <ryan@testtoast.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Ryan Walklin <ryan@testtoast.com>
Subject:
 Re: [PATCH v4 0/4] arm64: dts: allwinner: Add Anbernic RG35XX (Plus/H/2024)
 support
Date: Fri, 26 Apr 2024 18:16:21 +0200
Message-ID: <3743928.MHq7AAxBmi@jernej-laptop>
In-Reply-To: <20240426095141.13602-2-ryan@testtoast.com>
References: <20240426095141.13602-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne petek, 26. april 2024 ob 11:51:38 GMT +2 je Ryan Walklin napisal(a):
> Further revised patchset based on review with many more corrections to regulators and formatting. Thanks to all reviewers.
> Changelog inline, original cover below.
> 
> --
> 
> The Anbernic RG35XX is a family of handheld gaming devices. There are 4 variants, of which 3 using the Allwinner H700 chip are covered by this patchset. The fourth (released first and named simply RG35XX) uses an Actions Semiconductor ATM7039s which is a 32-bit Cortex-A9 chip with no mainline support and is not covered.
> 
> Common features (RG35XX-2024):
> - Allwinner H700 @ 1.5GHz (H616 variant exposing RGB LCD and NMI pins, with 4x Cortex-A53 Cores and a Mali G31 GPU)
> - 1 GB LPDDR4 DRAM
> - AXP717 PMIC (patches accepted in mfd-next [1])
> - 3.5" 640x480 RGB LCD
> - Mini-HDMI, 3.5mm audio jack, mono speaker, two microSD slots and USB-C (USB 2.0) for power.
> 
> RG35XX-Plus adds:
> - RTL8821CS SDIO Wifi/BT chip
> 
> RG35XX-H (Horizontal form-factor) adds:
> - RTL8821CS SDIO Wifi/BT chip
> - Two analog thumbsticks
> - Second USB-C port
> - Stereo speaker
> 
> Patch 1 adds the DT bindings for the board names, Patch 2 adds the -2024 device as a common base, Patch 3 adds Wifi/BT support for the -Plus (and -H), and Patch 3 adds the second USB and thumbsticks for the -H. The -H is a strict superset of the -Plus, which is in turn a strict superset of the -2024, so this translates quite neatly.
> 
> LCD, HDMI, audio, and GPU support are not yet ready and relying on out-of-tree patches currently, so will be added once these drivers are mainlined.
> 
> Ryan

If all remarks are addressed till tomorrow, it might make this cycle.

Best regards,
Jernej

> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> [1]: https://kernel.googlesource.com/pub/scm/linux/kernel/git/lee/mfd/+/d2ac3df75c3a995064cfac0171e082a30d8c4c66
> 
> Ryan Walklin (4):
>   dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming
>     device variants
>   arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
>   arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
>   arm64: dts: allwinner: h700: Add RG35XX-H DTS
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |  15 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   3 +
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 347 ++++++++++++++++++
>  .../sun50i-h700-anbernic-rg35xx-h.dts         |  37 ++
>  .../sun50i-h700-anbernic-rg35xx-plus.dts      |  53 +++
>  5 files changed, 455 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> 
> 




