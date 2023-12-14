Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98815D48F
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 16:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifHCPqm9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3333074512bso495398f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 08:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702571338; x=1703176138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DocpNCRUemb4PzU5LBi65wCkuGjIl2naDWPnxKjn8u8=;
        b=ifHCPqm9SSLQ8n1HoP9FrG9rXEtxVjf+qNMllZiD4EHCFoDSoEc/4OCMX2fcglAR+g
         OoKWJ1+04zQ0GdTHdWQwkeyT2PHVVLopAZl7LqI0zBZHsCGAvflAyQXNZWJwnzVBKp0D
         T29BK/vBjbHJreaTmkJ3T1xDGmR1E+RKGdtF1mlmpQFWNn+2Nf1jem47ju2iv++vRTDX
         wnLX7mAKdR82fRgXfB6V93mzpqoc5A9nSUo3aHuquSpfLBfbYegTsXwM++fCg26LK13k
         Rjx5RbpSUZfOIm2MnHa5nz67fE4G8AIpSOcMwYvLBdNSlTPz4Jzm7oESln+0krybGR6D
         TBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571338; x=1703176138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DocpNCRUemb4PzU5LBi65wCkuGjIl2naDWPnxKjn8u8=;
        b=O7C3JnsWg72rBY1CdyRpXWR5VEZDw3lz9TEo4Q/6w40e028UpmVg8zdv7xyXGls28b
         Qltiwy2fN6yHrIHxoQyh2qD+2oiaZakNucllcTXcnF8v0Cy7RYwrXkF3dO9RkEO2Oiz9
         Y18LKkMGM7GY/wzGV5tQs2S4nysDDJuhlBAWedCLV/G+w/jFkKyFEdLL7uErsDnhU1TT
         tf/3q8g6VmF1aWo4zwFBmhIlP0z2mYqg6XqKOfi8GzSVch9T4siXrUnInrt/b9vgll4S
         U/LKvfY0oUP/QMZWcAdyGPlbyC0YcySvGtj3kD2Y6uzp5gwSS2s1lxwwGbV/6q65mTyh
         nv2g==
X-Gm-Message-State: AOJu0YwjpI3EQ7pEL21E+PCjPKJMYhQU9JZEQOX+9k4Lvg6IhWYZIckS
	0ODsm9cQHaCDf+Et/5EJvXo=
X-Google-Smtp-Source: AGHT+IFuYk/xTOppuMVaqKZ5dBLqDo/+tFTSYF7mI1tGF8Qq2G0Xo3r21ucFb9p+qFP7h0cUXPBbmg==
X-Received: by 2002:a05:600c:260c:b0:40b:5e56:7b4e with SMTP id h12-20020a05600c260c00b0040b5e567b4emr4851909wma.151.1702571337673;
        Thu, 14 Dec 2023 08:28:57 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id y12-20020a5d614c000000b0033643505580sm3327259wrt.92.2023.12.14.08.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:28:57 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 3/3] arm64: dts: allwinner: h618: add Transpeed 8K618-T TV box
Date: Thu, 14 Dec 2023 17:28:55 +0100
Message-ID: <5897240.MhkbZ0Pkbq@archlinux>
In-Reply-To: <20231214015312.17363-4-andre.przywara@arm.com>
References:
 <20231214015312.17363-1-andre.przywara@arm.com>
 <20231214015312.17363-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, December 14, 2023 2:53:12 AM CET Andre Przywara wrote:
> This is a Chinese TV box, probably very similar if not identical to
> various other cheap TV boxes with the same specs:
>       - Allwinner H618 SoC (4 * Arm Cortex-A53 cores, 1MB L2 cache)
>       - 2 or 4GiB DDR3L DRAM
>       - 32, 64, or 128 GiB eMMC flash
>       - AXP313a PMIC
>       - 100 Mbit/s Ethernet (using yet unsupported internal PHY)
>       - HDMI port
>       - 2 * USB 2.0 ports
>       - microSD card slot
>       - 3.5mm A/V port
>       - 7-segment display
>       - 5V barrel plug power supply
> 
> The PCB provides holes for soldering a UART header or cable, this is
> connected to the debug UART0. UART1 is used for the Bluetooth chip,
> although this isn't working yet.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


