Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A7A59174
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 20:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707682437; cv=none; b=lzoX+/mjLNGhgCg8+AbkbNo4W5Q0syu6GN3uaKxefGoSAiQkEWSTeAbevvQrAhu08eWZJmfvPYkJiSaqWs4QVx4jC5grP5t8S2quvG+mvLiNzFhvr6M/npgctkT17OVq3wPwK0+mLOJJQ8CyLRmrw6cIoBSIhLZTvcxwqsuaLkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707682437; c=relaxed/simple;
	bh=jCDk55chpDYqiV7+4uPPaV+cuFeCV6w0nCvNvsOiVkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GpsQA4LU3x8IwykfToOcA2EQ7maKl4G/fn25/9Nc2U0UG3h1mHn6GCM9t+zbUQ4e91vACBl+CpEMKOtmePx9GydseoneN5/9bwJOlUOreBPRIJzSYivb90S0YkTEb1EdU9RJ6atznTHVHYUDIgWWcSk9jnGaZo38Jm2tvweJRMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTk4WeC/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTk4WeC/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-410deab9c56so561545e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 12:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707682434; x=1708287234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w32dNhtd3NtIT2zmlS3WgU5K/G6k0bKSolZGpc22edM=;
        b=TTk4WeC/iB1jMvNLxAGI5gJQJKiitXZAAT3LYPICTxxAlnf5HfDy2piunKV7TlMlwt
         2bTSUl4pc6mzIpXFXjYCfdRLAl/KshaXt8V8b5gQpSN5ylgYd3XacyrOx3ZSNv3S2Z+F
         f3t2Uyp5U4JTvGBPv/H6vERKgYDWv2plch+zDgwhXMx+zR9psDpLlginPTiT34FvAPfD
         NtcYMhcY5A/AV2nRoZe5Bjt4/plNMa+fLNuJ34Kwj5pwa+I9er6xwxlt8TfpppeC/8Ni
         QGF0LJjqPeBx4PlvBIPAovBxAgE5vbtdt2iqCj52tuhzZzP3i1+ET6ENRz+yGZS5SBWm
         xz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707682434; x=1708287234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w32dNhtd3NtIT2zmlS3WgU5K/G6k0bKSolZGpc22edM=;
        b=cmLs63HK/rPOKRug2puXeHKUpzb6e12hwZQouZ1nx2hLxM6KcN3PMiqQiRRsN7bGgM
         5ldTxRC8kAD1ZghvOoHp8GUPVolwG1XPHnAVuS8PjLKOU1l1BEcVkBAAxNlAa+mk8lQA
         7D7wNhiAaCzG1H/Xc8K4DCX/8QA5FLEE081Taqc54BduZJd1NT10jd/DNXj1DrqNSwQI
         y4NxdMGAkllS+PdAoQYN6Cm5VZpauyrmTHjzZjY/xmHWZMqNIxTwUJGhscD5fsCZTNMb
         88g31kUgHpUJFuvNqBk/RX5FLjYepkxVxGs4x0hRqLeaL1+gtWZnaZcNMCR8PVb9FbzE
         PZiw==
X-Gm-Message-State: AOJu0YxK7fzzvwwCl0W8sqZ7ltspU01oEtEbGfsCz4Qkg9nRQIu03va5
	kmV9AEt6zdqVYKreETpc28aQzCmhDbqz7+/eQhNjhLHmYbAKGQV2
X-Google-Smtp-Source: AGHT+IG+/uIrtTlFuqQ/qoyCBxtC0ud5P2xf4BzWfl8rExe8RMldFxj8Bqhan5m1ZwcL2G/i3KkCiw==
X-Received: by 2002:a5d:47ab:0:b0:33b:523f:2aa7 with SMTP id 11-20020a5d47ab000000b0033b523f2aa7mr4624592wrb.45.1707682433618;
        Sun, 11 Feb 2024 12:13:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMImudmcOfRwy2DiBRbHsc4PW0bG4uZ1wwhLJ7iAIpreWhbHL+NbrA2JFWrstb3HVSukF+xFULf63ohZ3OjIXQ8AIHEL8Qf7XcmRGg/pgjOIjgekEK3b1yRj5IjkoeiOIUTVjobcncITTYrw+1kGC+hyj+FwlRO4LNjchb/GPgKMBAS4xLrH0arF1wmbZtOIKNtQJoY9SFLQ4CS3d1WmbkotA+BTxG+CPIHVhA0ON9NJ10iJ3jAuuefM2vwN9vl3fLPq1abK0vkERUmlEB8Fk55cA8IC3SaT3RiTApses/yuvTL+n2CA==
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id a15-20020adffacf000000b0033b39cba5e4sm4919901wrs.116.2024.02.11.12.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 12:13:53 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] arm64: dts: allwinner: Add Remix Mini PC support
Date: Sun, 11 Feb 2024 21:13:52 +0100
Message-ID: <3283025.44csPzL39Z@jernej-laptop>
In-Reply-To: <20240209114018.3580370-1-andre.przywara@arm.com>
References: <20240209114018.3580370-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. februar 2024 ob 12:40:15 CET je Andre Przywara napisal(a):
> Hi,
> 
> a small update, addressing the review comments and adding tags. See
> below for a changelog.
> 
> ==========================================
> These are the DT support patches for the Jide Remix Mini PC, a now
> somewhat dated Mini-PC, once shipped with some kind of desktop Android OS.
> It sports an Allwinner H64 SoC, which is basically the same as the
> venerable A64.
> To make it stick out of the crowd, the SoC has "secure boot" enabled,
> which just means it needs a different (signed) boot code package, already
> supported by mainline U-Boot. Fortunately there is no public key burned
> into the SoC, so any key can be used: the U-Boot build system will just
> make one up.
> Apart from Ethernet (blocked by the AC200 PHY) everything should work,
> including WiFi and Bluetooth.
> 
> Please have a look!

Applied, thanks!

Best regards,
Jernej

> 
> Changelog v1 .. v2:
> - Update copyright year
> - Remove not-working MMC DDR speed mode
> - Add HS-400 speed mode property (used by the BSP kernel)
> - Remove superfluous pinctrl-names property
> 
> Andre Przywara (3):
>   dt-bindings: vendor-prefixes: add Jide
>   dt-bindings: arm: sunxi: document Remix Mini PC name
>   arm64: dts: allwinner: Add Jide Remix Mini PC support
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   6 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../allwinner/sun50i-h64-remix-mini-pc.dts    | 356 ++++++++++++++++++
>  4 files changed, 365 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
> 
> 




