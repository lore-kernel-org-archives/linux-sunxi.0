Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53984D0CEE
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Oct 2026 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547463; cv=none; b=Rg35Zba0BuZFm7OG9mj2xo9I9Qv4cvc5IXvNJzndKZ/fnbvupBoiabNBUT2KtAvo4i1TM1bCCWIQuMLOBhKYrLgY56NFMEmlB31tA4+E1IAVXuib7lqKEEa6JB3DoBR9cQS62vIf0drJiMy+GfIROUPIpoiiHuC5LhARnDeKq8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547463; c=relaxed/simple;
	bh=VS1iewjuIDOCqPpPOjWSlz8wenv7HpQ6IMRaOB7c9Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A5gnwZZg8he5q1kTI0UEf+g3kAl/QUFnb09lhOHjbysUK2ZnFMFse7AGMuAjnlljIbxKMUeNU67uaVZ7/RR2q1/F3mO+rYcZgwMQyYhPSQqfedLYxtyZubj4Lzt+7tVpWpRSENJjHVkROUFfJGKIkG4W7fIxCBXCPOcpq0QEKcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXo1J3c5; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXo1J3c5"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1419d3416ceso12258317c88.0
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Oct 2026 05:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547458; x=1792152258; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIUm2Jd05pWj/56E5mR2bmAp1xCvbRS4ZzRWtj1/pK4=;
        b=mXo1J3c5wXdn2TlbXs/VvBDHWbagw/DHiqE41O0VqMpC2znXqbgcWIvQG3Ggjy9hlX
         sHZpR/2FZ3B8ZZ/3vND1fIesgrFrVVGihiNYwiso2nQ16ffPGPSnu3OJRCt4Q1Noaj5S
         Nt3gb6x9/oS5Da0psviCsOf3H0RRfTv6KViA18BX/2O/JxD9M8mNoST/77VFfzUEQ+KK
         WtvI2w2azl/keDZkmwP6s7koU5XFMGyGmp0ZJ50P7n0TXTwzvkpNg5hyZTE8eIuOK0IB
         Z5lsZZ+S2Z2n9t0MkRIAUMA3AVm/jlMG8vBdHq+DnMgBXIbZc864ej9jsrB+B86GhAvs
         tfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547458; x=1792152258;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIUm2Jd05pWj/56E5mR2bmAp1xCvbRS4ZzRWtj1/pK4=;
        b=P0VRtCCT3x8a9EXqWnBNhutOb+rdnzUWw9fybUoOrBlAnrxHnhdO/2XnGkH8EyRwRR
         XhB+IgiM/Tqcl+Pp3LVnM2YkijaGCEJHNrntD8r1WZD/XOqKZd5i8v/sD/rooJIckOew
         7Re1WVxuUu+QdL3P8TOq4UeSIusc9qYPw8I1xAgtDU+clY4N6gMZGBsWV3VI938THlzL
         /ItZ8mqZaokxeipi3VW5qMQD0URv1slhwaKPxbVElOMlvhoeoT1VBC6bXxREJPBOOrhY
         guff3SsmChp2PxCAUFgB2xAs+Ooeb1+Rg8pQ4IYtAugWkVVy14uaUhMLqZbh/x1eEHE7
         nw3A==
X-Forwarded-Encrypted: i=1; AKwUvBxGQo+G0W4qrkP4eBIRYOBN05tyCveaPMB3uSubaMEoutqb0P5CZRVaMBktJylRfm62PQ3sbiNHeMhJow==@lists.linux.dev
X-Gm-Message-State: AFuF++mMbePUMFma/L1wmulGHlbfpn6ZhK3pfVi56fu3Y3PNeOh+M627
	R+ZHcNtvX8Qpcs9xygd21DjxZN5azLkNce8KqlNx4EvqqDFXEZfKtl5m
X-Gm-Gg: AYBFou0p8lBSciotuWL8cWciHCssjlYqraVBDVg7U3vt9MkHfdSFuAG1uMxZZuJ/dsZ
	PGR0Nb2I7IiyZ3JIxsNZapksmuP8EzOpBlaT/KFO4aA0r/R9lkirqi8BsZI4wD2ZvjKmP36nTuy
	zmcrNGargXhFX1d7Ps42o+RRlD5FiQiJOrfsK0XNgm8RPt+B7KuTOw5onbK6xd2YdDV/eTiYYHs
	9sCUzvCysR6SoaBq5KLY5gRypAXq27psCf4HczEetczyfAGcEQmhQMC+hIyfB7+Zxey8ZzRyfqe
	fwkRScjYV86LZ3Ek98W0mEq237P1Ab2dlpWdA6luNAKN9NhJMPD+kAHVVj52K3dP+ntRgHark/e
	jTvELmosqzszcOFrKmpm08HVdcZQtjaBobYfy5LVakoUHBGOXefYURCiO1gYpYByvbQYJtNDY3P
	uKOpR/GbmNluHLDACLOzgpSJxmQQ3yL+spDJfS/DekFAhyHQzcIzS750ZoelQ6G4GCG0xI40GoF
	Nf4W+EJ/5wI2YzZKDmwcGPdXn//sMHuV/Bci2liowUd/ZZKoKlyQuwnx2qllSatmMTyg4l1H2Hg
	QwpMFBg=
X-Received: by 2002:a05:7023:908:b0:143:8860:afa1 with SMTP id a92af1059eb24-16a63386a1emr2265270c88.46.1791547457414;
        Fri, 09 Oct 2026 05:04:17 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm7294837c88.5.2026.10.09.05.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:04:16 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	u-boot@lists.u-boot-project.org,
	linux-sunxi@lists.linux.dev,
	Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 0/9] sunxi: Add support for A733 SoC
Date: Fri,  9 Oct 2026 09:03:55 -0300
Message-ID: <20261009120356.194364-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113-01-a733-soc-support-v3-0-f19dcd098f60@gentoo.org>
References: <20260113-01-a733-soc-support-v3-0-f19dcd098f60@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Yixun, Andre,

I'm porting U-Boot to the Radxa Cubie A7Z (A733, 1 GiB LPDDR4) and have
a board series (DTS, defconfig, MAINTAINERS, doc) on top of your A733
work. Before posting it I'd like to settle the base and the boot flow.

With A733/next (165f07a69706), TF-A A733 (f4c0b0dba78a) and sunxi-tools
PR #223, the SPL/FIT flow works here: boot0 trains DRAM, drops into FEL
on "2" over UART, and the SPL loads BL31 and U-Boot. I had to clamp the
SPL's fixed 2 GiB to the board's 1 GiB, and BL31 was linked for DRAM at
0x48000000, which the vendor kernel needed.

Andre's suggestion from January works too: load BL31 and U-Boot proper
directly over FEL, no FIT. I used BL31 at 0x48000000 and U-Boot at
0x4a000000, then reset64 into BL31. The RMR request gets the core to
AArch64 EL3 without an SPL, and the same BL31 and U-Boot binaries reach
the prompt.

What's missing there is the RAM size. I couldn't find a usable size
from boot0 in SRAM after entering FEL. Without it U-Boot falls back to
get_ram_size(), whose probe range covers BL31 and goes past the 1 GiB,
so I didn't let it run. I added a "reset64-dram" command to sunxi-tools
on top of #223: the thunk writes the usual SPL header with dram_size at
0x47000 once FEL has handed over, right before the RMR request. U-Boot
reads it as is. The A7Z U-Boot came up that way with 1 GiB from the
header and a working SD card.

The default SRAM BL31 layout clashes with that header. BL31 at 0x62000
has its .bss at 0x46000-0x48400 and clears it at startup, header
included, in the SPL flow as well. I ran that layout on October 7 and
got 1 GiB at the prompt, but didn't trace where the size came from.

Questions:

1. Which base should the A7Z series go on: A733/next, boot-2026.04 or
   your next revision? The A7A defconfig differs between them (FIT at
   0x4d000000 vs 0x48200000). Would SPL_LOAD_FIT_ADDRESS and
   SPL_RAM_DEVICE fit better as SoC defaults?

2. Andre, is direct FEL with an explicit size header something you'd
   take as a documented boot path, or do you prefer SPL/FIT?

3. For the size handoff, would you rather keep the header out of the
   BL31 SRAM range, or use another interface? I'd also like to replace
   the SPL's fixed 2 GiB without a board-specific hack.

Everything ran from RAM on a single board. Linux, secondary CPUs and
UHS are untested with these binaries. If nobody else is on an A7Z port,
I'll send the board series and the sunxi-tools change separately once
we agree on the approach.

Thanks,
Vinicius
