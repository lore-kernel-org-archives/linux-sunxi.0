Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D7A7260B
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973542; cv=none; b=SazRxHKJByyytdyKq8R8qYTYm8aJgSUeYE94wKUf4wwxNIb2D0Lm/SEKSQS/n7TxIW+c/TZWIx+pa2/VVXgwvfVg1ZukpSbtmPX2Ik6kpsO7LpauHWHneRtXscAoUzGz/96/ceFfaeTKNiOaxIx+sB1qw++td0kRDPIVt1iaeu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973542; c=relaxed/simple;
	bh=BQZAzTg1V0/v9S4chDcvdz+MPQEzBV0e1QEKSP5JqTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TJJDmMx45iyMsy+ThHd+CPxY01ig9xNzff0ngItmVYMnhai0/gx24ALhQU+wxv587ujxHxDE3XVzRymKgj0RTA6tKW1kZux8/0oBvqw1SriGKqIldR5JAKhBa2Dge2SZkRFhYMKSFQetHIoK1hN3C1mDTbpOEXB5QGx7uu0zuhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4ZjHkoZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4ZjHkoZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47114a40161so1166295e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760973538; x=1761578338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE/zXH7oj8luuojug2mx0yUjKnI3txoF+d9+NmJbjas=;
        b=m4ZjHkoZFr7gXKJdmypH41SFR0oYEQ9XT3uMXudoqN5DGeAdqAqnN0929h6lxexqGt
         ZPHM42vzLpSEjb075EXFgXu1iEiEqpBD0EB27bCozol+qsAntRLudHl2HCJ3MRmU/t62
         6QTM4v34e1tMyR3KVGYd1eXhCHu9dAIFIgrtRe9gCxC6RCxOKWCwpkdpHr5DrA2Yku/L
         Qx6IohOzNISU9qXlakWCmde9KZjKu8IL5rAIlUO1sh8pIli4C2CbQWmFeeItwli8xNtC
         lS3l8/OxhmbYbivGI7c32fHNbBrPJmtFTvDIpEXZARQOdpfjIjbMzBGxXDy4UYIVPp59
         IgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973538; x=1761578338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gE/zXH7oj8luuojug2mx0yUjKnI3txoF+d9+NmJbjas=;
        b=Hyjs3NK5rA4/og2K7J7CL+U0Qs8fB8hZMXdmE7bVQWr27me0A43tb9fDK/PobNPi6p
         6eeST4aZaeQFhj70H/uPeYOAVMUrzDKO5DgTF8ZZ+7xXHiMAY9ufvNKfU/nlo+tHoWVQ
         Xmp93QSzaZdLEQ9l/cfWoKI7Q5AWHB2WD8L7RyQWA4Lnwychy91pLg4fwdV3t4D4o+Lh
         t9L64hq69TneAnhh+NsSIq14z/EjNw8+RIui1/scFvZM6ArB8yDTcD0iMM7ijAkrREYc
         EnBt/6WKC8dklFXxKPUIWC6AGnKZ3pN93za2EGc6IKIajs/NqxWhcvKY0XHV5fGdQ8u8
         4fXA==
X-Forwarded-Encrypted: i=1; AJvYcCUFjKACx3Aav6pcA5pXI25vm6edlx87BV1slPxBol9RGGKnoaGVl1SeClE4T53/5vrdcIksZnAcg/Os3A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu4QeiergotYOe4iZMJqu93eKO9MGxRQ2LrJJaY5sw4Fsn2Y43
	aS+fte3To4tsFJsH0GR3e+At8DhOtZaSiHIwgzmyWa+PcqMOgCLqlh2YicawvA==
X-Gm-Gg: ASbGncsF7T9X74Ab6PVXzGF7IQRPUNuDizeYQKQhk3fRYTb8CEuB582jo2owUsS2nf9
	jyCNUezkHie6vWs8x99WBxGQu7/ziP3XwLk0nIUCoaedBlsjnIioTMCXRBbNKBX1uqKNI67R0Dy
	yD1MBfVfDd/hhLOE5aiha3BaIyViyvdZ+rNIZvuZKnWOfEEJWL2Rg0JCQX5TfXVblBuzkhMHum2
	GSGuxAOkhH+oDMbWYbOjzueNxrlYKSKqoDEMIEa7HhH4KX7hHFMu+uZGgfQp/j2VPPmUDi49wDW
	5EWbJ1ZRX0fB/VWsDW/q0A8lwPphDOeGsRtRt0dVshHC+QoRppI2EQvPOJrvy0INNZHA2J8Mpl7
	YNv5G5lAvaMQD6bEv5Cuox9+kz9Rju5ykSmSEO2pBJBmGs7wNBaOfMZvAWo85MtvavTvYWdR5Mi
	in6VD7/JZln1rNdYm+n6dUkuVLMFjOQ6M9NnAt2HdnkYH9aBRYNwuwrhh3ME2SFdPmSfgv
X-Google-Smtp-Source: AGHT+IH5qaGiohHu1jrL8Sfsr2c1k7P4tZGm1c6prBnxmOD+RBX2uP8H/wW7wKCjofz+j3EUhUgieA==
X-Received: by 2002:a05:600c:64cf:b0:471:12ed:f698 with SMTP id 5b1f17b1804b1-4711786c793mr106360845e9.8.1760973538344;
        Mon, 20 Oct 2025 08:18:58 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715520d753sm150384595e9.13.2025.10.20.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:18:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] .mailmap: update email address for Chen-Yu Tsai
Date: Mon, 20 Oct 2025 17:18:57 +0200
Message-ID: <5047219.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20251020145527.2702250-1-wens@kernel.org>
References: <20251020145527.2702250-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 16:55:27 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The email forwarder I'm using has run into severe problems with Gmail
> lately. Switch over to my kernel.org address.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .mailmap | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/.mailmap b/.mailmap
> index f1b93d168e90..e08dfd3a5263 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -36,6 +36,7 @@ Bin Meng <bmeng.cn@gmail.com> <bin.meng@windriver.com>
>  Boris Brezillon <bbrezillon@kernel.org> <boris.brezillon@bootlin.com>
>  Boris Brezillon <bbrezillon@kernel.org> <boris.brezillon@free-electrons.=
com>
>  Casey Connolly <casey.connolly@linaro.org> <caleb.connolly@linaro.org>
> +Chen-Yu Tsai <wens@kernel.org> <wens@csie.org>
>  Christian Kohn <chris.kohn@amd.com> <christian.kohn@xilinx.com>
>  Christopher Obbard <christopher.obbard@linaro.org> <chris.obbard@collabo=
ra.com>
>  Dirk Behme <dirk.behme@googlemail.com>
>=20




