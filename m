Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBB526563F
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Feb 2025 21:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739307953; cv=none; b=rQLPvL5VFvzd7UnX69VGwREjnT/hKpfHDUoSTlgOdHfOKBkaFgG14w7e46pQhqUt9dy4Ez4VrbDqCDi293SkKpMoKuYK7xfHl87M4O9yGHi+A3tOroiH1OcYLRwYElMD5xWuIjD+50yRzTav40ksHHguUOIIsQY+ex2G4ZW4cC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739307953; c=relaxed/simple;
	bh=F3M7/vdEchhlxBmMPU2kECuy/0/n1nc42/4z338w5lU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOSPwHMw+AWN7XJds6rn/oQXJrszNRJidB0DUwOy1/kVcVWS0vugVAaY84Xj1KPxGaoE8xrPY/eDAnDUxJPY4MDxJIt+d+I1Bkv3umRrVMkrxsNwvltC8FC6vtFoUr2kytK6G8SxdjxajvaT6NIDDfySGyeYqFzQBdX/m9O9cx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsWi25b4; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsWi25b4"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5de6e26db8eso5880481a12.2
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Feb 2025 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739307950; x=1739912750; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJXKo1rnLuFl+cPx44PrgMfGxNwkvUIiAKY29YBOxLs=;
        b=KsWi25b4o5rZGHOc+g+VRPCzaJQYgy6OmnYrYnTw+Dp3A2TomY/EzoyWrUVBZvoyto
         hSSVg7d/B4q5Rla4BSyODROmVywagrd7DALxAs7+fW3ZaOKAE7nghwYP/db/m5AqS1yi
         FM2u1KrFzC1XmIPA/iioBlmGP+kCPiqdiCrs/xn4sW6PUfWwynHAHgi3aj99cuy8kVtx
         nTMq2USiMRAZj51aixA+Iiq0kdgMDJoUuwypN0E702ZspW1KtBDxFnK4GUeOe5q0YDAb
         SRytviguEPyKk8jholQKg07qi1BCf5xuHhyYzm84oNrCGZ5g46LvLr/y9rQl43Fwvdso
         XLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739307950; x=1739912750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJXKo1rnLuFl+cPx44PrgMfGxNwkvUIiAKY29YBOxLs=;
        b=FH1v5zxzSzItwSEuGK95W81j+P1g0UxXva8AW8k2QPPFjktISVuWTkXFShB5Q/2BjN
         5geuDV67He8Y7J1PfS7V+MqTr85swihZJHRkjxWrOawlU0Izzw7iJI2pryoabPDXZFia
         8/GKqSdiu8hao2ZZUh6eceftsw7jQYa8TM0peQSM780mIwIF65CC6F/oqFk2nBXbDThF
         Hwuqq2rJ4534eAuaJ9gKlpmb5kpn3b+UwKmrz+FjEz8UAoH88fnXFMunRF++DkSAzKQO
         2r8o9f7Ktvg/7DnTaWBCno0pXei/NcpoDCv8YHwudwwfjtMrzTsyORyfv/JpM5pzjBAd
         8inQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtbbU+xU3ouSYHjc4F1uYHWxWNcZyWya4vSeWy40xEbfghapr9Mq6Nc1Wn2haCAzei4luFYAUO3sygrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFXzTsz9AMlHKDYYJPt/tMPMbGLecGbDqFfM4Q9dVQAhLIl9gF
	Z+6pA/NWgbAkrGATR+xEK4LFuf+Etve0/njgPz9PcLwpfso/u+w4
X-Gm-Gg: ASbGncty/nta0UhjKgi13zgITe580zC2h4ugCs6/1Bq2t49VL0t4nu8uIurg2fJJZr7
	CjpOds3PiorEWJc6tHGzNnd/NtbUF2OQWLNKGubdKISAh4wxLSTF/ZR4clGn2hUn/2TUX3Cq3Zh
	7sFG/tQGGLwbdRN3cucb6+viDICCChrhh2WU48DcHAr9onU79vGCpbjMMsCl/9YDCvwSgsrU7he
	dd+kHBAM+3FKQhaFPwK0XM/XDzdUFnE/PcqLO673+VJr+CqKHYAaqH3+DU9D/uenaq4tZpF+Qto
	/jtBXmnAslDyEUbbj5VB/XTxJNNU1LVjwJl1DFiPsk5WPArBoGUKptUlVX8wckJWu1aw
X-Google-Smtp-Source: AGHT+IE7TnL7jc5Iz6vTWhHrtrNij1s82deccxe7iwkiWATFIsU+z46kqSPjvpXY20QnIYGBevoc4Q==
X-Received: by 2002:a17:907:7251:b0:ab6:d7c5:124 with SMTP id a640c23a62f3a-ab7f347db92mr40005066b.43.1739307950174;
        Tue, 11 Feb 2025 13:05:50 -0800 (PST)
Received: from [192.168.1.23] (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bc28c58csm526166266b.135.2025.02.11.13.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 13:05:49 -0800 (PST)
Message-ID: <7251062a-c665-4f09-ba47-6e890e2911d6@gmail.com>
Date: Tue, 11 Feb 2025 22:05:49 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ASoC: sun4i-codec: add headphone dectection for
 Anbernic RG35XX devices
To: Ryan Walklin <ryan@testtoast.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20250125070458.13822-1-ryan@testtoast.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20250125070458.13822-1-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested on Allwinner H700 devices.

Tested-by: Philippe Simons <simons.philippe@gmail.com>

On 25/01/2025 08:00, Ryan Walklin wrote:
> Hi All,
>
> V2 of this patch adding support for headphone detection on the Anbernic RG35XX series. No functional changes on this revision, patches refactored to more clearly represent a single change per individual patch, remove vendor prefixing for the device tree binding, improve documentation of the DAPM widget changes and associated UCM, and small whitespace fixes.
>
> Original message below:
>
> This series adds the required device tree bindings to describe GPIOs for jack detection in the sun4i-codec driver, adds support for jack detection to the codec machine driver, and describes the hardware configuration in the RG35XX DTS. The existing speaker amplifier GPIO pin can then be used in concert with jack detection to enable userspace sound servers (via an ALSA UCM configuration) to disable the speaker route when headphones are connected.
>
> Thanks to Chris Morgan for his assistance putting this series together.
>
> Regards,
>
> Ryan
>
> Chris Morgan (4):
>    ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
>    ASoC: sun4i-codec: correct dapm widgets and controls for h616
>    ASoC: sun4i-codec: support hp-det-gpios property
>    arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX
>
> Ryan Walklin (1):
>    ASoC: sun4i-codec: change h616 card name
>
>   .../sound/allwinner,sun4i-a10-codec.yaml      |  6 ++
>   .../sun50i-h700-anbernic-rg35xx-2024.dts      |  5 +-
>   sound/soc/sunxi/sun4i-codec.c                 | 59 ++++++++++++++++++-
>   3 files changed, 67 insertions(+), 3 deletions(-)
>
