Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CDB219F9
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 20:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713730278; cv=none; b=F4Sg9Zdy65dx0ff4UNr/GkwtUETiwpuBe4HrvMnSDk8AjiJuApnge7GxVnzdDLxorZbbrTuVoKyJuNgxuxitmmRTK0zy9hR+8yoi8dGELeeRQvd7rRIazJ1ROR8MhUNXSmtEIv4bsMtVtSRYfZLcmVZ2yK5k8RM5D2UHmpaXWRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713730278; c=relaxed/simple;
	bh=qqMBfA0N+w7XGWIBhraZ8GVSy/adytCb55VV+xgaTUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3TJW5F5RHw7kuTJZiusG2oH7U51q55IDfZS7syuJs4SJfPplVbZc6haneeATw6RvUPzc1vSehQClj0/XtlSZQd8sS/EoVCLGkk7bun0RpwX8CPpxd21r0UrxKNYIMHJNYmCjB3NzvW+t+YMsUCTx/zTnBbf5/WrxV5y7a5AH2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jp07JjHY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jp07JjHY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-34a32ba1962so2503845f8f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 13:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713730275; x=1714335075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RwdqOtr//AaV24LaG86NV9h5snzCvAUKPrjQ8vmFB8=;
        b=Jp07JjHYdShVeUPn3Eg7+BPFf09qcbFCPnOlk77FJ7QrdJOzvzXL1xdaCH0oN+P+WS
         CQMEOCCtrjc4UkPSvHtPjD/6PXd0EiNgjqMtHX9K8fujM3COA1wQ6BANWO1fa1m1p+xA
         PUGUF5M15vQwfw3xRmHvRQElJRBqzRdnRoq8wvcQ/P5MSn3y1UXIwMSlfae0YYWjSH4G
         9vyYUgii2YVCPgddkovIog17/w6UHmuCQx3F3hWFkTFHM1g6IxZ/FulwxSDEzH4rQq53
         CmhC7DATKEtDAvYvnH36EjySHGbGVDAvQM0nABMplNGPoPWGZ8z1HaqDUMYMCC/5LKZu
         M1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713730275; x=1714335075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3RwdqOtr//AaV24LaG86NV9h5snzCvAUKPrjQ8vmFB8=;
        b=n5V6hT0s3ymmxamxltUZLXiZ1lmk6eIzWQqpmZv/QHMisDxK5p0UmsEFMz4pStg5lL
         ykVQEdAjOHkDkhDpMREGThZrzCqT3k3enoZsZTAH2Zk04alPxq0U005udhbVYAMuVKG2
         Bd58fe21J2WPzZT56Mgxqi4C4y4OIYB5AgYfVou+kwtB1JQw/0b61Uh876qWm+R2Ujrv
         MEs/+A7m0F5g4s1QXIzvT6y6zpxgyTaoHFPP8qUp8MJQQoD8xO5BDiEykZo5t77/kEqM
         qsnNdMd4vubiE0ZtacxTLHp+ieCTSUeYYbqwr3ntN6gsDFeflGc8uRWD7qgpYSsH2C1r
         id5A==
X-Gm-Message-State: AOJu0YzgoVIxQi0T/VF9UA2fMcUZ8ngmP90f/QQ6w5s3A3yfLh0Y1Oss
	Q7EES+LKWyZbrwFbuhlsaIu0s+RL67CTk6yDjGjuxVZCsVVHeh0p
X-Google-Smtp-Source: AGHT+IEqk4KI+7BlHqF5IqUldRnCMFoNl4zIRAo51MUO37B3RZ51InldpXjYE1nGvwIC7tRm4HdxIg==
X-Received: by 2002:adf:ff8e:0:b0:34a:56e7:5cc4 with SMTP id j14-20020adfff8e000000b0034a56e75cc4mr5418624wrr.2.1713730275182;
        Sun, 21 Apr 2024 13:11:15 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id w20-20020adfe054000000b0034a366f26b0sm8488295wrh.87.2024.04.21.13.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 13:11:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: allwinner: Add Tanix TX1 support
Date: Sun, 21 Apr 2024 22:11:13 +0200
Message-ID: <13495191.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20240418104942.1556914-1-andre.przywara@arm.com>
References: <20240418104942.1556914-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 18. april 2024 ob 12:49:40 GMT +2 je Andre Przywara napis=
al(a):
> v2 just removes the premature OPP header inclusion, and adds tags,
> otherwise it's the same as the previous post. Based on sunxi/for-next.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Tanix TX1 is a tiny TV box (60% of a credit card) with an Allwinner
> H313 SoC. This seems to be the same as the H616, just the "bad bin"
> version, limited to 1.3 GHz.
> The box has no Ethernet or SD card slot, which makes booting from it
> somewhat interesting: Pressing the hidden FEL button and using a USB-A
> to USB-A cable to upload code from a host PC is one way to run mainline.
> The box features a minimal set of peripherals: one USB port, 8 or 16GB
> of eMMC, an HDMI port and an (unsupported) SCI S9082H WiFi chip.
>=20
> Patch 1 adds the DT binding for the board compatible, I refrained from
> using the H313 name here, since it seems to be functionally identical to
> the H616.
> Patch 2 adds the devicetree.
>=20
> There is a blue and a red LED, both connected to the same GPIO pin, but
> with different polarities, so it's only either one of them enabled.
> I did not find a way to describe this in DT, so I omitted the red LED.
>=20
> Please have a look!

Applied, thanks!

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
> Changelog v1 .. v2:
> - add tags
> - remove premature opp.dtsi inclusion
>=20
> Andre Przywara (2):
>   dt-bindings: arm: sunxi: document Tanix TX1 name
>   arm64: dts: allwinner: Add Tanix TX1 support
>=20
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-h313-tanix-tx1.dts   | 183 ++++++++++++++++++
>  3 files changed, 189 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.d=
ts
>=20
>=20




