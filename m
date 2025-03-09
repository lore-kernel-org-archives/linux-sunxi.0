Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F3D2BCF5
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 06:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741503290; cv=none; b=OjKpiwX6BWO/V1IBBIAmyiv+KgjlLYmlN1nrCWnANOaa1As1GTdAizjF0nbZxzaiH41mLICzWPe/moSLWwqGu9UdIw103A0Uj2zhVryRbBacj/2Pd3t8GV/O/7KThg+Q1XZqdvTWC5wAuahxqQqxloLEzqX4Mz0KIVoEMO3BsaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741503290; c=relaxed/simple;
	bh=dR4yAwvTNJJvPEYH7CC9OJCvxPsipjkV0SH/88zcY7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c+b2qadzb0m7GRpcsZ1giMKWIbZHaVcTXXk4Ak7xcG/Bx2SQy0iDIyGd/s/Z0h6EsQ86ljkDHKif8WzimSVLy9dp6xjAMnQ6u5BzDIIdjU+zE4pJwdSCWrh+aVCYnYvpRZmOchdk1SnRz2zqC/3wgFDhLZHPhflCSchaanzNlT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSw6kpnI; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSw6kpnI"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac298c8fa50so9555466b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 22:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741503287; x=1742108087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dR4yAwvTNJJvPEYH7CC9OJCvxPsipjkV0SH/88zcY7c=;
        b=bSw6kpnIdlx9EaeGKs2IjdOoRHCxXgOWjvVuccXbKdUVWg0QbxFXmMjo2jOYsqnvN8
         gyat85ARuqdHizvA6ZLwGBh92L9+Ux5a5Lln96dsFn5c8NrfBG7o+D+ZyKh3CtZiRJbh
         unBI3vvDg0a0c5i13xwl32YFJmbza7aAy/h6XX6at54tCuALDw6Hy1zkQwwUROaHXzha
         Vh68u1lIgygnoccHw+BpnvntLTuYaEthHfk+t5pQblsOiiBQVqOEo+TOUIikACawp6On
         OBHXopjyoVx1nv5m1or8v53yXMUQSLizW5J6cII5uo6QV0tukf/RFAGANzKBT/H06sss
         cvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741503287; x=1742108087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dR4yAwvTNJJvPEYH7CC9OJCvxPsipjkV0SH/88zcY7c=;
        b=E5xzSCPnIlh0NcSDK3WS1iMnqZvUt8IthUQ576sQpJRM6Ls7uGAaO5uHpg5UMaEfuK
         gYenk2Ot1+95RV+c6leBqnV39wI38HMZgVnFZAscKYD/42YDEOdGeB0NS2CRaU1OJ0M2
         TFFDZWPWaXW2ZIHVnC42Uhm/gJmnU1MVW48irMG/9VOWnOlg83IsYxr71fjQ33v43+Lu
         wDV15XqRyyxA6uZy5sI3Nwran8jjj/AkMbm8AJQKp0xHViuMLpyfnqmF/u5YMeJ07Mc2
         bvORr1qzZj8TeeBASTrSd/re0472oJX8YcEo1xEEVDXgX6zERLjFuOMUuHhFiHdFgcpS
         PA0A==
X-Forwarded-Encrypted: i=1; AJvYcCU/OWsaI18Iuvibi/EIbvmONDVMUPzXNARFOqxSi9/pKBqdOVlllRiuBpXYkx+Pj52YC49v3avendZN+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTiJdjSmOuiX2oAtmtOmXde+MgOK/uBLA0sJb8a5ZW61fhXiwA
	pXGXp/uy6PZxyt8gcPu9NJQjjxyylXEvxrFw9b+usVoNgUlDN6SC
X-Gm-Gg: ASbGnctgtyE/ptk6LkI2qoIFxfPsCuFbBfZNgMNdakMd7ZaY0lLN0uBB3O1hGaahD13
	4zrROs3+lsx0RopCupaS1frW2j7bqFCINv9p9XMKp4MWtgz5pMXahikitK1KympD6brgiM1QAyX
	xlv8cxUeuP4eYreyAH6p471H8k0RwVDD4BwYXvi7IEWR5Y1NmrQnglt0x4v/1JScmbfcdWIuEoh
	8bqyruYBMxFCxkchW2zvCmincaXr2BKDBSTWKig1/UPuDIaIq8uQmv9/74MiMcCwB5sjBnRfoFn
	5QzR3YNt4WLIIjBVjONT5xynYKX/jNPYGoe0eTDC7gxWYLxyhnU5YARESC2/rIAaDQ==
X-Google-Smtp-Source: AGHT+IHtiDp8gpMAsTaMMeg7HPNhPDz22dxUOSHPXpQ1ifUae7xqi3maop+iP8E/2ePHJtdc9InCnQ==
X-Received: by 2002:a05:6402:2353:b0:5e5:c0e7:f428 with SMTP id 4fb4d7f45d1cf-5e5e210296emr27185280a12.0.1741503287053;
        Sat, 08 Mar 2025 22:54:47 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a9303sm5027358a12.42.2025.03.08.22.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:54:46 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/14] clk: sunxi-ng: a523: remaining mod clocks
Date: Sun, 09 Mar 2025 07:54:44 +0100
Message-ID: <3344204.44csPzL39Z@jernej-laptop>
In-Reply-To: <20250307002628.10684-12-andre.przywara@arm.com>
References:
 <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-12-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 7. marec 2025 ob 01:26:25 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Add the remaining mod clocks, driving various parts of the SoC: the "LEDC"
> LED controller, the "CSI" camera interface, the "ISP" image processor,
> the DSP clock, and the "fanout" clocks, which allow to put clock signals
> on external pins.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


