Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B6B2E62A
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Feb 2024 11:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707479127; cv=none; b=BHxLALFBAVD/JorWKBItcjsQ3uSlBLww1IqD++yVZOvKEfJ1R7N54e58ddMZag5J9ksMDN2Z70gVuGyCE6cvWu++xkDtmnsNC/xFdL7cHDRq4aNGH0Xe74HphQMi4iHQZGvxVChNbp3jHPKSeLZhGyrdTyaUBFornOp/HmAMX/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707479127; c=relaxed/simple;
	bh=kpUX+5Fp0emM5GhamAYigk31OhEZhOSBXFWlaXEM8mA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D7y8oc4slq3epTsa/SF8RNNYGjOv0iuXo4UgJZoPOGB7hf6ApW/YTt4UP2gl+HWQtx9QsvwReQ4JU0jChC45ZJ6frUrBrG+KtWnQZ7Oq79l4jzG4NlCZ80O2UwZAVX7Sgh+tvCyC03i0Loglk2xPqKUv90HfhNx7kfKgpvtbQcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5GQdbEn; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5GQdbEn"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d09b21a8bbso9863921fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Feb 2024 03:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707479124; x=1708083924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ed61mmNefo4NF61Anc4jK9I9WqvYzH3tKYcqREzO6Y=;
        b=g5GQdbEnviUBGtjJf2+8XvBSULx6r7MsnTcuR2wImDerAN8EERn3YG9T0+WHpDkXmI
         /nXI17/t5TU7wsXvMqcO8Iocyw6wwY1nVGhiNWTruvfpAp9zcJ8CWHo+ZqYj/kSKbNyE
         lxIGxd/4sUFhxnnRAudBUmVEio9Z2fFOmzrX5mMIKGP+/sBbKpAV8DAt9+lkvKuoKI3z
         4G/NiCW1NCMUueuQYOPShAif9aSEXpp0u/ky8jFu1b3tYrWPe7u15IFYOWOnZoy1tIBF
         +lUAM72G9SwiU5rs1PjGnqeDXC3nd0eAiYLCL1QRNrV31S/pm8lTPGRnsQelhtMzVEiO
         D+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707479124; x=1708083924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ed61mmNefo4NF61Anc4jK9I9WqvYzH3tKYcqREzO6Y=;
        b=l78gpNOHM1xDEVhFxmnPTnwervinHZV0UZECMWrNKsp2JYqNNxFi9DeC0ZHcfG8FWp
         q/S5LI8c9nsjKi2f69A/TW7Hz1nlbk/YX9YzK9+lxcJKZgW2b08WoEaSjknTdz4scLxE
         1+Uf/JLyr3xEOvB2Ng4XnnIM8QvbmbOykfq/p+m5z+AlKVV0E+HeKKLsoPS1IykLqFBk
         Bg1f2ANTFzNOCEwxJeJJG9/0+DLok2ZxfmjDXiDZHJ64GFPvGt0TJzEk9DL2xx+9Auvl
         NF/LTaDCbTlISpO4Rq3kXx20mWz2vU6c3c6Jjofcn6b79efnQPytC5l3+DYHEdhlngJD
         MbaA==
X-Gm-Message-State: AOJu0Yx2BVJyeSBpshLHU1jPyVBcBFYTNV4246l+5iWNy11wdaExh+5x
	DpipdepMmU194Ao06LxP2QpbVpYmLGDJ0z9iRkZJq4Bw6kuP1y0E
X-Google-Smtp-Source: AGHT+IHPuiI9yUhj38xnAq24ekaAemX5dHuo9kRydZ/nMn329vwW8svhY3XBIzPKSYXM85Su+qSddg==
X-Received: by 2002:a2e:b018:0:b0:2d0:cd59:f142 with SMTP id y24-20020a2eb018000000b002d0cd59f142mr1230330ljk.40.1707479123460;
        Fri, 09 Feb 2024 03:45:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURXIpYNJeqV2VUSdTl7HppEggOsY6x/7JIOWfxm7yqQP5oG01RbjWKXp/GdE6OHYIwbMjEQEgjMTNG8MHy5kYWStkAe07ad+9MbENFlXqtOWhW3o3t1aO3K97PeUa2bqRb6RiRGP6V8IpEAo7elzIQ9lKeZGWxBZB42kFiEbkQIdxLFdLkHuNoBi8IhCkJb8IbbmGNoMGDEnfn3cSDjdiTGaWnASzyt0FOYrXl1efSvbHr7gk0ldUMBxTEJ+NRqvcE/2udhkLiqUJzDdf+Rkw6O367Ve6DajyIpOqoas+MSu1KcfLHNA==
Received: from jernej-laptop.localnet (APN-123-244-98-gprs.simobil.net. [46.123.244.98])
        by smtp.gmail.com with ESMTPSA id d17-20020a2e3611000000b002d07aa888d3sm225057lja.23.2024.02.09.03.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 03:45:23 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH v2 3/3] arm64: dts: allwinner: Add Jide Remix Mini PC support
Date: Fri, 09 Feb 2024 12:45:20 +0100
Message-ID: <5752892.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20240209114018.3580370-4-andre.przywara@arm.com>
References:
 <20240209114018.3580370-1-andre.przywara@arm.com>
 <20240209114018.3580370-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. februar 2024 ob 12:40:18 CET je Andre Przywara napisal(a):
> The Remix Mini PC is a "mini computer" using the Allwinner H64 SoC,
> which appears to be just a relabelled A64. It was launched in 2015 by
> the now defunct company Jide, and shipped with a desktop optimised
> version of Android. It features
> 	- Allwinner H64 Soc (4 * Arm Cortex-A53 cores)
> 	- 1 or 2 GB DRAM
> 	- 8 or 16 GB eMMC flash
> 	- 100 MBit Ethernet port (using an X-Powers AC200 PHY)
> 	- RTL8723BS WiFi & Bluetooth chip
> 	- HDMI port
> 	- two USB 2.0 ports
> 	- 3.5mm AV port
> 	- microSD card slot
> 
> The devicetree covers most peripherals, though there is no agreed
> binding for the PHY chip yet, so this is left out.
> The eMMC did not work with the MMC DDR speed mode, so this mode property
> is omitted.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


