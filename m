Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7970B1448C7
	for <linux-sunxi@lists.linux.dev>; Sat,  1 Feb 2025 11:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738408127; cv=none; b=dSP2BgU5oR8SOrzlO5h3NZDDvDDG7W9S0KLBgLjofRtbE/j07FwNBBKPfKq9JeFJfkM9JCh7FETVSdWERTFbUTyJAugzYa9RCMw1qEbovkksrTucQv3T9FmG5sWKV1jxhtX7o/5xDsgI8iyIcxoxllM/cnrJp1lEmuHVWN3P2TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738408127; c=relaxed/simple;
	bh=lV2M1tUa4SWHGmKYz293Rfyic2j7Zxh3fh/VhcUO9mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1dVG/eBxjy1iLUJ4hkvSHNvqZhs89GTxeU9nisJ+lPRQlq/vEz3lJyw+OQ6WTRioif/j5zqOFNISWEHaAQcvT2ECO7J552cXB1UJLusq+6bIgteWHMs8St82dlCfpmwurwljCdbIXWKp6uK2MXHrSqNv7CFmZRi958BgE9fUkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30615661f98so30529151fa.2
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Feb 2025 03:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738408122; x=1739012922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJdFRpY9/VgrRdJOyKoz6hilS+1z3UkKtKPtOxUttZo=;
        b=e2kp9xV+ZgushQ7JfRfgNX0b2rxC/p0qt03+m3PjMmJqBoWYjwTmfJackMw++Lm0Y9
         5pFehKvB75VKYXx/V51DWhpBpkxxGDa5ehRvd6DZT2xnRWr8S0jmDmtCD05x9/yjITsU
         Yl0OiCj5RXKrr8t/QBjc3u0APiZG+mAXFMLg86QTZVfoQeinqczj6VPVSqdQqU9DUBzj
         WGPoPSlyb7eX5VV1d9Al7TLCE/T4G3E+0TaqRdJGoNk4q/FXn/nahJ6kC8Ln4j567U4E
         n4JkJbkAps+/gWDKGfnup7uAY3RDAULk1sninLGlhj6hCs+X09H1UfWMbw84yIJDKiER
         YAYg==
X-Gm-Message-State: AOJu0Yw1X5qiRbHMOhoISMZKJ7SLs6d1TSlMQ0lJnmQWLeZ5CQXBVpmP
	zppHSOpxrSjPPZrCBTQTmls1CxNjlFmC0tuifXruliXM3GJNyHgaDTFv410b
X-Gm-Gg: ASbGncvravPTZpdYHLwpzZs7phfru9n/GXtPsrRTB6JWMVeAmbneUmiPFjnf/7Feqku
	haqLLp+Usj7LnhItFT5/H9uHPqHDmok4Nv2qK4VonsE6DHh0eD99l/oyhWusNccxD/RNvzsTCN0
	rPElVk5ks1qob+d1OzWOk/YE6zzi+D18jaQsSt8LqflrGAZz3wlaCNj+/cnujiNlnARHlfvBJAK
	yU25dFaunLsZCPOdhTJKsL/h+T5tJIr0wS0aGGaEjKzuXm8D/5YORKATFF5i/IaimiTc0jWaZOU
	iCrhlYe/7O6roRvqGdi0JzDRehKsGDpk2DY1MU9v8hzTLycm
X-Google-Smtp-Source: AGHT+IHzHxgIBgJZHSwKsKL/SWePbuwhK9qgPrMYCWd0LUPAZvv5otD1+fI++QP2rn0cluUe31sCTg==
X-Received: by 2002:a05:651c:2113:b0:302:17e7:e176 with SMTP id 38308e7fff4ca-307968b8ea6mr46427421fa.5.1738408121710;
        Sat, 01 Feb 2025 03:08:41 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a309fad2sm8219431fa.59.2025.02.01.03.08.41
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 03:08:41 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30615661f98so30528921fa.2
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Feb 2025 03:08:41 -0800 (PST)
X-Received: by 2002:a05:651c:50e:b0:305:d86a:4f01 with SMTP id
 38308e7fff4ca-3079696b37fmr54303631fa.31.1738408121144; Sat, 01 Feb 2025
 03:08:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250131231455.153447-1-macroalpha82@gmail.com>
In-Reply-To: <20250131231455.153447-1-macroalpha82@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 1 Feb 2025 19:08:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v67YFBoTaDb2_M9w5zVgDrc0dQofg1B=tOrO23zjUQncEQ@mail.gmail.com>
X-Gm-Features: AWEUYZmt5WAKw7Sa62l6O-dikObFL-05KwH7Ig2AS6totJP4XZ-9LOk_VWKpsrQ
Message-ID: <CAGb2v67YFBoTaDb2_M9w5zVgDrc0dQofg1B=tOrO23zjUQncEQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix RG35XX Battery Charging Issues
To: Chris Morgan <macroalpha82@gmail.com>, lee@kernel.org
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, samuel@sholland.org, jernej.skrabec@gmail.com, 
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, sre@kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 7:17=E2=80=AFAM Chris Morgan <macroalpha82@gmail.com=
> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> The Anbernic RG35XX devices sometimes fail to charge when the register
> for the battery temperature sensor is set to the incorrect value either
> by user error or an incorrectly programmed efuse. Allow users to
> hard-code if a temperature sensor is not present (which is the case for
> all Anbernic RGxx series devices) to prevent this issue from causing
> problems. Additionally, a bug was identified with the handling of PMU
> faults while this fix was being tested.
>
> Chris Morgan (5):
>   power: supply: axp20x_battery: Fix fault handling for AXP717
>   dt-bindings: power: supply: axp20x-battery: Add x-powers,no-thermistor
>   mfd: axp20x: AXP717: Add AXP717_TS_PIN_CFG to writeable regs

>   power: supply: axp20x_battery: Update temp sensor for AXP717 from
>     device tree

Lee, FYI this power supply patch has a compile time dependency on the
mfd patch, due to the new register offset macro.

Chris, in the future, if you are aware of build time dependencies,
please mention them in the cover letter. That would help maintainers
sort out how to land things.


Thanks
ChenYu


>   arm64: dts: allwinner: rg35xx: Add no-thermistor property for battery
>
>  .../x-powers,axp20x-battery-power-supply.yaml | 22 ++++++--
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      |  1 +
>  drivers/mfd/axp20x.c                          |  2 +-
>  drivers/power/supply/axp20x_battery.c         | 50 +++++++++++++------
>  include/linux/mfd/axp20x.h                    |  1 +
>  5 files changed, 56 insertions(+), 20 deletions(-)
>
> --
> 2.43.0
>
