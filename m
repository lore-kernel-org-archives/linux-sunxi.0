Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A1A253B6E
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Mar 2025 18:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741200774; cv=none; b=lmJRw3KPR6rZCwy6+6sUUqV+ket1aNmNa2MvHztcMrbivOscS4MdM1b/u7dQdNvT8dpIQifSQEWylT09mQFmtgIIJHzpAbaTOnv+glPY03eYUNoe30tPti5DIsttjIZd+tm3CGurQk8C4QdVc8sJ3HtysAX0ttTGfpQFS38n7mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741200774; c=relaxed/simple;
	bh=axHI+Ss0adljEBF8slC3n/3koLG2QkpC1C+hFdPLV/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A80AS7P9ddRiyrofpuAjZeGm0Fh+gOG3wOp0SEmQPy2zw0s5DNXsF9NOvB9sqABKAjal+04UsxcpSPTZj2elNmmNzTofYMBOtS0H5KUQan1GMo88gndJiaFc6XOVjxnii9yRwIfIBJX47mdYTKbi9DccMmlKzposd7jiyrEDEwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoBf+Cv4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoBf+Cv4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso15078955e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Mar 2025 10:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741200771; x=1741805571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCk8RqcIdhP8uF9ql+DEh+iIumM5FUYrLBf68Hu79HM=;
        b=ZoBf+Cv43ahv0ySJJtVSm/vg7tBAIlJTUHQ9slA09Rl1440eyhKJniK96UrVi3illC
         Lp7Zkpz7QkqLa1lSDtEBlfX/RnpymnXSKwFpkbtFV+TKeB/SPpihFm+IwmcX+bC6csJl
         lVOJCSMZp3Dsdv5drD3ZZ1zs50tyXJJWNOHyAjQ3O1WwpEDC1+nrZ6VCWcbubIFsSGz8
         pIY2xm59q5Vj6k9MpyC1ZKDmmtkYy4F15mtrhQshxXYDVp2TS7izyQ2qe2fuPV1abas1
         GavJQTnfK1RNG2Uggeua95l7LKBJPEw80fA1B/e+pSDlsQGudb+cRLcIOml6nG2aKpyF
         ZNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741200771; x=1741805571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCk8RqcIdhP8uF9ql+DEh+iIumM5FUYrLBf68Hu79HM=;
        b=iBE4ojuoQYi5c5EzBQ5F/gE8FWXNf27xx1PSus7VzFyIn/X7Jlly1QFC0Gmb9WKjI7
         kDO+mN1ThekOu47KDjNhk5od6Wc5hiX0EtQmfZ2PXG01tCtQ81N6TWOtdZd1GdxhclL+
         CixjFzRvSxys+U8hFXPIawGoMGR/7nyJYzKceB/7D6vXbSUnOsdICXUQabN5iLtjGzlF
         v/ceKBU7s1zTqthfNmdJnFSRTzIEPfejHnJ0lSnW4dN5Wvciims5tfxMsaOrnh1Mp5qT
         RRikPBcbemiCMHKKwdHay7DPU1O+0LccgBO2Cwo3W9bYH3Cq5lSuq/iY+UmN4e0cvOLG
         bHhA==
X-Forwarded-Encrypted: i=1; AJvYcCXQgb9HvBnOdIEQd2Kai+YXNAixLNA59KJVwkzfVVszQqtD03d+jQhJxBXxSeiEGuq6SAHbCKyIfyqt0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy+23r192BVRDpFDJ7Lgt5BeuZIvgE5xe6H9JZ1NFK+ZMjKYht
	lObmDqMer/0tq77Vl3Q8feeg7FHtJexdMacK1g0b+5D/0/zMMdyILlK4i+TZ
X-Gm-Gg: ASbGncviqDHY4H4DdovhHzjnVjjc2RqPOIvdC9GWHFeINQfPtHTWVYwTRfwmEFtU7zI
	Ank0mO42RRDkIvI2GLrS2b2ioaf2pKT/qaEoPU/JXJjyRGDrj5n3rvO7uRgjQBWFJcqW2fJq2pB
	i24I0Jv27B0+m542pY8EwotCWJOVP1AjxcQ5eqe1UMI52AzMD6v0dweL3wv9Mg/KvyqF0cn8jD/
	f4ou2+FQmWvHPYBv2oUfQ0//vrrQn5Unx6L12OQsREgNkYoFa/87V6fkFVDKYF4tLXFUXPT/AZO
	VmW9iohbbnYaQTLfqwRFIAXr/IhISixrbOk+8Peo8Dgm2xidPPf2TXUC8dQMOWPqq/EEXUV+A9H
	hS3cXgH7zOnpiQcet8+V9
X-Google-Smtp-Source: AGHT+IGuBKbnktunZBzzNzT71sHvzIIvBdO54em+1pB/n3NbwE4YkF3yitXy4CaCKxQdjWZt3gt1lg==
X-Received: by 2002:a05:6000:144c:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-3911f726343mr3775397f8f.9.1741200771124;
        Wed, 05 Mar 2025 10:52:51 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796084sm22209780f8f.19.2025.03.05.10.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:52:50 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 13/15] arm64: dts: allwinner: a523: add Radxa A5E support
Date: Wed, 05 Mar 2025 19:52:49 +0100
Message-ID: <1888259.atdPhlSkOF@jernej-laptop>
In-Reply-To: <20250304222309.29385-14-andre.przywara@arm.com>
References:
 <20250304222309.29385-1-andre.przywara@arm.com>
 <20250304222309.29385-14-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 4. marec 2025 ob 23:23:07 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The Radxa A5E is a development board using the Allwinner A527 SoC, which
> is using the same die as the A523 SoC, just exposing the pins of more
> peripherals (like HDMI or the 2nd MAC). The board features:
>=20
>   - Allwinner A527/T527 SoC: 8 ARM Cortex-A55 cores, Mali-G57 MC1 GPU
>   - 1GiB/2GiB/4GiB LPDDR4 DRAM
>   - AXP717 + AXP323 PMICs
>   - Raspberry-Pi-2 compatible 40pin GPIO header
>   - 1 USB 2.0 type C port (OTG), also power supply
>   - 1 USB 3.0 type A host port (multiplexed with M.2 slot)
>   - 1 M.2 M-key 2230 slot, with 1 PCIe2.1 lane connected (multiplexed
>     with USB 3.0 port)
>   - MicroSD slot
>   - optional eMMC, 8, 16 or 32GB available
>   - optional on-board 16MiB bootable SPI NOR flash
>   - two 1Gbps Ethernet ports (via MAXIO MAE0621A PHYs)
>   - PoE header for optional supply circuit on one Ethernet port
>   - WiFi 802.11 a/b/g/n/ac/ax (LB-Link BL-M8800DS2 module using AIC8800)
>   - HDMI port
>   - camera and LCD connectors
>   - power supply via USB-C connector (but no PD) or GPIO header pins
>=20
> This .dts describes the devices as far as we support them at the moment.
> The PMIC rails have been assigned as per the schematics.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


