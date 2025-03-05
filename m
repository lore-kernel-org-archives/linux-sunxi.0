Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9071A840E
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Mar 2025 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741198087; cv=none; b=XGnxg5lKuegH3/OBVJP230X5kuP1QBJbnT+zROcWiekOJk5rAawuT0FMpTQ0FuxSHr+QiAWjJil427Zm9ArtC8d4ojTbQ3PXrFLWlTjWnvjUFDfKiZSx7d88S206XzXSg852Uso9rK3wvoyHCpDOHSS7ygVXVxI4hbbv4QuOiZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741198087; c=relaxed/simple;
	bh=G97yehnfCUaEkX4rJ+36HP/dRpAjXYP1giHtMFjur7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qSmRickj5ZkJDvnr0pHLZSPjYFhBw/yJDrtQAvKbuAc+hCbYZJD/QlPkvJ9TQP9ECAYjULcCWQq6vO/UawqwdLZEdzcRAhdPBiIaXHKx+DR0HHaPNg3MqHakRAwb03pkDkQ09kWjtUTfwHtdLDo+9o19v+zd5S2bs6cwrgiuTNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hr5u8vl/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hr5u8vl/"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3910e101d0fso2466968f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Mar 2025 10:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741198084; x=1741802884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G97yehnfCUaEkX4rJ+36HP/dRpAjXYP1giHtMFjur7M=;
        b=hr5u8vl/XhY1MQ+j9/1TD83s6tTXYQD6nrpcfCPxTA0VI/QpB4bPGMl5flVy6tjugW
         +bdC/kQqgsot6yp3hvbo95ZN6n9nfSDYdwXm4xCrwyVUZ+3Dla4+Q8/o/wo/knaDXbb+
         mQBEJoFGq9gmVqTs+E6OWv1DOWIoiqiKjKCa/g/CgrMQysqoF3E0TiASoeA/jccOr/kN
         f2+SgKI0DjUzfMXbDxOAY6dzFMYU4rryyz5OD7tq0xLb5+AnYE+Ok6UcESHPiUziz938
         IdPkU1JRljZrUZ41xLlhKdCrLRezn/+w+wmfRMdDUEbYyk+zSRoFvUGXiTfKnBw3AxYS
         claQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741198084; x=1741802884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G97yehnfCUaEkX4rJ+36HP/dRpAjXYP1giHtMFjur7M=;
        b=rf5Q/OleRHL2QuDnSGHB68Pypnn4I80OpmxxYgNDvXg/mLb/ofbYcVKUuhwx4CW1Xb
         Yt3OJOcsxi3sv9kD5+B/V6TiwCxDVwkEqc28P+rNOw5/lWFqFKUtnJr7WMGY1N/UUvXT
         6+USxde24PDxUbt0AbRTIWgqE9PdruqhCOOsR7IN63LtHZoGkBcWBlAMsiBqUxlDXg6w
         JDXCfFqGBIyN+yWe+h+BeQnoq0YVp6yU4IbJdNF2uZPAFTsMvwj9VdUofVe07VLV/wbs
         SrGKQXiX1AR+SqOoQqjljDOO0xG41J75A5U7PRHw12nLQZ4IANEB2gwYi+7P1l1LuKWW
         06jA==
X-Forwarded-Encrypted: i=1; AJvYcCUM76Tpkm8m2loD78ajleGjL/4hoNFZiEsM8PUDbwiCFNKcvpPjy92iMkQSN8dAKCe9dVKtLV4eMWOsYg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs2+NqEJUToSFEbeapuQgX6rpn8nfMYEukoogzNXA7HCabwwYs
	4f7pOzebhPUPjHgU6PLxD+c0lZSpWQY06JTLGWf5xZoQdUfdxGy3
X-Gm-Gg: ASbGncszQzV/FLoXEh1u/a0+ae+IwE6bJSAnC/zz0aJOp5jMuyhIzbx5W0piRh+zsRx
	IuEOlbLP1KP/hjzf0oXH/LrrH828N96Cl/rFbJufr/4J1lM5O5kkjCwFbXNWMHM6sa5xC9eNKZ4
	RpEuDErpzouc2cNdcaltjdi2MQ2gjjSbrYwVTpohEG78ROe6xMntYp4YU6xJGbt87zCfv1xNv94
	LqVmsIo5HTqE3712tZtLNHgncA+ndvAfNiZEUSspC9SUGcgRGzYyUkWssfpm4XZEhUuny0sbJAm
	f7eJcfzy24I9eomEBZ+sPP+TxareFrXLup7AMhBORN34r6UCLiSZbVhXHSN16DDLjd2w/6+nxgL
	hc9WPJyHXLZJT0auijZOs
X-Google-Smtp-Source: AGHT+IFm8od6qyXXyVja7heRv60Cgy26NzGQfpPsD4T/2EJzs0OY9LJVVvkUZl+F0di/z2dnO6/Ysw==
X-Received: by 2002:a5d:5982:0:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-3911f7cb463mr3396313f8f.49.1741198084189;
        Wed, 05 Mar 2025 10:08:04 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391254508b3sm1765425f8f.79.2025.03.05.10.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:08:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 8/8] pinctrl: sunxi: Add support for the secondary A523 GPIO
 ports
Date: Wed, 05 Mar 2025 19:08:02 +0100
Message-ID: <3535684.QJadu78ljV@jernej-laptop>
In-Reply-To: <20250227231447.20161-9-andre.przywara@arm.com>
References:
 <20250227231447.20161-1-andre.przywara@arm.com>
 <20250227231447.20161-9-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 28. februar 2025 ob 00:14:47 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> As most other Allwinner SoCs before, the A523 chip contains a second
> GPIO controller, managing banks PL and PM.
> Use the newly introduced DT based pinctrl driver to describe just the
> generic pinctrl properties, so advertise the number of pins per bank
> and the interrupt capabilities. The actual function/mux assignment is
> taken from the devicetree.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


