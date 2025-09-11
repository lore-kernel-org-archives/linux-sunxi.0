Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E27A2DC79E
	for <linux-sunxi@lists.linux.dev>; Thu, 11 Sep 2025 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757616407; cv=none; b=Q3dQfAqL8u1STuKHv3QhaumMPpakcLiwkRI2XqGZgAxnCC8ABInRqO886g17C70mAZN70FJ3ZoIyl0VU47T+qrc5H1HFno4bpdaoL3pzhhRkejnhPwLsVleqKTx6GikWq3DtVwJ9Cc9CQ8WPRW1DASJueOAwsfrTR66Im3fe9tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757616407; c=relaxed/simple;
	bh=vHuwkKXYwD/cpOelPHVBXDenAhVWLgTP21RN1N3bYw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CAV/BJAqpDeis7evi+icOOs+RWeAfDEWgCbg9KpkmIXB4WJYqYXyL+5c+1Qiy7c4ViWAflDDJorI9M/KfLONJ3Om7wXHxbRZt1q610lTk8PZR/P9hMyxc7Rdt0sVFi5W8oIZo32f/prkjOTzevP9wEWeoCqOyd3L4p8VwGc+diQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtwbQCqz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtwbQCqz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45df09c7128so8615745e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Sep 2025 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616404; x=1758221204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3Kk5PCcvdUwK+/fsu2vdafHJIiHRXspA2ECOuACp4w=;
        b=MtwbQCqzGUE+C/+5JM+Fjhtvg74jt4/pBwUEjPbCBGTa/Hfc050AhCFWRM9CSbzib0
         gevw77aUsBqtE3YQhy8EIE3c24sm68AiGTj6QX1nvZX5rrqUKKHGG5evVDIvmw076xKZ
         JQHqwbrdur3LzxqSi3jhquCJznYj8KePKTsdR7ZNjssXLlSnFYtilXfFMbYXFI1gXUm/
         3Vc2OGoWlpsUlfj4cqZa2DN//Q1JvieUAsQjMlTcU1DRB+qScK9pSwCIGd3EuasJMcY+
         BQKYkcYmVFQJFZZqosiIj18B8VQqqk2wpVVFZedq/T9Iuwo67/X/C9BXOCp0IPHMkugS
         ONIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616404; x=1758221204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3Kk5PCcvdUwK+/fsu2vdafHJIiHRXspA2ECOuACp4w=;
        b=tqjU6AcNFjm9Z1sMq7/I6RPzTGgiAsRdoJWPkvVSH+7S6q4vxPUoNtFasLS2mh7PhQ
         XBAHjt+gK8NMZUy94NzTQHkZiumPuwYHi5kJFl7RGVnzJJPHRXm5vzvE3o0x+ndRsrHl
         okGPmnhNfCMuIQR1fgb44flwoV+kuWStF58qK67e6rc+novpOPG4eDqCtgxQs/jTLMDH
         FT0j+a3ES/AmNaq5jDBC4MU+AxNSTygW2CzJwdAI4fxZfLTwnm8maWNm0so4/KhGb64P
         vXho3YQZKlYmhRmEkG1DbtCOvLLAlmwmdZFpaXqcEy8GGyykNEFlnNfBt4ykg2TTlFdE
         rKUw==
X-Forwarded-Encrypted: i=1; AJvYcCVOuKB7v8b5h6g/Vy36dj9UI53mNCn+KJMwrGHuOXKyrTWms6Q7xnzG0E4Ms8jbS2ivBha5JIQFd/NvxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx30S/W7SNBBdZftMP708+pzvT++d6mZeA31o5fi2iGT3CJdTY2
	WMB9z9rwvTuigL7GqrEhK6b7JS4AY8uNc4z6qM6mZRn8uAqerOS8ULsR
X-Gm-Gg: ASbGncv39J/qO5FCen2efAIEby0Fezb781GF7gX3XgF8ArStAlJTQ6PXNew2CrFC12L
	aKNoD5oF7KwPLCMsNe1t+LLz0gLFi6sTqRK9DNPGylODRhuZD09J45J36iWE6o2OmH3BncbxR3M
	FQW5j26c2JG2RyfUW2J/8oXpg/oZkF0T+Lzt9piFXCvkJf23uRGxI1hRy6LcxiV1yhdQIjXapeI
	z7U/YGPuGiOsDM0kKyWBd7SpO20ImkA0pLw+6BHMsgK/vG5LDMmvtYOs+Ru/oulRL0dr6BOqowx
	p2jc69/tLq7/p4igoA0RU1FpTZiYCbNGxz8AkH0rQJ085rXRnB3yoCBTRL/AlxF8IFBw+n3gKrl
	upUp0MuZzBFKMM8Q0sB2ZjZJCl1DkZaa8nHrSqYoMjthWDDFl2x14ep14ap5uzmVRxNa3nXGtPi
	JCcaJ6vMJ1eYvVJrgW+40=
X-Google-Smtp-Source: AGHT+IGPPdj04vc6Z8WnuiT1sf/ZoXQr56xVPN5ocFP5ISIHChh24Q+/p9n0LHx8H0kAPJH/zR+ueg==
X-Received: by 2002:a05:600c:1d03:b0:45b:86bb:af5f with SMTP id 5b1f17b1804b1-45dfd5b59c2mr43153985e9.6.1757616403529;
        Thu, 11 Sep 2025 11:46:43 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157619fsm36045945e9.7.2025.09.11.11.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:46:43 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a523: Add NPU device node
Date: Thu, 11 Sep 2025 20:46:42 +0200
Message-ID: <1930957.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20250911174710.3149589-8-wens@kernel.org>
References:
 <20250911174710.3149589-1-wens@kernel.org>
 <20250911174710.3149589-8-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 11. september 2025 ob 19:47:10 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The Allwinner T527 SoC has an NPU built in. Based on identifiers found
> in the BSP, it is a Vivante IP block. After enabling it, the etnaviv
> driver reports it as a GC9000 revision 9003.
>=20
> The standard bindings are used as everything matches directly. There is
> no option for DVFS at the moment. That might require some more work,
> perhaps on the efuse side to map speed bins.
>=20
> It is unclear whether the NPU block is fused out at the hardware level
> or the BSP limits use of the NPU through software, as the author only
> has boards with the T527.
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>


Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index f93376372aba..9676caf9bd4e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -852,6 +852,18 @@ mcu_ccu: clock-controller@7102000 {
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  		};
> +
> +		npu: npu@7122000 {
> +			compatible =3D "vivante,gc";
> +			reg =3D <0x07122000 0x1000>;
> +			interrupts =3D <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&mcu_ccu CLK_BUS_MCU_NPU_ACLK>,
> +				 <&ccu CLK_NPU>,
> +				 <&mcu_ccu CLK_BUS_MCU_NPU_HCLK>;
> +			clock-names =3D "bus", "core", "reg";
> +			resets =3D <&mcu_ccu RST_BUS_MCU_NPU>;
> +			power-domains =3D <&ppu PD_NPU>;
> +		};
>  	};
> =20
>  	thermal-zones {
>=20




