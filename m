Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AFF763F6
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Feb 2024 13:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708522984; cv=none; b=Na9KQyK/timJvYmdCUKUvRFH5FLcAa3+26D4LxIKRBsbNdgNNdcsygNU2Ap+EEYBa3MuZWIwCpyggRAB5WDaDS9PyhKd8MtGDMPSxpf6x3XzbK4co/G2q4ek++JjpwqfUWWuNt3n9bRtQbqkGSm6XGsZL+QwHXprZ5RfyCKw2Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708522984; c=relaxed/simple;
	bh=KtKHMB+AnFiN2hMpH33PDEt8M2iVNeq3woqfEVtP35k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4zaigXsbq4p4/5O/h14KMaZ7Coj+Vsi5+IPLyDP3ZoEjbMWl7NdAizH+WXoXaZ9IUWi50YHRMNQ7JoIxSHgSWpuONQXpJXMR3mQqugw1EKZrd5qXpKDXAjjgsSENPZae8Pzn5gTx3Yq/MReAaAXMqoP6n3m602QB0G//JVSphI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nUbxfqA1; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nUbxfqA1"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512bc0e8ce1so3710776e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Feb 2024 05:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708522980; x=1709127780; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VyIS/2L8+m5oM2lTsyXu4+jS9x+VJzqAj+pH6cNaLbM=;
        b=nUbxfqA1TXY5TCVdR2KLt73shQ8AX4K8S+nxKAgaH/Mm+vQIVniYhsyPTrxxGDefty
         9bW7R0ycBJA0buqFWuMeOnkMpyQefYmUoWgntSoG8D78pohKlmb1PCq93DJNU39WZVRY
         9LmTxz7cz7Dc+RG+Nys3V0YNzZnx8cXPvWYP48B6HIzD7W030TuTk3/R4gfs1dW26SCF
         EEXXJAvn9XKvlOUgIZD+BUqV+1Thp5X/0yLGOV0wh+yshyIwqjOR2SXvL0WD8HqO3jrS
         aBJ9X125YsQGEz6CMqa/kr+SIy3wSTka+tOsANBJOKK7tV6cU6kgSYnonpnpx/qLBiYl
         fvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522980; x=1709127780;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VyIS/2L8+m5oM2lTsyXu4+jS9x+VJzqAj+pH6cNaLbM=;
        b=xIs7uraK69zRkIQRDSWq5zAxaaE2NAWRl/UeocLpPMQBHiLsQAFHkuvXZMRDW/xlr9
         B+tzM8b05naHsjOQLuHftcOEAbGneCeUOdySpNDwgWQNrc0L/+CFTnpK7r2ubikyFPfy
         zoC7Kuxu3+SyTalI5DTDU1GsJUzU44Sqrz+3amGc6aDJ+RuZZOR6HvIXEeIPPxlXtIOv
         50zw2oKrQGQVWIyQCJ4b0VLM/Sq+h2CZmEjszMBMSgGMO5yPH1o2SDEYk9uj7aJmj2/Z
         PKmxtYNQgtAl6qQ0069862rGgGKyacgbnYDHtcvfBtKjqPfDhQTdk8OcIIuQw9WcnUJj
         PJwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4qia7OCgp+yfbZpu+qtqmnWLAMEdVhPvB35wueUjv2x+1fWZ2Jfl/5hV0bphywbGJYbFuCvuSsQCqrS4eD6JL/gVguJr9zE6dW+k=
X-Gm-Message-State: AOJu0Yy7QqBBhCqqEBtjbLo32RGlFKzw8bh9ZZaAfPUPbxWKcitzMa5c
	hKtugUWlbvtbQu7ZcGH1ashTh6sc7xzdf2V1v4z08w+btIjv9ufABqWIkcdv/sM=
X-Google-Smtp-Source: AGHT+IHOWBy5vI8L+McUQWzkr4WjG9Pwa2JqIcYkMXVa8hcxQTu10e+H1VsUu3eKDfb+vZFAR5oB7w==
X-Received: by 2002:a05:6512:124f:b0:512:8d8f:db7a with SMTP id fb15-20020a056512124f00b005128d8fdb7amr14181112lfb.65.1708522980437;
        Wed, 21 Feb 2024 05:43:00 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id m12-20020a5d4a0c000000b0033b60bad2fcsm16875973wrq.113.2024.02.21.05.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 05:42:59 -0800 (PST)
Message-ID: <13c957a9-6021-46a7-9243-b3658c26a333@linaro.org>
Date: Wed, 21 Feb 2024 14:42:58 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] add support for H616 thermal system
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 Maksim Kiselev <bigunclemax@gmail.com>, Bob McChesney
 <bob@electricworry.net>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240219153639.179814-1-andre.przywara@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240219153639.179814-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/02/2024 16:36, Andre Przywara wrote:
> Hi,
> 
> this is v5 of this series originally by Martin, only some cosmetic
> changes this time, for instance  mentioning experiments with the SRAM
> controller registers to confirm that it's not an SRAM region which fixes
> the temperature reporting issue.
> See the Changelog below for more details.
> ==================
> 
> This series introduces support for the thermal sensors in the Allwinner
> H616 SoCs, which includes its siblings H618 and T507. The actual
> temperature reading turns out to be very similar to the H6 SoC, just
> with support for two more sensors. One nasty complication is caused
> by reports about temperatures above 200C, which are related to the
> firmware being run (because the vendor U-Boot contains a hack avoiding
> this problem). Some investigation and digging in BSP code later
> we identified that bit 16 in register 0x3000000 (SYS_CFG) needs to be
> cleared for the raw temperature register values to contain reasonable
> values.
> To achieve this, patch 1/7 exports this very register from the already
> existing SRAM/syscon device. Patch 5/7 then adds code to the thermal
> driver to find that device via a new DT property, and query its regmap
> to clear bit 16 in there.
> Patch 4/7 reworks the existing H6 calibration function to become
> compatible with the H616, many thanks to Maksim for figuring this out.
> This makes the actual enablement patch 6/7 very easy.
> 
> The rest of the patches are straightforward and build on Martin's
> original work, with some simplifications, resulting in more code sharing.
> 
> Please have a look!

Thanks for the detailed explanation.

I'm willing to pick the patches 1-6 and let the last one to go through 
the allwinner tree.

However I need the blessing from the different designed maintainers for 
the thermal driver and from the sunxi_sram

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

