Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A765528FFF9
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 18:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519990; cv=none; b=RPITnsK4I91H9r92tOo3Fh8ceEp3Q721QXdl7qoDOhMSTrew7MiF7o8rfAjpPAtCd799NITp61NRb4OXSYDfIn8Wv84SkH+4a4S9CD27YX3tB7I/mhDy17SUQAPwEhX4k3KJ44ZV0KkN+jqRYXvSL64Q290KlxAd1D5bbIoPnOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519990; c=relaxed/simple;
	bh=jC52bw6t16raUsES7KwHGPTQILUfPWGdxnKguMyCdY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o7q3s2jhR3FxOlEIYfJagIhhR2jF00A4uJaQQ5yofODWon2FQIaEo6nyOHWIGsncWoA/TrzlR+dSj0s5hbKMxqGNeebUuhn6MZ43dYHeZCilJFtmyhF85B5XfSz3oaogDsGNSn+GDUmGrkixNUQKbEuu/6rB/tFWz23/pIVHvcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJlogb2f; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJlogb2f"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so8785555e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 11:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519987; x=1746124787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC52bw6t16raUsES7KwHGPTQILUfPWGdxnKguMyCdY8=;
        b=NJlogb2f97YIct0KnBZkRN/kkNX5AGRdm5E0qAFTslzpuy4cpDaKJ/9x2JKw0SnR8E
         5T41xeFOIg6U/vVOk4xCYMfvLHbnWH+AsjqlYaBR1Oqmbo9MQgpSvIkzJJz2rBYYA6/q
         w4f8tpnVKHSiBRZ44/bRZLcDI22zzS7XwtRF/p3QYpu4q2IBc6c6TmVMCGlExIaGovWg
         8jQUi7T2mgIQ4pzGnSRbK6auaP85msF1+vYCmI8MOgg+4CP6lhB4si0SXIkC/ZtrZTpe
         fZwo9zXqz03As+hbQhql4/uTzncpOvDXnksWP75tnGlroDmgOinFHRU1BZXWhNTDvBm9
         yi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519987; x=1746124787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jC52bw6t16raUsES7KwHGPTQILUfPWGdxnKguMyCdY8=;
        b=Dq1ynrkX9JFqKIkrmpuhfCH4v1SwXLX5H55pFWjKLdpv/DEN9+WN1E2aOguUhA3cyt
         5vNIxVshwXQJGrO2UMPCGNQLGVpKJhxnFSNgfxXs9YJfBYwo5c7u6jeTvQFU2R3UbHSs
         Oz5Vpg+U75b/kEHLINWRt/2y9OCxliwoLnMxPVbXB0sgaVAfiPhrERj1ZFizJP/+ibIv
         ApSYnqvOwcfW+wCePaPUrPhqOx5+zECB59M9XlZFG/g3frr62/uzrMKtxrl5k1YeTxea
         539HxPV6natMDTgicRyVuMxrn9hFs2xnDLwmUGTCq/QkZ0N6zDcCgauR9iR9N3Q61QfV
         lhRw==
X-Forwarded-Encrypted: i=1; AJvYcCUIOhyjoM8u4Am1FT9E4CYQe5pj3zRtXGBT7QSo8/Jv3/zl86FENi7nQC0ZqLl13eHICnpY6Y8x7P5g6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+wDxE/lKF/ROKC4r6futeDmKfU1mLqDQinrLkiD6qv1C/lI2b
	cLphbqh3VWrEhjgt8Vr+lqU95tNFEDpRpF8SczWcYoFN4mFsQLdb
X-Gm-Gg: ASbGncutFDH5IgO+aMj+ehpCbdIVA+5RfxmvPvREIYKRIB+zomBjWxShBpNRBDiumF7
	Ntbs2W4m7kqr/0ZyQ6kbODGF6fZ+vUo8HnLN4QWPxoVnfKUuz5VShwsu9HnGqiMbk6uAbe4d6oA
	repbmMPMplBXlBrBzMhClKbw5v6b855oINPIQjV9MZUYcOBxxWvFSvH36Ow/JtLBHeJIif+eOm9
	GiHPzdWuSanvviz8H0oqyBWqMDH//wSjOTkD/oaWloMros+aCKrJDbmu+T5zD2wr6t6zsiw2m3P
	w61raWGjfIq8DA0n6K7q1MP2ROPlE9AHBXk0Hv4xWxk+epH3jHmAP0X4PjWFKRUnKNefv1A6PdW
	tSfp8SjPQXjxxQK4Q
X-Google-Smtp-Source: AGHT+IHMwFWIrBhjk8UxuLOzeFScC4TQFWpL2+Mff47w2LSyphzAh89JVRhQX3G0jfdSCa1w437IRg==
X-Received: by 2002:a05:600c:c8f:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-440a30e739amr5269115e9.1.1745519986788;
        Thu, 24 Apr 2025 11:39:46 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c82fsm34693f8f.85.2025.04.24.11.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:39:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Corentin Labbe <clabbe.montjoie@gmail.com>, Yixun Lan <dlan@gentoo.org>,
 Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [RFC PATCH net-next] net: stmmac: sun8i: drop unneeded default syscon
 value
Date: Thu, 24 Apr 2025 20:39:44 +0200
Message-ID: <4974609.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20250423095222.1517507-1-andre.przywara@arm.com>
References: <20250423095222.1517507-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 23. april 2025 ob 11:52:22 Srednjeevropski poletni =C4=8Das je A=
ndre Przywara napisal(a):
> For some odd reason we are very picky about the value of the EMAC clock
> register from the syscon block, insisting on a certain reset value and
> only doing read-modify-write operations on that register, even though we
> pretty much know the register layout.
> This already led to a basically redundant variant entry for the H6, which
> only differs by that value. We will have the same situation with the new
> A523 SoC, which again is compatible to the A64, but has a different syscon
> reset value.
>=20
> Drop any assumptions about that value, and set or clear the bits that we
> want to program, from scratch (starting with a value of 0). For the
> remove() implementation, we just turn on the POWERDOWN bit, and deselect
> the internal PHY, which mimics the existing code.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Thanks for doing that!

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


