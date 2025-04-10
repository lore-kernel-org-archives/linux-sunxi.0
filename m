Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7414720AF78
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 07:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269454; cv=none; b=SHzlGBUvQIKfibB7Shxod7OSvDDRI3oBUO1KBonuuWQr9YKBjpdXoVbBR648mnhuplOdG+HmfpLehBvMuHF3MzGjRbIu2hCAujm2IBiBqDMBUyecV6SWlp4hLHkTU5Qzx84Yh7KOV+LxeJNJcqOIbzYykj5+0jx6gu7Ks2Eytpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269454; c=relaxed/simple;
	bh=vj4dRFeIPg69IJI563j/AOt0mSXQ1SnlTmdMvO+wPSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f76s6ZdDYHW4js2Zq4QkVke6sy9duHywYN0+hip5dYgpvCPlepkonR/wBv17q2on89XlN4lSvN86j3MDXXZTVONCaxOduv54183mzGKlSrs+IBnkNR6NlQGLWui65amMZlEHJrOy3p4fzR99khzGTUeh8gQWf3218zsICX70yY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3oMLH+O; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3oMLH+O"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so3809695e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 00:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744269450; x=1744874250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vj4dRFeIPg69IJI563j/AOt0mSXQ1SnlTmdMvO+wPSM=;
        b=Y3oMLH+OjjpTVkgeB3LzlotmReQYVcwWhp0QhRRHtF2crmc5oVCynwQuEKd37lwyja
         t9DGNyMaA9YPGcW5fDoAkv9aaWLCBmSmqiQdADVUIeqj4MzqA3TLWtxaTrscepBmUPUK
         iJ6+qSYtNCHtrvuqShXvKCWd7a1+pJxRG7uoqnPUFEEFS2mnxDt21XYDg55s5lgz9/BX
         0nS8gfdZT5YovKx9fBZ5IRc/XjDW/OQAuK0qUHVTGLO9pa+z9meLXg8oA1VL+VNl8RDg
         sNYs3j4nhruIK4XpZ3xRecUpdI5XNx+F6T33scVVLZedFZE/EYXn54rDw+zTfpvt4w1w
         HQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269450; x=1744874250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vj4dRFeIPg69IJI563j/AOt0mSXQ1SnlTmdMvO+wPSM=;
        b=ee/f83gwJ0IgUliIWrZ02HbVOMxT4LcHhBRjusvzbjw4gmUTI+7klz37lvRmVYCYKz
         d4LKWba8ro1NQHTnszD8gLCOsKy60mcebcGmKg2Z+1OaGqMIANYvaOLzXvEAWudgYj+n
         Pnqg3s37PAxnad1BjCF21nrbhBuXEdA0lg1lnmPxvElX4uSrMoKEDxawrukLw5KW8O7L
         /ZIK2oVL5kM/APIG52TDuC/VKbicQnj+QgT9EHxGAgs31lCua+eYd+0qXyhZ/lZsIF+F
         lGRgFbjFlcYccaYjYn+DL/mDhf/4m2p6rLgwQFjuWwjoqmpg/gOUZPDf/Hbpg9ZiZiY4
         K05g==
X-Forwarded-Encrypted: i=1; AJvYcCX/8xVzBDWJbztJNYSSEvnsqqXH19x6XhTjwCy4miU8cjH/mAmRz+ZvP/lIkMdauTsJIv1qqYBh9H7U8w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yye/sWo+eYQK274+BtdgNkx2VljbvKQkqaIX5Lq5Pqh+esL4txl
	wxg4eUgnijSRAqvbYKiedujaU4L6sXpVnPmbdtw669lzJWtFR4XP
X-Gm-Gg: ASbGncsDh0F40VcVxmA+wA4bDJKztEXZsXinPMTdxFIYQ0QYWa4SNl9jXbPKq79qred
	GymA2Ss1hUdcs9gQhj4faibBX+UBZStUxUTc0r57pIevrbiBpw1JxisTiAmWABquMOl1XhwLLEu
	TfcBrkScNAdjfr/x4Rzld1IiPqCbmqWGMaXMIf7SBJU9S2MVg+N6Ratx9aEEgK1fbimKluO9to7
	piSpVFI1e9apsMHWV79GVgVvfTDm6RYlzdNHruG/jSAZVLDKOUHhB78EGAlUXBuxrngPggSBeph
	BimBiy+R2nb7WrzT6bjF1Oe6js9RH6QQjrf4Th5abpdWfJS5f5hG7mZm+JInnQqqBk8Ni0SCv9U
	iRAhfQLWJQwODi1IO
X-Google-Smtp-Source: AGHT+IFJZFrovX0zOi8eNh8UCyt+flT0nIpcr3x+ML9B9tU0pU/GcNFYha0+y0JFspALUbRQw8rnsA==
X-Received: by 2002:a5d:5846:0:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-39d8fda76d9mr862373f8f.49.1744269450220;
        Thu, 10 Apr 2025 00:17:30 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893611fbsm3828556f8f.20.2025.04.10.00.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:17:29 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Olliver Schinagl <oliver@schinagl.nl>, Iain Paton <ipaton0@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Paul Kocialkowski <contact@paulk.fr>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Ian Campbell <ijc@hellion.org.uk>,
 Adam Sampson <ats@offog.org>, Zoltan Herpai <wigyori@uid0.hu>,
 Siarhei Siamashka <siarhei.siamashka@gmail.com>,
 VishnuPatekar <vishnupatekar0510@gmail.com>,
 Rask Ingemann Lambertsen <rask@formelder.dk>,
 Aleksei Mamlin <mamlinav@gmail.com>, Peter Korsgaard <peter@korsgaard.com>,
 Michal Suchanek <hramrach@gmail.com>, Icenowy Zheng <icenowy@aosc.xyz>,
 Stefan Roese <sr@denx.de>, Phil Han <pengphei@sina.com>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Jonas Smedegaard <dr@jones.dk>, Jaehoon Chung <jh80.chung@samsung.com>,
 Heiko Schocher <hs@denx.de>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 5/8] gpio: axp: Remove virtual VBUS enable GPIO
Date: Thu, 10 Apr 2025 09:17:26 +0200
Message-ID: <10637391.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20250409002036.12212-6-andre.przywara@arm.com>
References:
 <20250409002036.12212-1-andre.przywara@arm.com>
 <20250409002036.12212-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 9. april 2025 ob 02:20:33 Srednjeevropski poletni =C4=8Das je An=
dre Przywara napisal(a):
> From: Samuel Holland <samuel@sholland.org>
>=20
> Now that this functionality is modeled using the device tree and
> regulator uclass, the named GPIO is not referenced anywhere. Remove
> it, along with the rest of the support for AXP virtual GPIOs.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


