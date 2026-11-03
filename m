Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717144;
	b=sS02t/iHHmlOLOEuS5i9XuyW5KR7lIs94wgho3o1TrqWlNLcOc3RarGZBtRwxb95hLBT
	 Mr8Gb7EhZyNA/gopCjPiNXFhQ5+A15Ve92mEMzndbeUrpsp7Bp1z33O+7iZHtDsvpsq+v
	 En4LbcZbwDK+yc3P+PuP9n2qBLX6IHIe6X3KW1GTbetvyadl4qrxxaN7Vh3dLQYwOsO/r
	 5mHcvgezyj6XmzDlDcXTiEx5EeIlRSvBNvKm42UbN/7MKadmf2iX1mH2kfifCgSIAyLYC
	 JzOAGrtQneLmiP/1Yyk5kAhkzc8WfD0yQAc6ceq/Mm0ARFTkMawaUWk0rdvUNkz06/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
	b=fuQJOx0b5mnB6IDSXIwu0oTFmmsLo/4zWgudOTfwiq9xZtGIF3aen9HdiosKMdfn3bXu
	 pKufSSV2ioo24BX1lX8UackzF9wvMxFXxJ0HFHEY/lC+4UiRC/Ry6Rmus7O7ypXSQVk2y
	 USiZf5cpnXtgK2QkoGm6IBG/7/zI8tH1uKE4wT14zlTZEAAL2S1sVVKA40uwVALVgTOl5
	 xyub5PwbqYHDlW4r0y9goaeFhrj4bxBkxaIK5ZeZauiYyD3FE3mir38ThUEXIw5DgNGmq
	 zMRAkXCYf9wuAZcpNcFAHbLk/8T1D3qdIZrKGO/lIoii9HHqn9CHsReeY9hqStm3PVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nrh9kDmz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866DF606A339
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 14:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 866DF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nrh9kDmz
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b2d149b483so18223947b3.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 06:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717142; cv=none;
        d=google.com; s=arc-20260327;
        b=MXNaDyfzsu2rAiFOj25uBmZJS1GdsEIZRJb2O6sa4Kx9zEqYMCxd4i9o+doj/tZEeF
         ba1uH6F0QJ7xu7VMHeSipOlT3KvkUV9den4esLi4oSDjv4T++5jzdb8HeLETuJPeIs7h
         0w145/gCHTg5oQ2oOl8xvqGUFfakJrVnwK3BFkiPpD53yRqFFWUOnB9N7WL8OydCKa25
         PJ1SwA2coEXO1TRsNEot8VjPb4VoXHUSl8kmVeRiuVnwVNEdB9ukebyWwVlCdGW8jz0L
         7QN8qyE1UIt/akRZyqydN4V/XoXfsd5rQ4J4ATDGTr4N1/E763Ee+fkO18tM3iK1Zj96
         Idjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
        fh=wJ6hKJYVtZSOlgBG33ys/pTZfjQvqdAg/NbEYHP7N7k=;
        b=V6A1lp7MC3rlE8yCkIeYxPHlA1TGd0+c5Ro12Kr2g3JIP1QPFlciw8iSTcPQDbrtJH
         fUt0fACka9C3V99FfTgsiqpbii2Ip+JMjMgI10nAx2P0jWR/bhgVE5P9cGG2nbRARIy9
         vUSjbxDiy2ErDSQkS0GzRxW/1Fuu/ZFNvJJbbuXMu0IW4lpDH6Nhdc9gcdnKvdmiNUVT
         XEXb5Sle5b+fg63VVCMz8K5eI15wDy6zkN/AfiPdSStmGMugJvgCBgB+t2AclKmIdlZm
         awCXX4U5Hoxg1LzxFw9SwD0SE6Hj2+0dj7AALUhtVLzlHY6eqtcvdroO/qbjAuAJWfCg
         EQDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717142; x=1794321942; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
        b=Nrh9kDmz38K6f+RKwRJwjYKrChkEGXA6c5zYEVthkxWsWbYEMXltL6qMPUueiooeg2
         4/35M+TygZSgAYcDLskph2zgt+sT2q8yweag4/h7Tnv7R0ml+TAvvQy6uAkDXeEFfdNA
         0ZXmZI76wokxw+vAzc6ZPi04iPzsQT4rvgiVYzQszdQQOibb5QRxizf1JoklNPWe4Ord
         fAbKaImmJzUWE02SgjfDzIzptGO1jKFdz+4PhYksnhAD4ABBgrCOMi6Kt2Ph4uo7H5JW
         g6xgVyGoRHPaq9tDoCx4ncxemcv//yMlDLwKxdemxr/FpUqZOriuoiD1DKViyyCtrAKn
         JczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717142; x=1794321942;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
        b=CMF+Q5YjjNP/OTaX+CEU7qI2jNnJiMx6iWuzYAaRE6W9YiLK2biWm62EpNu1DX27Tg
         O73qhLaVr8GMHNsEH7bVSDxUeSnO3LefaS2eFUmKz2sCHlmp4H2RNaQSoG0CuumhWGll
         r0pDhTzLVjjbyw7EkC3Ez0sRqkv8lwB1YZ9xwP828/Iau6TtTxgypoMBeJW9ogwCWRyq
         ExX0czIdqU9f/ex5oq/3/Zr3sByeWDOKG0PCYfgpzfVpUipJjrvDeztgQBTXm/+QqxMa
         LXYY55w7oCt7QoIz2BUsJDiFuD95wTWncgzH4Xs5i5PXlTnFcdxIg/2GD75rj009Zdgi
         8rcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYs3NEICIIabknzH1w4y5Tb93uxbtbdW0N0BwCB95Ath1wmypTo30r+xylM/L0sUUQDSIsOz3xosiJCg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/bWBVx3rzqh5lDuniIvKo0Rz33Y2xnNa6wClP2Xt1+7ZHZN1QP
	Uc/wKeDXbMb5966ocZlqfi0x9yoSu56e+cj20Qo+LDC6qTos+Pu7dchCfgX3f3SS3Kx55fYgVeO
	kZmPvwuVMcGpZKcEjl7BP/AT9cLwF+w==
X-Gm-Gg: AYBFou1yRcySNlz07OAIa6oSs+bpa8rxwp7nEXci13p3E2G6WFw2R+BOwa9KZmFF0vx
	J9GTD2F36HgqWZz+pUVi4VQPAGIv5Qu4OsZxrNce50sb/7FHAK0cg+MySxtTSwhdKaZE0Zlxtgh
	7md4hgzqyQHyFfOi9U12O16PlmpQopjG5pkXVfW7dDS1GJn4uvMWqvBi/JKV1hcI2kG2csQfNB7
	aCtLS0WcZjVdKkxI6g22e09rD4v1AWBvPI3MtMw0S233qrCBp6xVOKIUMuAVceodXqh8Y9d+Jno
	wsadxiuX452Jo6rMeuobLNF+cnFjyEi6o2wjoo1SY9j+9+tUALjwJ1AKDcvYaZi7SZbgZLqlB9H
	/ECKAM5oIOBxNt52Cv6HMTfnD+XK07Y9NWu7waTKITREN2qB9mgUKHvr58OyUucgbVtgO75KFNz
	blrpKSSHIs4AKc9es=
X-Received: by 2002:a05:690e:1699:b0:67b:e91f:1eb4 with SMTP id
 956f58d0204a3-67be91f204dmr59967d50.105.1793717142405; Tue, 03 Nov 2026
 06:45:42 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com> <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
In-Reply-To: <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Tue, 3 Nov 2026 08:45:31 -0600
X-Gm-Features: AclHuK8t5ej_tgD9GJGBIoXXh4hckeei19bttMW9q0EtGop8alsm0H9-n1doCqE
Message-ID: <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 11/3/26 11:49, Andre Przywara wrote:
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks for the review, Andre.

> P.S. Since you have a device and have been looking at this: can you
> check the CPU speed bin selection? I think it's quite wrong for the
> A133.
[...]
> I would be grateful if you could dig into this and come up with OPP
> updates. Many thanks!

Yes, I will look into the speed bins and the A133 OPPs. I'll compare the
BSP's bin detection with what is in mainline, test on the K5C, and send
the result as a separate series.

Thanks,
Rajan
