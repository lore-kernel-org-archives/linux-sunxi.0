Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF7E3E024B
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790509483; cv=none; b=rVH/cGHTOCn5Y0OwA39HP1e7dx5CWmitPV64UEavSwZQ6egPb11YGQZ12ebCDkNv7o9eG8MNThVpqGe9b3CJkWOgTYa1Nksmn7EpavP5QwshpiASFh+4ChlMmoMaLTxG3qldw+kgWqnDb6l8ud6rge2D9EnITJf16QwzfDCjHDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790509483; c=relaxed/simple;
	bh=hfsvOd/SdIwAhDO4f+o0wspmtu0+CDGRWfBBsuzDu0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z28o2SpNum8F1cWdnvjdTIoSmqtz6A3VS5gDbaVyBpJ2580SGGhVIsISsM+WIiptOXkvjz1kMxqZKKCjdOeJA2iMzdUICtJ9TQ8RVP69si79/9yOT3TyfT7kdMisPKGP7SDCdlZlSRA522DMrRXYMT/zUX7pxJuOsNDxz7ih0EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khFCIqWF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khFCIqWF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so11463435e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 04:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790509480; x=1791114280; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfsvOd/SdIwAhDO4f+o0wspmtu0+CDGRWfBBsuzDu0g=;
        b=khFCIqWF6v66MPeudWRwxn9sXdxKuSYozBxGaAUAob5mnXQ2N4My7PunhAZUG447GS
         uyHfgbfbntzEtijbsanXYzn1tLoL/d5qJc4h3pjVohJOEhfkrd6KPk8S7CjPx0iWmkZM
         4HkHO07ElaGzc6omPcLbpAh+Ef5E6pGHilRxconmVuhqDmAZlao06QyhiNI3HguodLpV
         GVVgsM6xhnV32p8m/q+vXoCLpU7Xzo09VqVYJrg6SD1xMnZXLIvhiEbvrjgemkBMyspW
         wZzC7rO/RqHwAuqCng22hJC2eqRtCjgGGJBF/fwzaye9dmth/+dcZYxJUJ9QvzzNkI32
         eKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790509480; x=1791114280;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfsvOd/SdIwAhDO4f+o0wspmtu0+CDGRWfBBsuzDu0g=;
        b=1m4Yb813jew07eOtLdwwfLUIk5TdfAATuQLcngws4KuroX4VdQNmWo8ZLp6JG7W3fF
         LcbslCo6sj/5WbSxsD721DfV0sqxq8RMFt1n9jRCopAFz+24f4SYZn52o/Z0FV1gHn3c
         WLwlTLMhNTSoeHKmgbsl0aD1PVnSabNWOrd9wLWDoC0B+nfGJRgxu4lEBTXixf26A4Po
         Gz0B7np6GZB/QNnHeQKhwfSENtznsTFhURGuZPH0AaxZJusdBoccwhUWJrcMES0zxLq8
         H6D5AahnKI5xXaU2WKV93a/Za4XIJ6Ukt1XGaN/NTapdAFVGNJT9oUKR7MuJipHSn++r
         bjFw==
X-Forwarded-Encrypted: i=1; AKwUvBzHJzyA14GmIGK3+fGLDPNm1FCVgdpsYMhlHUnL5+XG+cMrztVlQzaT/PsxWBZDoMzrVpaWb9vA0FHrOg==@lists.linux.dev
X-Gm-Message-State: AFuF++npcCcEen7gz+oW4/mLMdDNL+rf7owrZhrhQSSOwf5YnvJYj0CZ
	xlChMZ17jadB5LQ8DvT0CKKAyNe02jk/j1eWhx5KaPEpz52jT19tk4tt
X-Gm-Gg: AYBFou3KGGsbQTHI34D/LJHsyLHnoz8pPiN+wCgQB+KxjHXijn6KBsh1TK/MQv0C+4W
	j3lBxSTIEz3SOIeoIA0Sv13GbagPwBqnCoMqGijck4kVDsp9KK3Gb8clbS6XnMpO1HXwV6mVPYt
	IPQiBjEfHiRU40t0SRL3bmB146J8vg04zfNiCMQ8SSK+GPdLzJVMUy9BSuURKBNxZ9VG91gtbMk
	HUNT2K6BXPAFplvWBs4Ev8T+3R0QMxyf+cM6kzBRLb7JQT7T6f2Nmtbje28niAAndVepvC5W4XZ
	W0NcS4pcPIxcAxj+UTU7cLJFv/jDmu3dys3EDEq0J7j2qOngmAS5XjScUBYU9sGTWm7wrmBYalU
	M5tZSbw6ALHDN6a1GpzXeMYR1wJaAt4q5FbB/99yVFbt0/CBUdOsKDx2uC9HXiA5sSk0/Lwb8ew
	VvzYBTIsbmskKtbCHibycLcH8jY6QbZfmbm62lfM0W6SYCLKm+IhQsaQop1qFUuNtKSqI34lDKy
	oyDhzUPozvTm61DCVlhRR0yBk6gdX3cZXrsWvndqBly12qKxXt0gKx7kM/fkG5fRk5q3YcXQgIg
	mqh/LnjwIcIQ4WX7zdizUfWth17Qyo28IG9Rz9YdtMBXybE9PIisFEWDiv2F3ethE5e5QEtR/nK
	QvXWh1/p3MR+f7GKSj2sIxmwf9gbXR/4yeNEEHKUGcHllwlalLAyoCRtWROStVVCEYwQfcGBkOw
	DrxTb1PO0Hy9bY4sYI
X-Received: by 2002:a05:600c:8518:b0:49f:d325:9912 with SMTP id 5b1f17b1804b1-49ff06bcd79mr118283635e9.10.1790509480319;
        Sun, 27 Sep 2026 04:44:40 -0700 (PDT)
Received: from jernej-laptop.localnet (77-38-7-79.dynamic.telemach.net. [77.38.7.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018dcf59sm72964095e9.1.2026.09.27.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:44:39 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Per Larsson <per@palvencia.se>
Subject:
 Re: [PATCH v2 1/2] arm64: dts: allwinner: a523: add EPHY 25MHz clock fanout
 pins
Date: Sun, 27 Sep 2026 13:44:38 +0200
Message-ID: <IuUnKM8SQNWFRyzY1ves-g@gmail.com>
In-Reply-To: <20260926232142.5244-2-andre.przywara@arm.com>
References:
 <20260926232142.5244-1-andre.przywara@arm.com>
 <20260926232142.5244-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 27. september 2026 ob 01:21:41 Srednjeevropski poletni =C4=8Da=
s je Andre Przywara napisal(a):
> The Allwinner A523 SoC family provides two clock fanout pins, which are
> backed by gated clocks fixed to 25 MHz, divided down from the main
> peripheral PLL. Those are meant to clock an Ethernet PHY, and allow to
> save an external crystal oscillator typically employed for that purpose.
>=20
> Add the pin descriptions of the two pins for those clocks, one is within
> the RGMII0 pins, the other within the RGMII1 pins, although the clock
> fanout works completely independently from the two MACs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



