Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09135F191
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 11:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781348699; cv=none; b=LvzPseKoU/K4RJzhqHQ/+7cut+K0SPew8dOdLm4y2yftp3EsiLqhgcJQcDmItrGzBUSRWgX8qweYiv48lZH2l3/tMy6qt7gkCIhYysPUB7WalDIYy10Sa5AOPvfVlQvP5A1+rn3IKlPbqOfbrNmhPCXCHkts+SIOsstSTDsNPq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781348699; c=relaxed/simple;
	bh=nBEHkzqVLw482vGdz5GT4uuKqoZ91h8lkYDukdrN6Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iLm9zC7XB2zonxWMPIpTvq0HXsm3vR0FP7aHYMqQhdmQO8pJO8V9o0z2sga1Sr6N4kXOYIRdyMDEXmGfaSNfTX8iQukZl/9t8trzmDWcYkgI/JOSaBCj5zgS/wjfuuksGG1M2fxeODhGPysOhpQVlgZwY3CTVL8mQjqYBM2bYtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfIXJilC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfIXJilC"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so11693705e9.0
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781348696; x=1781953496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBEHkzqVLw482vGdz5GT4uuKqoZ91h8lkYDukdrN6Gk=;
        b=WfIXJilCFnOb4yPM9frYBV1lZXCnw/1gnty1DkvfFVcPAA2geOnyc5Os9EflybPn2K
         YrZI1j+9leDmJ8eU+F7JD+4NMPjM1R1choOOBT8MLvDJr3+8esmH8zo8r5WpsRSP+R3o
         n5xqcLH9VOVmjHvHZG3Cn1Ue9ZdWAg+xQ7JuO+8nZmuREtAABg3NL0stfsDPoYCdFoXP
         6hjfv1hvJYjQbvtMTTwR0Ux1bl9Yk15+UGmNL0Ps1iGeee7mYD17V4Awp+y/CmxtvNAI
         3o5tFLS6BXFZz9gzmgfu0n2P7oqPp72z8VzENjkWeZNbnXe1279mlHY4IMiQ9u21kvU8
         NmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781348696; x=1781953496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nBEHkzqVLw482vGdz5GT4uuKqoZ91h8lkYDukdrN6Gk=;
        b=JEPYrKPj2cJ8JvxVjGY479Pkx1HVSU4AMvI0ADdmmSjVAcVEZTxthKW+vmyG0KIrg6
         iMtGBI+CmZ4mjxFOjeZY3t/V8tRaGyCdOfI1KCqVOvNBTjQxW6xRwMMWLqpGjbigripH
         iaR4MMKw8qir8P+6kSGcV0MHfqQjgiYjBGsm8+ugqKDjiD/VjXuhgQYb7kQZeqhpZxLv
         5IwpsjLq1NOPufWgoqpJDMiAj0itcW6yY35vv7EMhgL7LNr3kIYtGNKpv5B9OFLdWe/h
         szNOFcDE8Tz4wMQmy2NJTf7wiAH34hBFuFJE2Xuz5KiMmfBP8hHmv2V7YieVoU9mkSpQ
         H5mQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2ujYihme//vFNGQE1iVDpP1wE3XKDs00wQNsE9LkKGk7TOo2hIJAkdqXc8vdiAf0/kCjLmA9n0OW0Vw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAMeLtugZ6Axma+NI9wKWm0njDGJjFmfauEI4zB5ML25Zg+7id
	HsefMYDi6VSxFb3N9r678sGhLYupF///rkb51WnCCJ7bQv9RDNKiIra8
X-Gm-Gg: Acq92OEA7RAzL0dOPIqycFNW8x4r74lkMi0vNPFuK7fqcNij0pw0joBiXvGS3mAm/6u
	CJzcp7OlU+sUxVgHW/Qi//15IfhLKJB6E2oV6oFH71Jl0iAycSpKuubjoxd3HpJOjYfOP7jqK+m
	xvbIYBaBHeV2lR1lb2O0sT6PbAfoFurSG6uGVv/FK/LE1jYp4aG/Gkul0MT8n9PxZ+L+POfnkCA
	f9G0LPpgUX9QYd7Z+rwdnYX3S276Sodg3UW0UTTJQsH9yv8nkJ524fLWoiWVGIWYBoeOAn87CcH
	LMQWV10L/JlTzM51es2LKX/UDOobz6XVOrcDGKEV3CGYD+wlEEMsA77Ti3POzfoWHe9TSBZYiFB
	qGnxyPyr9yjBzJUS2BmavkwTosEFObXeQDw4YE43Lv9uGANkrQwNjE6QHPI0J1fu9MhuCa3o+dI
	vu+wO6bROIWNoBghbdklWTJJKEudGQAsS/xEvl7KoPLCxB
X-Received: by 2002:a7b:c8ca:0:b0:490:6237:521d with SMTP id 5b1f17b1804b1-49220092e7dmr27202205e9.13.1781348696232;
        Sat, 13 Jun 2026 04:04:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49220310a58sm75036335e9.4.2026.06.13.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 04:04:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>,
 Lukas Schmid <lukas.schmid@netcube.li>
Cc: Lukas Schmid <lukas.schmid@netcube.li>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject:
 Re: [PATCH v4 3/3] ARM: dts: sunxi: add support for NetCube Systems OpenNMC
 (dobermann)
Date: Sat, 13 Jun 2026 13:04:54 +0200
Message-ID: <sTX6E5Y2SsWfe6WORpTiCA@gmail.com>
In-Reply-To: <20260606205452.2386930-4-lukas.schmid@netcube.li>
References:
 <20260606205452.2386930-1-lukas.schmid@netcube.li>
 <20260606205452.2386930-4-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 6. junij 2026 ob 22:54:43 Srednjeevropski poletni =C4=8Das je L=
ukas Schmid napisal(a):
> NetCube Systems OpenNMC is an open replacement for APC SmartSlot Manageme=
nt
> Cards. It is based on the Nagami System-on-Module. It breaks out the
> following interfaces:
>=20
> - 10/100 Mbps Ethernet
> - USB Type-C OTG using a TUSB320 (usb0)
> - USB Type-C Console Port using a CH340 (uart3)
> - USB Type-A Host with internal CH334 USB-Hub (usb1)
> - MicroSD Slot with Card-Detect (mmc0)
> - WiFi/Bluetooth using the modules built-in ESP32
> - SmartSlot serial interface (uart4)
> - DS3232 RTC with CR1220 Battery Backup
> - Extension connector providing SPI,I2C,USB,CAN,UART for future use.
>=20
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

DT Check passes, so:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


