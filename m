Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A595320D51D
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269620; cv=none; b=BF+0k8zcvLDhszlIAgLCt+CTI9jHTm29NwFleQYsLtXTqx+ANt7Ndcih49Qc5uXIzwn8vLJ90Jse1CiSWLSESXMcr+7nnjoKLo5uKnGn/haoIoCwjROs0SNz5M1sfcNqXd1wg6rJr6ajEXlbvovAfggKpOObuwvX42BHsq8iNyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269620; c=relaxed/simple;
	bh=fxWEedt3fMr2+s19ndrV/m3BR+qDLQD+2272oybXZ+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AQ2nIWOCV/WCIrLjLF5xFsZRcY7kI0Hmhm62UPnYP17Oe8uUbHFhaCgnHEyrkLUpgctF1zgXYcbYQLU7gNobEYq+Xl5Q1hi39PKiJTods0ajb945xQ9DCeMWh9wsIbrBVscrTND66UB20uYRXMEWZOJ2vkZ7WYyx1zWrw5zLZwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCIzOZeo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCIzOZeo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso5232925e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 00:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744269617; x=1744874417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxWEedt3fMr2+s19ndrV/m3BR+qDLQD+2272oybXZ+M=;
        b=BCIzOZeoSByq/nWmU3yWRTH0tusKtGg3C6g74BSV9Rm7+WQQXo9w9/saJAXZrIrg0Y
         bE/OYQyVu2zOU4YgdLTfioA4DapF4wvUEn/Oyqaknm9dwSfHZXCvbFca6jr2XJIstkOH
         +XHme00wseHcsNjf7v7cm6mxG3aIS2Iey0letWI8T0UOOmE6H7+qPZwRR7YA6XMICRWv
         sWo7smLuKHVOsTqPtwH/RcVAt9fIwwIhK6WeuGEqlZPPRwY6ykD4T+J+WRbCKLllFS+a
         x90sdK6ROQMagemCeO5A812Gfwa4yt5nRepaZPsjGwXfRKSLvjU8XlXJA0ldxxM3EVgL
         4znA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269617; x=1744874417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxWEedt3fMr2+s19ndrV/m3BR+qDLQD+2272oybXZ+M=;
        b=GtGsWjeuyQ0KIcBDc6oo1Vf5nEYm6iHY9I6rqU9/e+DdPt3xTCiaBeCqjgIwsL8mR2
         q/t0EpchGY+zwG/yskQtVHguMt/azWXDMRGi4Md/v7rEYF7Fu/rgl5HEKg+itPTkeApB
         Jm8EGoFKCe1ZLE9EMCw43eGRCg4bJ2U+X9OOMNby0pU9JMcXTMRhqTasDeFAILk35SBI
         SGwBDNgAWtG4w7y1pUg+lPEvI30Lh/o7Gc0IEPOt+wCwXNoPojxC75wz6UTwI5Jowc9J
         ptU3HNRwNWfvshzNERBuZgDR+HrSoGvvcwX0qTRB/JyBAUKDoQsXTacMUBqMg69bnAcS
         3ETw==
X-Forwarded-Encrypted: i=1; AJvYcCVaLMOe4DoKU676uvPNO+UQDITz/CDEFDrwgP/7zy+/qM9VLhkGHOrlE3WAiVPvvg6qsAOZghzIxH7tqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrNRrltGvsc2OgR3U3uwyZV+ymQJS97oNHXgr8qhMjiplQ6Szr
	MRCW2B5zlHRIb6WjjnMixGxeMFeDnDGxcGUlqVXuU70b0T63ufRq
X-Gm-Gg: ASbGncu1/SwdqpassykNpTUnRzpbS31uim790Lb2KNHoNtwcNyBaoDjeGe/55A4myLF
	Z3fazLqX5eKKPcPwLt/efq3eSy9Ht6kSscT/GJyGI9NWP7nRrSDtQBNBH3wfnnh2OLEDV8nNRvH
	cWhngdqd8+CvdVtGrAnIarS6ect/EEmJ7UW6L4Sy/tZxEoDtpBdlrVUS5IUcl8vOCZvqWW8fGkX
	TGJ71JjJahnj8ks354oSzrE7MuJ7ZphOPQtMsmubfNFyBaq3Vc+g0+b40CLv2HeGKRCsinA2iKk
	T/KDB6RV+mhN6MtZVU3uQnqd2+kdCmnhNo5EBtpfSCPsj6Qki+U/2f20c+7FoMA6htPTyg/YzmE
	L59OG9D0+327YWfvaRckf6sNsBG0=
X-Google-Smtp-Source: AGHT+IGcbG9TTzv88SGGmYonUe5BWCB8tFfVJ/XyJ88KQjsTrUUWfslLGtbCYo5HW3Bwq+n1rTOsQw==
X-Received: by 2002:a5d:64e3:0:b0:391:3f4f:a172 with SMTP id ffacd0b85a97d-39d8f4e8e14mr989437f8f.49.1744269616992;
        Thu, 10 Apr 2025 00:20:16 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89389ed6sm3804553f8f.41.2025.04.10.00.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:20:16 -0700 (PDT)
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
Subject: Re: [PATCH v2 8/8] sunxi: Kconfig: Remove obsolete USBx_* pin symbols
Date: Thu, 10 Apr 2025 09:20:14 +0200
Message-ID: <3620418.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20250409002036.12212-9-andre.przywara@arm.com>
References:
 <20250409002036.12212-1-andre.przywara@arm.com>
 <20250409002036.12212-9-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 9. april 2025 ob 02:20:36 Srednjeevropski poletni =C4=8Das je An=
dre Przywara napisal(a):
> Now that the USB PHY driver uses the device tree to get the VBUS detect
> and USB ID GPIOs, these Kconfig symbols are unused. Remove them from
> their Kconfig definition, and also from all defconfig files.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


