Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240373321B3
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983124; cv=none; b=gKwVsazpfe6pFHPG2V3AGKrTn16ZmT6K7UQzxGIENGwHyToBRP8JjGj7BzhaoMyecGigyoMcRSaStTmGNIoyPI8PTZ5qNhG91sMnI+WtZp1omfqhPPWCpNXoHOwGjeKnAMGPafuUeWVQhzekxjGymRyjzxjRGMqfJn4qHDWlVtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983124; c=relaxed/simple;
	bh=V0ywM16huaA6vxoSrQo9VcxXEvOPk2Rt5CdRZIoeNHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hth/FJjKvc926Fwb/Fod1YKG/Fu79xpNCpe1aarsT0vqqTerwi+q67FY2AgVzBC6ZRSFfEYJfHsP/dm1gpc8VTKuMI+hi+5WcPfGCQAjF+NCQoEh1Ww4g6NXjZzkALbxhM8ehEj5xFIk6nIh+qLejhUzgYWmNbCdlyZHNOk7/uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWSKrRAq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWSKrRAq"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so3499713f8f.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983119; x=1761587919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0ywM16huaA6vxoSrQo9VcxXEvOPk2Rt5CdRZIoeNHY=;
        b=YWSKrRAq/aivJ8khqUtWHM1IIRnHOw2friJrgTHxVOvCjDN0I0b1oo8UPVYyi1kW30
         w9S9DkB2pC6u1wjHd+TS9s71S2XYFKuIapDYn4LHl7l4LGt0UcKN5yNk/0x6iISV6N93
         4LQQOXU9AnFHYmqznrS++4nROqnhDvwzm3VYYBY5zrj5+WjVQ649ixEHEnYjLu6CoPP7
         BtNdvp+5HtL6b4sntjNjccPbnBxUD+qd4bexA2K6+6DunUpQo2oZHLFXgxqwk7mDP3sq
         kk8YfwBgMEuX78kxSWe7uVNJEKB3OMQ8fx15pv4LeVkZtDvax3oLow5ASuveSJ331WLm
         t/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983119; x=1761587919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0ywM16huaA6vxoSrQo9VcxXEvOPk2Rt5CdRZIoeNHY=;
        b=DISz2RGEPUzbTcWBbpPD96zRpKyPPvyHDG+a3jSA66NU1sHGFZFCGzthbhiI6H0HuV
         d3BHPfNXCndF9vxt3kgyuWPnjDh7p2IA+JWb0VR5czTLxrSZYp+CVWiyYBjTbW3FWbwQ
         bANAUpXValQz1uinvdq2LsEnB74xRXdK21ytGEgx5YEjYMZZd7Jt6Q5hBZmO33qpGve4
         yVdXY+67NBbGRHjaScSxXwx2NVWm9VX3eoIv9lHDeJIY28Ts+TiMT+akaDHCHt+cDkOH
         lgK/QU8yZZMZgbb346wZR69RUKPo8QIFlJoZcBlKM8buW2FRdXgX3E/Gehpgdkifed3V
         6muQ==
X-Gm-Message-State: AOJu0YzLV+Tn0uCup5PCdcKkqs5Jat//6yRTMPT7HqX4GkfBU+3v8XoX
	fVyM4ICRQ87aGzFWXSpKSHOtYe4zCp7BYQOxS78YLtO5kX0LWF/nIM94
X-Gm-Gg: ASbGncsL6USZcpLMry7WoHfM/1hA8tt8e4m9jWD+Xy1kbxnumVfVQMzAIMG7MzXJPhZ
	QGNYUtWPKrTtC77HfKGwBFUAP02uXf7r8YySBhPp8X7L85DRb2e5rW0mVOthak+5RUkhKITX0t6
	oUMXmXtW+2ObfpnSDGVEBElTBfupFGdNA1b7uN5Idl1+2rg5+676mF5tRVAnGU7kazq1ghxEqip
	OWJ+g4AKG38lsUI/3aiOVHuPNBbbxDlds4Q+L97INja1eeeSovgCLBmbAMXmYqdQFUvJPtTxzNr
	6EAzeLFoLmzq2RZktaZZnXk9AbZO6KfuDEhLfLNx5Chbg1CXf/br9nU3U6hXDQBpOjogbQs4C+G
	IZoG64CcmTqT7DdXF6gK+6AaMoPzuCpD070YDKoDRBrQD0MVASg4+SjKPyLUQx31XUNH7bitV2U
	6kDo7t30WzJAKam13KSVL2mYqhcoqi27hxlv/V2AgCfS+D/X9UKg/Stfq3jIw3kQHsHYirjBvo+
	SPEMQ==
X-Google-Smtp-Source: AGHT+IFevLoNtuerBsIw1VuRArXCqqtvXfnOs340pTPBnyLhuRUJ7DD12vxDIIoA4Zumvg8MBc0QBg==
X-Received: by 2002:a05:6000:2406:b0:427:a27:3a6c with SMTP id ffacd0b85a97d-4270a273c43mr7686143f8f.63.1760983119338;
        Mon, 20 Oct 2025 10:58:39 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0f7dsm16168108f8f.4.2025.10.20.10.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:58:39 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 08/11] arm64: dts: allwinner: a523: Add device node for SPDIF
 block
Date: Mon, 20 Oct 2025 19:58:37 +0200
Message-ID: <22871360.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20251020171059.2786070-9-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-9-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:54 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The A523 has a SPDIF interface that is capable of both playback and
> capture.
>=20
> Add a node for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


