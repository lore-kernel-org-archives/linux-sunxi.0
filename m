Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46C839934C
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997932; cv=none; b=GpIXu0T75q4VUq4i8/xUAPAWO7AM1HmM8PHt5IAQlLCTyV9EEeOCqXsCxrvgqaI7IcupndZAn1Zu4UJC6ca/yPMcCIAHC9T1xk58ohjaYbK1oyEAZcOzIk2t9UN7IB98eUlwihBn9AGhIGHm95Q8Kv8yp4B6t7y4kDdikCz8NqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997932; c=relaxed/simple;
	bh=kFgK8lPtkO+1vWsJ8rKW8KSPYA1D7WBjiFbzZGEngaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fbx13jrzHV0LF5dC+1SFM3J6ER1mQ4P9kTqWJqzftXBSaI0n4ykC9laGNPEFyacsBAstrte6WdF5P6Ehv4DhnU4p+ttl9QZQAmr6kNbQIZKtMklruK6ck/aaVlc7WHkh0mgp8ljrOafEHU12AnzaxastEYcGy/E7aIMzMUSjKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2Q3o3iY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2Q3o3iY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48896199cbaso47925985e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997929; x=1778602729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFgK8lPtkO+1vWsJ8rKW8KSPYA1D7WBjiFbzZGEngaU=;
        b=a2Q3o3iY7wCWlHRatUjUnWR+5zZmSjDsvkFun71pjVtFx23CehLphfZeS/FsyU5cFe
         up/ujLeOHhWIxCy5oj8il31/ojzRsZpbWitUsNWkx34vArR6obWPEq/ueI3Dv2EvLuTY
         iTF99AQQO/aEzlke6OQvQ97u4SgWy3dja15f8Jo/LdSF/iiqV9xYzdaKCdFTEIrGHN3q
         n00hoVyKpwTCdwr9fCbYNgzyVI3oQ/mzLQrYt3OJtP2/Fg0qZQg3e3kHFx9D9DFXPtrJ
         5ag2YOSYAqsJ4oiG/RAcUPfbLac8t3333u70B/88PSQGpX2jcSZ51DNQeA7XubVkedYr
         SSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997929; x=1778602729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kFgK8lPtkO+1vWsJ8rKW8KSPYA1D7WBjiFbzZGEngaU=;
        b=RbJ1DZ+rZKywDPfJTJLYdcDmoRYmVMpg4A8rZ60psWMCMfv9OJHWNPFDmBCc11TBCf
         eUumuN5XSas2Iz9H+TUitDvoX+cGethtMPJT3uvKasrJLPtZ8e1Gd2Kj+hPnYr2ItVmM
         U+0hhJdf8lu3cLIKCQT3uapfFm0wQGHJpqoD5ObAVE6YPNR/m29pnjUj/kfIlzDvfS8z
         YmaFdTMJEs7YWziv1KImSmvdQHTlYa9PxVZFvOhUymGmKQdROCZxEi5yIO3cDz9o19MY
         NDZQuAUmkZhA3TqYupYJdKU7EGlnSpHixm8gmachqWYwgLu8/XIMA5T68N9sdl2t2VBL
         xHAw==
X-Forwarded-Encrypted: i=1; AFNElJ8nWjHUq04qalrhkIk4xZe49x7IGGiKA/cPFcpDpcJ/HPoT5ay3C4viuVSLYYpXkmHddpvxg+P7YDfQ7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyL6g1AdIiEA+VEAjm4UNbzEsnBkreTGSivOcvQ++Jzc2dNAmIY
	yN6Oqf6QEcfHQaOdtRmQ3J9vsBiQ509EgU1czlEMx0YbqJsIO/o5ZO0V
X-Gm-Gg: AeBDietefIIOVLnqvhfrCI4C1436KKJIoCqx68BVZ7c+fQ4c8ibtVpsjOhJFck2U1gU
	i57II52wUoTH0ELplieUutr9TBVR/izCg71Izn57iukJuTD1+aeCee1BG7jv+NWwVCX1hzYZTDf
	QkRl2OcnlKmVawQerwmHPnPLn51fAyPAsoV8d7xJQjnt98rJbRKGKkbXVxTeC6RuM8/XlPU6cy6
	+YYTxlARet8breH/w2sqx04r9MV5+JEb7zPVHN+ClkGIwvdSaLxFwlNPZOroW3hHin5QaQjLTP1
	46w5n2CGa9g/ruyDbQcmMvg984HiisRwgviaW85LFBhu1N0zzl40LZ9gvrL+5ZYkowttS9ul7Pp
	+hyHzce2Br87rnjfLSYP+1MTu8XURi9H+JWOXaNAtKLyFek1Kec8LO5m7w2Xmtelsw7osVQjMGO
	sFF0hYy/vE/T1StJWiDrFN2AIXdRXI44Fg3FHmYlNIDjxRZ/TPRfDzhN3uQVuLpAzNnKnh8Jav2
	Ya8s+PTe2NS0DEXJkBEv2dxSs/q
X-Received: by 2002:a05:600d:8408:b0:48a:53ea:13df with SMTP id 5b1f17b1804b1-48d186dc892mr46627055e9.2.1777997929083;
        Tue, 05 May 2026 09:18:49 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055e2d3d0sm5425787f8f.34.2026.05.05.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:48 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 6/7] arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video
 engine
Date: Tue, 05 May 2026 18:18:46 +0200
Message-ID: <YPmvp_egR-m-cMSokrsA5w@gmail.com>
In-Reply-To: <20260505134812.408316-7-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-7-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:10 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The video engine on the H6 actually has two IOMMU ports. The one already
> listed is simply named "VE" in the user manual. The missing one is named
> "VE_R" and is probably either read-only or used for reference frames.
> Either way, it should be listed.
>=20
> Add a reference to the "VE_R" IOMMU port to the video engine node.
>=20
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


