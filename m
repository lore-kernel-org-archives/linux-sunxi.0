Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489521662FA
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Oct 2024 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728153897; cv=none; b=F/22ICanY4PEBJNUWD2bcpA0d0Ogenwv5xQxQx21jP2x1AiPT4hma6ROZuXAU3UArLM3PIHl8A8PssqjU6ZG4TIfjtor4VolROxlkreW7GsfW56jovVrWjuKUngAMCnoy488sNc/sx+kxhgABGnUvBnyZ4sLAtiBXBUN/xISFQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728153897; c=relaxed/simple;
	bh=6RLhYMi5+WUMBMxyQrcB3l0ygGZ73nNgwKYQMVuya1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhGgsyuKK1HtbklZFuM2JFhjcLqT+NM7Cm9J38DrcbX4iViNASuufcgEB0Trt1B0jGYAlA+Z1BsrR+HuuGxaOjSCheGEnNr3AQpbvWqeLXDh6rfSPzazgujkDyLU7QsLB8MR3X0Jqn7qQDomUFAbN2TxrhfBRtq+54XVQk5mLoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bkpwy5+j; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bkpwy5+j"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so24002435e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Oct 2024 11:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728153895; x=1728758695; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRlB78UEFCV0w7cLJIZE7YuESd3mDDwJ36kzdZq9V+U=;
        b=Bkpwy5+jENgGuIcyrnmyFg278D2H5cRh7lgm78BpsAiw+95QKicH7WR3NYqk8meNWu
         JSSvNia5+9LG7hH/xeT5AD0qYX8TVoTNdYGBNCkJb+6iMcVz9UJexF6xRNPsJ8Yo//2F
         6v6ES7qhCDzX2g95oN/6sF8SZxdkfMmvbDIltDq/2Nd9h/Wmm0sHKjShwlshfG9nfnqV
         S3KBqxxzB62ssyExkOQctRo74UzG6yBUtifGCMRSZb6XhQbNztw+9Vi6k5SYgxzpYowe
         6+1wxAEqzGV2PaJ/5G11j6RFLB17eIH9oobHB6r4TLwXcSEvSpPUURq/qW4X/aDKXqoE
         FjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728153895; x=1728758695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRlB78UEFCV0w7cLJIZE7YuESd3mDDwJ36kzdZq9V+U=;
        b=suKrRxBCH6Fv9JAwPNmGE/nOZqFtnHAO8fQoxKgKvdSRMBuOMa5OPK8IsB8SygI2Hu
         Nw0GWVTvMjLJHfA/xg/lmLx00iGAP9Lxl1t+bDvxGDCmmp0aUpNO+tBndh0u99D0x21F
         ARBhOHSHit5r13VsRqgN8bPE0tm5goSgVWWBxuxNvJMScW1sHOUsifidbgqV1mPTGFzw
         t4vCT0t9v8x0+fcQW6ZK2kAjgbbBHtp+4TWSh7cZNdXYwWv03ACo3TgkTf3wuWZARMv3
         IQCHt+pmT8Aa/26S7U5ltzOwjLfIYcetUdeqMl8hV1nxlw4KzPjcQBSk1hU/aB2a8gQT
         OZKg==
X-Forwarded-Encrypted: i=1; AJvYcCU/quhJCd0KVYKnwLiQ3bFhvt2/oPzl5hnpb+eEUHf9veE0CxZZ8fYHodLAH4qw14VFC1LGS8Pg4T+eWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMocXXOMc4bhnhNq1db11aRiZ4DurB0ooDaOn1x1PAHoMIN/Ic
	nLY3n8xQDm/iTBm33TOW3XIJkC24MgywI+12BF86xHYwwolyJ+PG
X-Google-Smtp-Source: AGHT+IGS2SkoNgUtCC33Hu7GEybMTTgetpmYXGracfsFtDR9HtiXXW4uv8UCigJiKGvdOgxL1AhiBA==
X-Received: by 2002:a05:600c:4ed1:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-42f85aee76amr42496935e9.25.1728153894453;
        Sat, 05 Oct 2024 11:44:54 -0700 (PDT)
Received: from [192.168.1.18] (102.242-182-91.adsl-dyn.isp.belgacom.be. [91.182.242.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d169203f4sm2230523f8f.53.2024.10.05.11.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 11:44:54 -0700 (PDT)
Message-ID: <bc6673fe-367e-4488-b936-1bce5552f543@gmail.com>
Date: Sat, 5 Oct 2024 20:44:53 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ASoC: add Allwinner H616 audio codec support
To: Ryan Walklin <ryan@testtoast.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20240929100750.860329-1-ryan@testtoast.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20240929100750.860329-1-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

tested on 6.12-rc1 with RG35XX-H

Tested-by: Philippe Simons <simons.philippe@gmail.com>

On 29/09/2024 12:06, Ryan Walklin wrote:
> Hi,
>
> The Allwinner H616 has a playback-only audio codec, with a single stereo or
> differential-mono line output.
>
> This patch adds support for the H616 (and H618/H700/T507) SoC. Based on the
> Allwinner kernel SDK driver, and tested on the H700.
>
> Regards,
>
> Ryan
>
> Marcus Cooper (2):
>    ASoC: sun4i-codec: Add support for different DAC FIFOC addresses to
>      quirks
>    ASoC: sun4i-codec: Add playback only flag to quirks
>
> Ryan Walklin (4):
>    clk: sunxi-ng: h616: Add sigma-delta modulation settings for audio PLL
>    dt-bindings: allwinner: add H616 sun4i audio codec binding
>    ASoC: sun4i-codec: support allwinner H616 codec
>    arm64: dts: allwinner: h616: Add audio codec node
>
>   .../sound/allwinner,sun4i-a10-codec.yaml      |  55 +++-
>   .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  15 +
>   drivers/clk/sunxi-ng/ccu-sun50i-h616.c        |  36 +--
>   sound/soc/sunxi/sun4i-codec.c                 | 297 +++++++++++++++---
>   4 files changed, 337 insertions(+), 66 deletions(-)
>
