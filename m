Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EB23E074E
	for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 17:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607593; cv=none; b=RKPb+79xuysyW7dUj2/usCpCHLzB2aIr0YCgN/nBRCVTQ7mA5ABbiXtNooyF2tjngSdUbilrZoLpLVrpCrhpM25BDvHnEYY3cwe32/U1kv5xRloFitKs8CcP08g3Rs9xMpyzj0zp0xa3UrIJ75clqqYIvQ77tRxC02yl1upUQ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607593; c=relaxed/simple;
	bh=sP1uEntjC9OU9hYPAs+i036qumK/QyRHgs5/9FYhZwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A7Zm3GqRATK0Vjgbo7YRtlNWah/39JrTdEDQpxBlVUR8LamfI2tt3fBV1owTiSqVMCu96leOyi1wem4VU3a088KmO3c+oMufrJq2M30CnAip//870Fk7FE+Gw1pxQYDMlRBVIdz6BHFO9NjFYWcbjfz8unqMSZTUiRv0fbRpZ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hotO8rhy; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hotO8rhy"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-444826c16ffso5065040f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 10:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778607590; x=1779212390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sP1uEntjC9OU9hYPAs+i036qumK/QyRHgs5/9FYhZwI=;
        b=hotO8rhy+so4ygcW6o1/278OjIxuMJDPXUn/t5I6RFzGcBr+KS7csQq4vdf7KFkdog
         vj3/usCGpjl9hjK7YlwPy2YhMLwN+W+BCzSqqLGV5g+u5OOuk2y3Q5n12tBLFvxuUu00
         kip9iyIeaGHFaCSoxKmjkjYX9WKFNMIYtkQcoKm7xi0YbdjpFj4KOCA1+nmpZxWyPoEm
         uoSLbb8O81z/Zsu2805Hrx43Uky+lCtHpR94qy5fG1HiewBZ/IDg/+xATWtWFL3OCMuX
         2YH+zCb0buOGVzJEklvVAiC7mCjFkPpostJpAihGztwBoskaDzxh3VvPqzYqU6lsiVTF
         k8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778607590; x=1779212390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sP1uEntjC9OU9hYPAs+i036qumK/QyRHgs5/9FYhZwI=;
        b=qMuJor6KEUiH7y/DiXdzRVVhlG4YHhYomFyPjhe8Ojo9r26ScaG/ieBFDoguJbl4sF
         pOui/6ko82ZpjZQKGhYwj5s+HD1YMUD2QnpuL+5xzf4j5ECdei/7bCQmPgcN3G9+shci
         tL6nqEL/1B9zraNLzWzvxocDiaLzSg8ixagJzWMcyH/LNGpds5B0hJ2nDY+vZifvS1yd
         b9fq0m5Pc1wmZkDQZ69YJXLqsDTSeZf5FFjVFk1rjzE3wAXFA1JMO2Q4ieMLjq7zS7k/
         NNCN17tIp2hs39cleL7JBPsbWewbXjjt51ZskEtHfFAhAVhD5VPamGAO+yPrsjN08dn3
         E8Jw==
X-Forwarded-Encrypted: i=1; AFNElJ8AoKhINZwJrABMtst0i64Qm/2WQ6D1oCBYsWXbi6460XlSPcUsp8rcVoKa7tb2vymfGyHEI11qVH/WAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+f6lhZ4xzGGKy6ksuW0SmbeLJ+ESBe9ij8fdMoR5v59ed7TtC
	7cFmQulRcIWUnKV1PTtajysCtcZXveIpDj7H3oBc9HOGOHw3MtMz1RXB
X-Gm-Gg: Acq92OGw+bFav+QYhrsavmf7qDhws0T2QtbE985IGzO3lnM2I91vZ396SBarFTCD/ym
	eESZ1VWO/rUk+jnVYQSAXpqVLneV/3IEbU9vs5fbr+/k5682lIAkscDA0IqZ8jNJX6Q4I7L+seb
	pTZL0VaZVFHnaaRVsH6/gUUlqi8y/gNSpmn7U2MzkHt7YS7uKDZx3nQTaZgmsTKUww0dN6Cijuw
	WUk1XopJrWbSRFTIuJFr5rzIIbc7LPuJ1Wu5D9HEfxu+Bgz1vt3rL2wMBEvBd8iGWHVUuMcUx6S
	zReTIWIdfr2+TGdwdKf57BlHrpD47YhJIJi8a8rwg9F0nh/1z9hVFow2P7QHV8xXDXc7cXyPgc2
	gBKLwRXkJwRQctA55utjsIqgJZE3wnUPRJvLH8NkVyJjl6xXJvlEJcoqwlhtA3WPE5ZXIH2fddd
	XzlgjX0X0N/YHjgX++cjqKw4px9psIu1EpW/1f/TWzfAEMV0YPpMZepf8L0iCPlm5PbVBilTQ86
	MpSN3Oy
X-Received: by 2002:a05:6000:1865:b0:44f:da26:cbb4 with SMTP id ffacd0b85a97d-45b1379118emr6402018f8f.21.1778607589127;
        Tue, 12 May 2026 10:39:49 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454922715b9sm36274813f8f.36.2026.05.12.10.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:39:48 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Chen-Yu Tsai <wens@kernel.org>,
 Paul Kocialkowski <contact@paulk.fr>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/5] sunxi: spl: spi: Add support for Allwinner A523
Date: Tue, 12 May 2026 19:39:47 +0200
Message-ID: <wMZoJNOrSM6zy-28htTEcQ@gmail.com>
In-Reply-To: <20260511213713.15943-4-andre.przywara@arm.com>
References:
 <20260511213713.15943-1-andre.przywara@arm.com>
 <20260511213713.15943-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. maj 2026 ob 23:37:11 Srednjeevropski poletni =C4=8Das j=
e Andre Przywara napisal(a):
> The SPI IP in the Allwinner A523 is mostly compatible to the later
> generation used in other Allwinner SoCs, at least as far as the SPL
> driver is concerned.
>=20
> Just add the pinmux configuration for SPI0 on PortC, as used by the
> BROM. This enables SPI (NOR) boot on A523/A527/T527 boards.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


