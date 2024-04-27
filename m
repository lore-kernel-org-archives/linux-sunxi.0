Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AAD4085C
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Apr 2024 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714213222; cv=none; b=INydirAwOQUNezXE5h2RYXs3GnxWb/jzC0uODFKdN8mFKsxOSDO6gzpJi+Ci9lolp8YzGtVekm9gCS3oyHe7GCGcaO3kwsNb/Vuxem+8t6o8XaeOiKhQNauWn3TYUh9tpNVpfvVuicQsEWSljCIKx/Yv6NwDZL/ZYVSMMuyjCjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714213222; c=relaxed/simple;
	bh=/Ov3HxWoUq28WJk09V7518F+JgaY60ThUTskN5tFB+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dUg85BWVg2COLv07CvUsLzesmaybYZd+wZQG8F8IwTYCUyWbJ/W78XuvBuN1RhNhown7aZmDB5Qo5cNuyZgfJPViTH/oWkqsQbyqR6yax7IIch8USAWMY5utbC74iLS8UnxsYcNln11bp8mVIsdq4gpTrrt+5FIvGDYWJaOcBI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9ouvsi6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9ouvsi6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-346b96f1483so1553829f8f.1
        for <linux-sunxi@lists.linux.dev>; Sat, 27 Apr 2024 03:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714213219; x=1714818019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHJd5Ub+zNiNQnkR29UpgThMCfp9nBVMMGF9iCNGC/g=;
        b=Y9ouvsi6bnl7WRehYO+e+cXB/dDCdxSLG96g2vYBqfNF4l4Poqdf46Nbg574dZWOcs
         LFG0k5A/MoJbOOLHhvqV5I+jN+uffKd0cgAgm1qPe3DP4zklJ6ypzHQ6feIYqh7oTRnc
         /TBNLAtBXhvlPdBC4D0i8Eb1PPBXk0lKo/pJXrtQu+J2t09sYkOV+mf2E7EmPQ4g/LHO
         z/YsBRz0L2kbpgOp6411F9Urxul2qrHzIlw7OswocWOq+j8YJuE+sCMn5QaytogeJC3o
         NcpvXZfDjr35uARU5eBwIPucAk8VoPlFFm7PV2F9fvsACaR79EtHlvuj4oe8qlxhVlwA
         YI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714213219; x=1714818019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHJd5Ub+zNiNQnkR29UpgThMCfp9nBVMMGF9iCNGC/g=;
        b=PrA6Hf79iSQU3mHxBmQwdACtfephGZnd4E5h7d8oYXCcGFsOIBp47TQLQAM8aZ48um
         Q+lv6QOm0RJY6xDVYbElrSpwfk+SrRwl4IobeThvf8wfVqPUmsDyFFtcr3BtFgAZsNTG
         QD+3xrr4QSovhfzkqGpFe7UL8aMcQQsQpixqhXHCz9X9E+p4/uetPmtfXl+WvFJtQESq
         b5XjLejhBPaxcVvKF4KQ4kILDf0Gy1iAwOHdSEuywf7wn7kwbmWex7Cuga426hfaO5XR
         vmKufq6ZCoZBz9NR5vy3EfTpQ8bduPC2vUR4LacnHv/Inbi5jo5ZANyB6M88Wvhff1l5
         X41g==
X-Forwarded-Encrypted: i=1; AJvYcCXjLlOjdoGeDz+AsXtABFvk6dSzG3Qf671PeoRPaWEYCWX1tUnva7KRwdahRHYwoXDtgeseuR5wz5hLfTe5PbkAVBtX07eLvUHfQMI=
X-Gm-Message-State: AOJu0YwwYL8u0a8mpxsXTDEYklr42dA4oACvNNhrdrD26qP/M8tpULKY
	USDk93zPnuWKfwBSgLkGw8vj+1antFnbeczHBoCt1zlC6+qxKmHR
X-Google-Smtp-Source: AGHT+IFL9pmwago60lsjtM31ujCqiGalMdnj/9GkMZCkdytk+HPgG5MXpKDQddtrnSdu/GUykTlYRw==
X-Received: by 2002:a05:6000:18af:b0:34c:765:7657 with SMTP id b15-20020a05600018af00b0034c07657657mr4831986wri.24.1714213218824;
        Sat, 27 Apr 2024 03:20:18 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id g4-20020adff3c4000000b00343c1cd5aedsm24475445wrp.52.2024.04.27.03.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 03:20:18 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macromorgan@hotmail.com>, Ryan Walklin <ryan@testtoast.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v5 2/4] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Date: Sat, 27 Apr 2024 12:20:17 +0200
Message-ID: <1856456.atdPhlSkOF@jernej-laptop>
In-Reply-To: <20240426213505.69273-10-ryan@testtoast.com>
References:
 <20240426213505.69273-5-ryan@testtoast.com>
 <20240426213505.69273-10-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne petek, 26. april 2024 ob 23:35:10 GMT +2 je Ryan Walklin napisal(a):
> The base model RG35XX (2024) is a handheld gaming device based on an
> Allwinner H700 chip.
> 
> The H700 is a H616 variant (4x ARM Cortex-A53 cores @ 1.5Ghz with Mali G31
> GPU) which exposes RGB LCD and NMI pins.
> 
> Device features:
> - Allwinner H700 @ 1.5GHz
> - 1GB LPDDR4 DRAM
> - X-Powers AXP717 PMIC
> - 3.5" 640x480 RGB LCD
> - Two microSD slots
> - Mini-HDMI out
> - GPIO keypad
> - 3.5mm headphone jack
> - USB-C charging port
> 
> Enabled in this DTS:
> - AXP717 PMIC with RSB serial interface, regulators and NMI interrupt
>   controller
> - Power LED (charge LED on device controlled directly by PMIC)
> - Serial UART (accessible from headers on the board)
> - MMC slots (SD2 appears to have a GPIO-switched regulator for 1.8v
>   low-voltage signalling, this is not yet modeled so a fixed-regulator and
>   3.3v and 1.8v rails from the PMIC are used. A switched regulator will be
>   confirmed and posted in a follow-up patch)
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


