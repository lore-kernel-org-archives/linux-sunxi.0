Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795000395;
	b=EdJ0RJgGbUHOFIdto2XzcYCuRV8qQe2n3zmYs8vc/KIg7sE7nCHbdZ6FI+DRhKS6KdCK
	 9WJKBBtm2Q1h1S5Pa3+PaFKSOQrA1aj4HVU3TL6VuoFJER423mkXyEpk1vujM+FY4Ep9o
	 ABVdHxdMti0NQ1J2nAsg9QyqHO2qCcv/fSKpYLV/3fSUjGQuhHIe//z8p2aR3f+6GA/6Q
	 iniDtjzvrAuXabnloWx1gTVbb7qmFXu3XhaZE+NydKU37ArqZ/w98vlfMgEQjz0BdLzFI
	 ZRfWSUNXgAihfzj3XIFIOubvDtTDiggDJf8sEf9yqlb5wcqk/JJbX4Qu6fhxCY21nwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
	b=AHxdsa+vvnLleDzaEYzsi9c2BhpAKy2B1UN0N5zwZdNRwPgHZqv5jx8qUieZfJFYRRKF
	 QDtVei/SDeZ9xTBONm9kXMNi/4t4fSdrujiQ3GUZGe80ldz7Nt164OeILIwaDZ3rcwi9c
	 +edsblgv846AFz7TPuV8tQ9wpInBkKqgQ7OPgKM9mpjQXfVkeVV4Z1aBdkJIh+IUtDRn9
	 D3C8RAww1P8B/Tu16CQQkRR8CP4xkiTxgqfVaPKRRfD8J9+jod0h1yChmzNDaSsLkOQOY
	 RHgJjDJxaVK9RBP3H2xmUVGzoVZ8zh4UcKz9OrfOqnarFBu/OhXdAsWzc9CFtIVf6xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xf9a/JpG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A05606A31C
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 11:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xf9a/JpG
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso836430d50.0
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 03:13:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795000394; cv=none;
        d=google.com; s=arc-20260327;
        b=AjdBjQ7o+eLvv68jjFZIq8aRfr6R/zQVesKk732KLxfd/yJauv3yJ5K25YvNyOB6+F
         lmNHk+w8WMili8MS7OXr8m9L5RomOnwnlj3k+1nmvJ96bfZjS5Q7X5fBZYVH5gcrDUXZ
         +Wte5CiTAHUkGQOEkkpASF0zqHDNUT3yzFglB68FWMQfHcId3kP5pL5hay9evxVqSz5H
         RLyvUhz4vCwyZTEJmnPFpLd8IwaKxA1vLyD7LVimYh5AQ9ccG71xGQphaKP75DagljGk
         BKbnexdgqh9cpcdLk4OuJi2MCgpo5YwUT4TEi3NJlkki//bqk/Rl2O4YcZktUEFWhpfx
         /61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
        fh=CqZ6wSoeCTGJl76wxfIHgd7iG56hXA3MDEymsUAmS4w=;
        b=ny8rKR8a/i3L2mLM28fpxxKETMIthyUgSuCwMGPsrQJTU4AnSR3jUq6kh/MMwfsVlo
         RGiK6aE7HMivMUhTn9I7mcFoK05Ml7H9wIViXph7NHU/ChigqSgrdNYg7DjTpYa2FV82
         dcs2Esyx/PeOS96MW0wbany3ns87ezHMpdiCpR85y5vvgnNMAcr8n5RWTrBEcbcM819u
         IoA+8OlwskmPAWI5daE8TY9YBPhECv7Y8hS259wD0zlzwtOsG7LthnA+pdEc+x4Nisf3
         PGOIVXLpD+p+HN++KJvv7BTV+SGbuUXpt7WUUANe05LhrdQDo9A0PX7TDEFbjinQi979
         juxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795000394; x=1795605194; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
        b=Xf9a/JpGBWrljoNdDErT6lgzui8AUGbibrRFW1+b8779VEBnfg4i/Yppkx4V5U3YnL
         zX1w1iwr47VZXANuJo799R/lrGwVNJtI36dN27siAF+eVhI9vsm49ENhcNY4G68uloVw
         szeCNoOHw2qp70BF6QgU+IWseOiY4UGYt6WpVaqdGP3lCw7IfS8TR0qPK+EfA97WHWfe
         jDkgP2udMOiqvV4o+WT6YcEX2EpufaKK6//alqREZ6TTecEm6iCOQsx+3qmRsiHXAGA9
         GkLQ6u6f6ewazd2FBmjIJMVSKBuaJ6rYI1i7ZbtljXvgLK9DKy0gEmFMRZEurQuhuLem
         S86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000394; x=1795605194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
        b=jdPiAquSxqp4Yk57Ll4irkgry9tvfKcDafaOtWqkdQHR4lal3DU2dJ54K9NdM5wWcv
         qNuMrs2OYxLPYKemMoe21LTGNKDqm4voUCoSXyim8lBO2KGRfrD05ya5zcAuA5bbNGwj
         a/1MVk2NUC+746d8nfbxBuFa7e1gxO3Qj3zS0jIxGktGwJt8BnNy6lNQjPiachee1QD3
         dIfAZfGTpTUzh6I3u9BUVVeNuhMzr7/yaty+BgGksziyOywDw4rODyUAqSvScp4VaSXX
         nFn+E0W02RLKrskloJL3bB6uB4yTxZGigCcd5UpHO7tZNM2j6+upoUKwwHZTnKDDSHie
         Vqxg==
X-Forwarded-Encrypted: i=1; AL+hErHFI/XXbDiR8U604gazWfxuUG61N5dm8Qd3T0WsY3S4i5fRRgwYG10mdNAanoA2LjbZ/E9sEfruuL4/OQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z///G+8PktwJT02K7tJ2LWNialaX/mHoqEZkp1wTQXsEBWn36EU
	HqBFe9IxFr7MNAR0oigN/paAVYn+SOPMxTgd/msn/LKvzmskSVZboNuCXhEJQyFgfdtA53Q3Kvy
	ZgzzFJ6DGRXwN7t2UR2B2U6EfIgAX4w==
X-Gm-Gg: AZFdTZfvULZSqTwCd4RdodAygQkAtr6oNVjQarCVT4Dw+HuY0UIFI4RteJquYhm+IXp
	sPdj6vlNE443uEIwq2YwJ9iZQrmTy+nJJTJrJdRB73QL0zS+IGgzqUZppjaRoaZQ5WjQzD/M965
	RA9VJJzW7F1fCbtt2NjMYkxvzCqyAdN1m71cfn80Jz5hQ6Em37koK5Mk2CKIgUNcPk0y9BF074d
	99dtxXe3J+6wKYYkL5RNUL4uTa0N/iEDfUExjnL5ioGecXf1spUb//5jYaTHDlH4pBGcAcc9mz+
	v197EeteIxRra6LE4IdExf1mYySFPOMgkq4v+lqDhGXW8Klss3w/Mx3xS9egmrS2RB2YYCx197H
	ksX/aNRDm/7BvFJw+jZcGiq30w24/UL7CkLsJ35qoO2P/RfzvyXd2kngCXkh6dZoj2DRLPFGWbB
	s1Mommd8pPx29uDVU=
X-Received: by 2002:a05:690c:720a:b0:8b4:fc2d:2fbc with SMTP id
 00721157ae682-8b4fecfa8fdmr6432697b3.17.1795000394419; Wed, 18 Nov 2026
 03:13:14 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
 <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
 <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
 <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com> <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
In-Reply-To: <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Wed, 18 Nov 2026 05:13:03 -0600
X-Gm-Features: AclHuK9n1arnwuviwRTqKqG6GX0B1k9jEh54QwQkpt5LgjUFE7LwWPEIi0qBPfo
Message-ID: <CANxy8yT4E474NpEZPE_6QHh1UJvj7xQEVR4mOxW759y75SBd2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

A gentle ping on this patch. It has Andre's Reviewed-by and still
applies cleanly to sunxi/for-next.
As agreed, the OPP fix comes first: v2 of the A133 speed grade and OPP
series is now on the list [1]. Its thermal tests rely on the 90 C trip
from this patch, so it would be good if this one could go in first.
[1] https://lore.kernel.org/all/20261118-a133-series-v2-0-8bcec9c9aadf@gmai=
l.com/
Thanks,
Rajan

On Tue, Nov 3, 2026 at 9:33=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrote=
:
>
> On Tue, Nov 3, 2026 at 10:47=E2=80=AFPM Rajan Yadav <rajanyadav0307@gmail=
.com> wrote:
> >
> > On Tue, Nov 3, 2026 at 7:07 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> > > Does the downstream BSP have this? It would be nice if we could port
> > > it over. Then you can properly use the power allocator and/or the
> > > schedutil governor.
> >
> > Yes. The BSP (sun50iw10p1.dtsi) has dynamic-power-coefficient =3D <190>
> > on cpu0, and sustainable-power =3D <1200> on the CPU thermal zone.
> >
> > The energy model uses the OPP voltages, and Andre points out that the
> > current OPPs are A100-only and don't fit the A133. So I'd like to fix
> > the OPPs first, and then add the coefficient as a follow-up, tested wit=
h
> > the power allocator on the K5C. Is that okay with you?
>
> That works.
