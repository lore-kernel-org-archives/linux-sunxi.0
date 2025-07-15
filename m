Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C45D292B58
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Jul 2025 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752588576; cv=none; b=EcOFUvN+n4ht9Fmz5h1NNcgOruEeXqrOUKvtdcjLtXsrcOBsUOn8fs58o1MriLKZD0TbLxQxP1bLzObb6B97sR662BVhbvu7Cgoxy5PzIIJcVyEa4asNl0pxjEMjdeErdjHT9ntGGUwvpwt96MT+gO3ozG4hkYO03LVXNuYxcOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752588576; c=relaxed/simple;
	bh=jJTBj4fac1bgJaznP0nVpLk5OWhiPHvmPDoBk2KvbXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzMB1BwttBZM2pwBcZ3fx24I9+iB7NLaerjP4HiXXRpApV6ILETeUQeh46tHnylQ6X8EL1hLBYPERBqdRDbqzHXLSnqGb/h2WmMFbK5bWG2jd17Umxob5bSMzQqT5JKOzWvck8ed8oSgYuSoawcqO7EqlCVEhWJ4hEotGcnrmwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHPbq+Ly; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHPbq+Ly"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8275f110c6so4049074276.2
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Jul 2025 07:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752588573; x=1753193373; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rdR+LRqRBkJBUvCkbRrJJULDxmBDkmzUM6UrN84Yku0=;
        b=wHPbq+Ly+qXGeBTjpqJD3vUQCB6P42CIwwkIFOflj0PHSSvUikT8qpDjwbXIWCt6e3
         D1sSNzGY+dqiJgQl3XwwuFZdns5VmDPKhoOg0EqJpbmVXARxDJA6pK1m9a05Eckq6I4g
         cN1gbcYjB/pxNZ5ndinFzT8YvIPUs7JIMhVGjFrXOIQNlvko+1aQDObUCzmB3geHiypD
         BC/U8HTAgpTL8Wdk+bktJryzp0Dbt6bunkJg6IgK2omvLvS7AgcoO67nwpaO7Z9eWt9B
         QD5U3DTiG6ZDbNy/pIbYfd6QtguSsgpSPD4blq3HdFPk1g3EtI1/TDLdifMaWY5y9ttd
         y+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752588573; x=1753193373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdR+LRqRBkJBUvCkbRrJJULDxmBDkmzUM6UrN84Yku0=;
        b=ADeqzgyWw3+784Vz2VJbNZz3l0+myIrPHNXfsS9z3xvqc+G5IVr8lcljwJNEH1LZhh
         1F6qCxb8aqSoilRdA1s9e50SlUtLcdvWR0Q3ZxmuGFajjdW+1BIjBH6l2Z7HYw8Y7h1o
         Z//HNMkjgg1ORjMlBB4TWM67ll7WH+4GlmP0MT8GwOOH99In+PQFgwBMG0QfePYT2Cet
         8BOJhM7sZCQTSkYvTlO/7vXVubPGfbAzLMwq6c2gjDmrB6NC4scsbHqDcW7wCSQWegMg
         M+fkk+FL4uij4r8KxXefjP6nksnKX1gv1IVNsA2ThDuXPFDVUBdAPaaYyGuK1CyEEeNC
         nHaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxMZA+E0ra7J4hFt4GI/FgKLPf5umRY1p0xwSm7SWcg/o5tpn9/ZoM3iv6CiYsBZHj1w3b+oSRt2qJqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzUGuoAUgYBaE+WCZRy08cXS8Vkge+t04QkKcGjbe+rqStgAWb
	ozFd9tDGLMuIKHlsbch4ZXDNfO5MscgJPEVfcKRLHHzwP1vUk65ouonGD7C7mKD33+htIo6UQKi
	8xXV7UBEagQUPtt/Fszk+CUyu/i2tuWqwcHp4G7PtCQ==
X-Gm-Gg: ASbGncuJymCVnQmN0cnkrIHphN4Id9vRxHUiJ+U1q8TNspixo6DWcZ2Yq02FkAnjq/U
	GO1xtUHFPMQtobF2a+qgRuyJ8hSlgE448cKfLp6vXQJ4rAMW1s+NHsQa2Vf+tcmAXVO4ncsBfvk
	a71OZ22cIkdOM5zvJpo2Y79c+v3gBYPAv+T5Cw28GuwMeP+oAhsnNZNXN5YkiwOUUMr0Z4CfMnd
	fE1LEwo
X-Google-Smtp-Source: AGHT+IFr5aZe129SXty/aUauZ98iCrC5028PDfP3/dwd83DOGHiwFr2/EEOsdifr9IoyiESxKl68x3MmFGTyJODgVvM=
X-Received: by 2002:a05:690c:b82:b0:712:c295:d010 with SMTP id
 00721157ae682-717d5e2848bmr255785147b3.33.1752588573210; Tue, 15 Jul 2025
 07:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250712074021.805953-1-wens@kernel.org>
In-Reply-To: <20250712074021.805953-1-wens@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Jul 2025 16:08:57 +0200
X-Gm-Features: Ac12FXzjyKVG9YpXDr4ujfp7DHXXwLEZE6WjntfBOMpvZOZeuC_qP0opUlbqcZM
Message-ID: <CAPDyKFoSe3sch1ooP7e-TOiB91y=_Q=-FaSooc2ROoMwfEsP+g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] allwinner: a523: Add power controllers
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 12 Jul 2025 at 09:40, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> Hi folks,
>
> This is v3 of my A523 power controllers series.
>
> Changes since v2:
> - pck600 driver:
>   - Fixed whitespace issue
>   - Added explanation about possible PCK-600 lineage and document
>     references to driver
>   - Changed Kconfig option to tristate
>   - Rewrote Kconfig option help text to make it clear that the driver
>     is required for certain peripherals to work
>   - Made it depend on ARCH_SUNXI or COMPILE_TEST
>   - Made it enabled by default for ARCH_SUNXI
>   - Renamed PPU_PWSR_PWR_STATUS to PPU_PWR_STATUS, and added a comment
>     to note the macro is shared between two registers
> - New patch changing sun20i-ppu driver to tristate, and enable by
>   default for ARCH_SUNXI
> - Fixed pck-600 header path in dtsi file
> - Link to v2:
>   https://lore.kernel.org/all/20250709155343.3765227-1-wens@kernel.org/
>
> Changes since v1:
> - Re-order compatible string entries
> - Fix name of header file to match compatible string
> - Link to v1:
>   https://lore.kernel.org/all/20250627152918.2606728-1-wens@kernel.org/
>
> This series adds the power controllers found in the Allwinner A523
> family of SoCs. There are two power controllers. One is the same type
> as those found in the D1 SoC, just with a different number of valid
> power domains. The second is (I assume) a unit based on ARM's PCK-600
> power controller. Some of the registers and values match up, but there
> are extra registers for delay controls in the PCK-600's reserved
> register range.
>
> Patch 1 adds new compatible string entries for both of these
> controllers.
>
> Patch 2 adds support for the A523 PPU to the existing D1 PPU driver.
>
> Patch 3 adds a new driver of the PCK-600 unit in the A523 SoC.
>
> Patch 4 aligns Kconfig dependencies and default for SUN20I_PPU with the
> new PCK-600 driver.
>
> Patch 5 adds device nodes for both of these controllers.
>
>
> Please have a look. The power controllers are critical for enabling more
> peripherals, such as display output, camera input, video codecs, the NPU,
> and a second DWMAC-compatible ethernet interface.
>
>
> Thanks
> ChenYu
>
>
> Chen-Yu Tsai (5):
>   dt-bindings: power: Add A523 PPU and PCK600 power controllers
>   pmdomain: sunxi: sun20i-ppu: add A523 support
>   pmdomain: sunxi: add driver for Allwinner A523's PCK-600 power
>     controller
>   pmdomain: sunxi: sun20i-ppu: change to tristate and enable for
>     ARCH_SUNXI
>   arm64: dts: allwinner: a523: Add power controller device nodes
>
>  .../power/allwinner,sun20i-d1-ppu.yaml        |   4 +-
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 ++
>  drivers/pmdomain/sunxi/Kconfig                |  19 +-
>  drivers/pmdomain/sunxi/Makefile               |   1 +
>  drivers/pmdomain/sunxi/sun20i-ppu.c           |  17 ++
>  drivers/pmdomain/sunxi/sun55i-pck600.c        | 234 ++++++++++++++++++
>  .../power/allwinner,sun55i-a523-pck-600.h     |  15 ++
>  .../power/allwinner,sun55i-a523-ppu.h         |  12 +
>  8 files changed, 316 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/pmdomain/sunxi/sun55i-pck600.c
>  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck-600.h
>  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h
>
> --
> 2.39.5
>

Patch 1->4 applied for next (the dt patch is also available on the
immutable dt branch), thanks!

Kind regards
Uffe
