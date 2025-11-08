Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457E9134AB
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Nov 2025 09:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762595207; cv=none; b=fy9qs4TEzC1E5bF26/WjMW9IQE/KkAWBsfum//LkMotJO7GeUiOzAybqNWuIzsZgA8Yk9siTGVENMi8TYv4UniiQBsZKBjkht6Qvn/XVhbC2bdnv6YCoK/J6tO8ygxAGFWOXn2EQZm59hJjchwfeP4mSbjf/L8DnBVAzoaZIqOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762595207; c=relaxed/simple;
	bh=aOwq143RKroQJvO/hjzbNHkwe922fvcvmxRe5cHZbKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LBPO+vu9yl6/JlxeCGRda9K315J1yv7IlXWtoU1flv/JpeadR2CulNopUvGYNG4IE8qexfvhm35Baebxn6Iz5fABswqX+Q3j0ZsSMrg1uAssShCUsJl1SH2LfKV2x79uFse+sjU7M4XrRg6kRfXfhgrqP47kjSFQMHLx5Ds9z48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWLXsykb; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWLXsykb"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b71397df721so175235766b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Nov 2025 01:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762595203; x=1763200003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSUW/WjMhCO0Veyp/5U9fPi2v4UQHFyEZLh62h16fCE=;
        b=NWLXsykb0wGjlrt0MLrR6xM8P8HFuSL02XUN2HNBe2mA9K7azjmmu//Ccpb8heEpvq
         CS7AGsOAWbYcXUfhFFmJikLEjEzwjZ4rhFfPzQHwX9xOLV8lgoaA2bAx/DfTnb9u0lyY
         5MpUL/f/GeyPYSQHPyHy7lsfSfHosyzVnKGhMpGV5kKS2K1l3U3+Sq0rjKNxKMWb0i2L
         5pSBLH4RoqrzQRWcmfZZlVT5qkoarpoq5nYDY3LMdXd5Pte0FN1kqDXRuNSUV4c5z5Vq
         +sfEvhnmo5XM3CO+WEzaPCTySx4SoyDHzoVyBwBuBfzrxcCVHFqBY+wQqca3bQ1vsw8l
         Z4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762595203; x=1763200003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lSUW/WjMhCO0Veyp/5U9fPi2v4UQHFyEZLh62h16fCE=;
        b=pNtrE0ntzJBJNDs1BU5CFXTURdsNs3+T+c9BAgDHo7HsxYyLmaIzkuKKKR999Yk79n
         9JuvVl1T8zBnhgDu82HzzVy/9s8daNoqx9UAVg+ZgDs0RMml77VxYSR5QFWaT6G8EKy9
         cWz7p6SZDPE9YpmRVdGhFFGlahr6rtoNpjAwEUrgPBkKVcN8Dx4kpA7hljZdk9ZbxqaB
         cRDYV3VdGC4d/Tq2TuOby0yepZRdIv2laoGtO261SZjL8IU66No4orO587bOkZ9O/DXV
         P+U8glDaWlufydHSet21m+a05b/6qDJ16A5KOh7sAoxlrtfT++9kN6ywpXEPC8BcIBzd
         vAlg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ8LXDWpZsA20OOSWYZ8HBfw/Lhm3szD/SSO6UBMGEy1XNdoSUbz5f62DmE6955l2DXhyXlBIyJAVgtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzF5DM7d8ABYDNj/ng11rdfvNKVmLjijIaAXu/6Xh5b3TRIZgV5
	tRD3W4fLLfCdBQv5ynSrlcXtbQ0ib0NKIIYc8qX2oEtrO1jb3VQBA8SZ
X-Gm-Gg: ASbGncs9ZxsCuWtfew/ov/U1qj5Kh3IXOIdVSoIxyHit19oQrlrs6UErAVhqh7FKOxY
	Jzi62s4C80tVolFg6G4KmXyGhAWA89x+VTc4A6IurYgI2CAhLmMXdyi/Z2i7ZEKGutZlfXII5Rp
	2/wQnMXJtU/PCS1FEqv7arqGzaSc4HpKzmF9wD7/w4dLiFCXliUjin/umlGKzEZzD9jxEOv3ZLU
	JeM361ZQmLELw3p2oCQ6a9w53HEBEHJMx9RK51unuwwdmYme3WM68gf4Ij7Lok9OqBpmMplGfkn
	YRiurFmqonFqFeb8BKUzFs2DzeAV+Ri2dOQA9GBOz9CduQJdPqtrNEZMgrl3TqmVdmDv+vSxHti
	1E9XHuaoFLWqt5dk2Wb2SxrkMrEq+dxzsZ2asqEH+7py2rH4Lh8SdRdni1IZo/T7i+TkCQqlFMv
	bynycgwzLHqIj5TdaRbPvbYA==
X-Google-Smtp-Source: AGHT+IEF4CkxscNYi/C2XNylHCh280mub3VhXy2YsQtWnD+IOuCk3xiDthoT6Cd2QfMZg0xUKQ0czw==
X-Received: by 2002:a17:906:6a27:b0:b45:60ad:daf9 with SMTP id a640c23a62f3a-b72e028a602mr227544366b.3.1762595203327;
        Sat, 08 Nov 2025 01:46:43 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72d7996c4csm291514066b.5.2025.11.08.01.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 01:46:42 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Han Gao <gaohan@iscas.ac.cn>,
 Yixun Lan <dlan@gentoo.org>, Drew Fustini <fustini@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Guodong Xu <guodong@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
 Joel Stanley <joel@jms.id.au>, gaohan@iscas.ac.cn
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 0/3] riscv: soc: re-organized allwinner
Date: Sat, 08 Nov 2025 10:46:41 +0100
Message-ID: <4692596.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <cover.1762588494.git.gaohan@iscas.ac.cn>
References: <cover.1762588494.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Dne sobota, 8. november 2025 ob 09:20:22 Srednjeevropski standardni =C4=8Da=
s je gaohan@iscas.ac.cn napisal(a):
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Allwinner currently offers d1(s)/v821/v861/v881 on RISC-V,
> using different IPs.
>=20
> d1(s): Xuantie C906
> v821: Andes A27 + XuanTie E907
> v861/v881: XuanTie C907
>=20
> Han Gao (3):
>   riscv: soc: re-organized allwinner menu
>   riscv: soc: allwinner: d1: use the ARCH_SUNXI_XUANTIE
>   riscv: defconfig: enable SUNXI_XUANTIE and SUNXI_ANDES

This series is incomplete. It introduces ARCH_SUNXI_ANDES symbol but it is
never used.

Additionally, patches are not organized properly. First, you should introdu=
ce
reorganization and only then introduce new features. Also, not a single
patch should break existing functionality for bisectability reasons. First
patch breaks compilation of DT files while second restores that. This must
not happen.

Best regards,
Jernej

>=20
>  arch/riscv/Kconfig.socs                | 22 +++++++++++++++++-----
>  arch/riscv/boot/dts/allwinner/Makefile | 20 ++++++++++----------
>  arch/riscv/configs/defconfig           |  2 ++
>  3 files changed, 29 insertions(+), 15 deletions(-)
>=20
>=20




