Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB6D252911
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Mar 2025 18:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741200855; cv=none; b=Jzb9Jm+6eQ7sCAxK0GBDFBpUfWkBWng0TVIT64E8nZgJnL2QbNzXKSj35KASyrpbkfFLE5xN/A/EXSV7+tDsrouFsPG80zYUwlMZJJstYqhsYrnKiCp5kupW110zMotGsLsQT/o5fnqOmjFIQF3/m7LyHZoULa+OhCNnXcCn/1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741200855; c=relaxed/simple;
	bh=1IKgsVfO8AFngCF533cDPpX+Sfrno9eJbAhfD0kB+ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ITBP5s8I0x1We7kQDAzWyWXYs/rbvrrlMtm2GDWq7Fq7rvO3FT1ScJaBo8sN4UYT1bFUPjcaQYvhzSlpJg+Y+9IFN26Vrp3c26N4iBtt/MBqG/w3uK/wSJ+mCkRJTa8vxmecRPZ277tX2rU5uMaX/33nYiZ9TF49TezjTvE0Nrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l74zpVfa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l74zpVfa"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390e3b3d3bcso8365031f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Mar 2025 10:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741200852; x=1741805652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTEPlivf57KNf0u9yF+nL78ShRAOQbbl1KlRhOM3FSk=;
        b=l74zpVfaav7iPLw4kHF0sr6yFm5F7GLfWKfmMgFPU7lC5nD5m9Huzls4DIWrdM8/eC
         OuhIdEboz0CYCXJ/+NIGJVq+3xVAf04CmiaNtKPkp9dUkVbcA2902RzFwPEQp6KqqECu
         98Z0vHGZZV7qdPi17fISNIg0W9/JEXBZ0Bid9GKthPW6YmroBi1V1y3opud12yC+cl11
         igHMC0pwuTDthhisDmMbtXicZRF19n1xah6dbhprM2/Oh9tBcbnyF2UEtDV3aDsndXbv
         4gth12KlGW+zxYK7YvfhQMBTvSTMi0P/iFOtR5iNgFonFZb2IhEy8xPQQPGec75EGt+l
         dF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741200852; x=1741805652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTEPlivf57KNf0u9yF+nL78ShRAOQbbl1KlRhOM3FSk=;
        b=WVj9JBV3QDo468lnrt6m+5gFzdfRZ6iLGrRDGzeFTC/knEWrq/XL94OvzAYBE+YWTb
         wMLDypS7Jme1r4qrJowMEkXNvzHxpNngzKad3t4MWrE8q/6hiVM1uXlMkkTMmHGasMVa
         FZEg7MJLvQnhY14vQqpFQU3NYhUeL8/GalQ6sKAKcSvfKSIpjxGlipvVeD99MGTZUn34
         auDK7BpXkZvRPATy+eow2ejq/mkq+THATLRXmkXEq0I+QyzCfyfEoOS6ZyODVMIIca1+
         cBbbD2gSlTEe3OMXXC9Ur4j2nmDzlgt46Henk51dpAVgYbw00GFxRKIOX47vTLRRYVA3
         bY1w==
X-Forwarded-Encrypted: i=1; AJvYcCUAAbpLXn+VSjB8F0weg2J0POl3yPtD9nUehRtYYGItDYE5CHtZv4hjQlhk/2U9ytFCDr7U9kxDN93u0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKpcXt+C2gXDr8z6g9jfn1FlbCSnVDkn1o3xhTXeZPaVSff6lN
	R7vHl95bXr4eHsqSigOz5DW/YsbO8PPUA9ZL2VMXl8gEDAbw0Lyq
X-Gm-Gg: ASbGncsnUYtWKC8qZarfKY377td9GlaNNkO7vrV7LpuLmq/tqE2Kpt0BnDv6AE+lEVh
	2KbaBABsmWnbxIcsGqVCaY3StgPChFpGCvyVkTvJueXzbVBOe8sTkd2pNnv5U/KjEmcjxs8R0bA
	A2ahSsywELTdjcfydOZbrUJPo2JIrgaP8kl2gTSFKoEVHijLMsnu0w3QOrP9c+BXV7UhFXj5TIf
	vRvjx8wHj82UU5yTSscvikNUvYtBQThcG+bleXU3EutMwUgHem1M424S+fZhr2KUC0dxuh8ByPT
	P592+uSEYJXYm0Yk4SNu+glyaqwSWSk2La3McU/vBgZ/dChOY7mW44Tq9oP8kcaGzAW/Y1zb02b
	F6jYK84oK0y2RE5jvINP5
X-Google-Smtp-Source: AGHT+IFq7ByBMzrdcbNey9rPMwFoH0XXCXvSqwidIYHLYAKpglo0B8dEBkmtmZjPTAu9SsK5oJOomg==
X-Received: by 2002:a05:6000:1f82:b0:390:f75e:f815 with SMTP id ffacd0b85a97d-3911f7543a6mr4658220f8f.23.1741200851871;
        Wed, 05 Mar 2025 10:54:11 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47965ddsm22312099f8f.18.2025.03.05.10.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:54:11 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 15/15] arm64: dts: allwinner: h616: add YuzukiHD Chameleon
 support
Date: Wed, 05 Mar 2025 19:54:10 +0100
Message-ID: <2227598.Icojqenx9y@jernej-laptop>
In-Reply-To: <20250304222309.29385-16-andre.przywara@arm.com>
References:
 <20250304222309.29385-1-andre.przywara@arm.com>
 <20250304222309.29385-16-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 4. marec 2025 ob 23:23:09 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The Chameleon board is an OpenHardware devboard made by YuzukiTsuru.
> The form factor resembles the Raspberry Pi Model A boards, though it
> differs significantly in its features:
>=20
>   - Allwinner H618 SoC (4 * Arm Cortex-A53 cores, 1MB L2 cache, 1.4 GHz)
>   - between 512MiB and 2GiB DDR3 DRAM
>   - up to 128 GiB eMMC flash
>   - AXP313a PMIC
>   - 100 Mbit/s Ethernet pins on a header
>   - XR829 WIFI+Bluetooth chip
>   - 4 * USB 2.0 USB-C ports
>   - microSD card slot
>   - 3.5mm A/V port
>=20
> Add the devicetree describing the board's peripherals and their
> connections.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


