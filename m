Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A501D61A3
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 00:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398202; cv=none; b=g/Vc7OkRgc/77JuYlCSk8itIPb0qC5ml9dYlW1tA7A580E1JXML96F+76qOzFgv3tLr+wsgv+vpiGQpTw7S5+whjciebpQa/Z0BCVUFpPeIugTDDBiI3532H/HgYq3OTIlueohCTvkW1GI9lr/4rMSxm6l2inUIMvXyxxml7xP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398202; c=relaxed/simple;
	bh=y6+6ift8pFETJSyRES9gpCeUsUR281Y0rbI8CYXXvQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UaOchSQagk4qLlGmzMQaaUKDS4J253UYSWU/1HqXOFzXAzAHGmWvDFx13dVyn5EP63BeeK5Wm5m1z7rwTAVadx5vKB76Srit8ui872HJT349DENr1E90erR6XfwZ0QHu4gETfNsHKK9EMBLTw4xuCtPi8Bubzh9uKlgWu34u4CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kj3WWWEI; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kj3WWWEI"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cd71fb9f06so108668385a.2
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 17:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398200; x=1775003000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqM38fZ/Ssz+tyho4othW8DbZuAzZOYo70QaO7E9QSE=;
        b=Kj3WWWEI6NPsiZnvV10tOCSzRI4zMAGRVD9qSVe8DqLTL82wTv4j4WowClJzRAJfCk
         X7WbG/p5cGaEZ5dJgrVc6Vfcf0I3Dg17LeG12+4FI8Huc28cvgwSJUtWCC8ccLFPPFI6
         ZkPUE1c/BdmS5jV1arzsoOfMhP258V2UFfyFypjOdqBF8U6MMSJM540Oyuu4T2Pa7vVp
         5kCVhbnob2AaMTCf0rIAJf1tN0Naqahkxjyu66yJ8p5rd0q030Dk5DsOg+EoSKdEEoYa
         kg/2rP57IdEGEpD3MSRWF0kltbDaiTz6hOZTORzYZvdjCsoy52Yk1uSZOfJa0n0Kogl6
         6esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398200; x=1775003000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kqM38fZ/Ssz+tyho4othW8DbZuAzZOYo70QaO7E9QSE=;
        b=gwkfaX7RBXsDHxWB7DuTpOxV6s57RvjacP3S2VDUqfV0puCDGZlB8S5V53cayE2/i/
         ETnbULxmBJAZCnogX+xoN2Rzerg7xqXreWEL1jIw/jNy5A85ZvcMyQf7X/EHAWzd5UcH
         IKl1/Am9LuZpjKDE/d/gamIHn8NtYifTIDWxRTI+3k7tnkaPVJojSZgQKI5vt9hGANLr
         tQHjsf6jcg5ploPK5+FDHYxXfgWHucqgPcQFsMc5/lawesVGAv9MRju49AI9tCY6fEkB
         orLUrn6r6grzwTNF3HQw4Bp+y97Kmt8Ayk9NoUOB2IsfHgNsLS0C0Wq25bvSQzh5D1f4
         M/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf27jGYGjxGkAPmnoaqSNTdHT/LvHADUR425ScmkBfyVdl1tSEiaz2fXV5Em/R8Er0NC1/tqK0c0S1Bg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4wOKXaTaOBvAh1zS51iaugzkFni31EChfS+FUj2bjpdqnbRK9
	l5X7IZW0Sg2agVPzfnTyQX9xle2GJaacGAaMkiDj1TmbqhtkrybYZcES
X-Gm-Gg: ATEYQzxMVzuwk22OnHEJowvlUtgYi8o72Equu3KZMVR7n2MOIez6D7ulPAc7MzDvD/y
	VLZ5+oVyG+qhXVea8DG+aAHqUnZVfE6RAFg4jSicbA6H7hjqSlmWcE4uNCAdDJ9dMzQmjjiKzQ8
	0P9rWhdy4zzlWtPkCThIkRKyUZqjcXREZ9kmM2jR6HC/9qLGouKKuTblPI60y8lrmj57CevkakY
	GoFRcJLBXY2HqTA1QBEu2wfG3WCRSger9ZT+EpID/Lvihfp5ALz0kXhJC+MefATfkWU8f3xKCSn
	ahcB9z5ORdlIPj1APjSqhFBALZbBnF4VcsrhbB0TN6NZ2fnTwg67d8Pc3n/1eONotJ+A3WsiC15
	BAobWmdVnDpn6rLf+BERFRLN6loxhK8hP02s+1V6OslR8VaM6KOvvJt0j6KVKAsI9b/RlTSVCLS
	POlsO2XyNrWBxsAkn8ibJfwW3VuUlAljljZQSstr7Lihfx7UyuohIMAyrvpZrtFvkSdI7KFLtP/
	ehYnnqHXgziDw==
X-Received: by 2002:a05:620a:2893:b0:8ca:105a:298e with SMTP id af79cd13be357-8d0010753cfmr213579685a.63.1774398200388;
        Tue, 24 Mar 2026 17:23:20 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8536ba60sm128830856d6.44.2026.03.24.17.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:23:20 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: sram: sunxi-sram: Add H616 SRAM regions
Date: Wed, 25 Mar 2026 01:23:17 +0100
Message-ID: <3400822.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20260324164357.1607247-3-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:50 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> The Allwinner H616 has two switchable peripheral SRAM regions:
>=20
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
>=20
>   The mux value for this region is different from previous generations.
>=20
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
>=20
>   The mux value for this region is the same as on the A64 and H6.
>=20
> Add compatible strings for both of them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


