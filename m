Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FACB20766D
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 07:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269134; cv=none; b=XcvGM1GdI+Fv90WWi4DZnZbFbpIT118n8I7+CW7a9xo4zSSv2t/lABkGKtS6HCKWTaHGur5ae2tU1Bf4UxK4lCu0TsUtCtYeST7IfWUFSuuzdLX471v1zl19nJthkCEJyj6IuSwqcJBWS0fwn/uu5vpwzNlEcVrYw60oeEUPgBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269134; c=relaxed/simple;
	bh=Clts/wYS0ZRWVezUHusTmN2QW1kP2sDx1vh3amQGmYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dl+T+/SHjW5C03K25Ax0oGgTihzcWd0opdS9p8TBtQAPUfk9iyvxhVVbzuWOhKy7zxyXRcF6be8NT8crrMGIMN5b6vQ5J/c08p4f86rrK0RJgMgix5UT9U/F1bqKiBCno0r4UA6LouG/ra0UGxh38QykSockCjhkxpoL7AF357o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da75cRnT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da75cRnT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso4805555e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 00:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744269131; x=1744873931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Clts/wYS0ZRWVezUHusTmN2QW1kP2sDx1vh3amQGmYI=;
        b=da75cRnTOmk0TEF0DsSSAhK32uNh7J4Fz2Ia+RCzOU3DHAMBjiXaZfV9w6ahlMkrCf
         pG3Zt/6z54baLn5l/b8ZH8ul9iug0RyD4IYwqHHElEQyoGf8VQz+fos5FcrgibPsTNLP
         ejFnqaChDPPOno6C6DtsoY+6mFOYyBRj6zmyyBKstdaJNEidXvPznz5EGUN5e9otM+jI
         bm/NGe6w+SjD8QTIy48MRMoxIX7REEG3icL9lDecLs8qVjPPMiQEJ5v2Oel2YBQjAj21
         1w9NNHxYQ4XfJ0xAitGBWG0XzP5ia4nqaDUyXssmf86KJhdkqbhtBxeo5Uv8q3iaheeF
         pilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269131; x=1744873931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Clts/wYS0ZRWVezUHusTmN2QW1kP2sDx1vh3amQGmYI=;
        b=BWkzNQg3YjahS43NbNgcN6HbJHm27fVsnTPrL3mESGiQ5Kb3V1iDrTL82jLW+aUCzv
         e5LoGluXUCtGqiKaFNWb5/NRNowGu8tXjsa1hpItfcmSSNu+33m7HycDHtIUT+Cwl1IZ
         PaIzA1xpdxvrYgdVOu8ZHUg5lgIXQnfdfbBhcyBbcyvtkd1uIuTIIaehlhwWfy4ojoTW
         32e+zPiWhOv/3aW0GCnqKrLT2AdtNUDljLZwLuru1N6VftyQP6BEZidRrtl1PU6EH8rr
         YTSdMqpxpx+0gilycbpUJcKEatiEuhVexCfvLMMB/YCbkaVRYhupX24t9Cw0YLEVlF+z
         ZlAA==
X-Forwarded-Encrypted: i=1; AJvYcCVQs95cNF37ZaMYs8iLG4BfrePeNALxeysc8F1zX/shPXmjgviommjbWmbr3S9b6LxQLCMnucVKsQsWYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgxOO12ndZ4ovCBKvLYDa7SDfu4+gitmLoDxD8SL3e6/V6itmM
	fLxQdt5qGCtOh809PnAdrqbXbIdbMiUL98CHHJpcLNAYjGv1rq+6
X-Gm-Gg: ASbGnct/NrQWmzilqQ7NqNExIWKPj8dxUuM9NrD3hhdNHW/oN9DfyU93yvfMIzmmur7
	Geyz64eAUMMLOumMvpZkStiVOFnDYzCPSJssqkSlIV9hmg52o0FoSA4VwFq+17w7+VQs+dS1xS/
	hDtqsaYwMCl68KwCj/uvUU0Zua/qQVVQkYIaZl/Oxkp7NAD68hKT4Eq8BD82al2ZkxYuzViFzR/
	ehr/yXCCl6aDeegR0QOOMTL7vPOfPNWxaH5rQ4HNLh9xqBrUBV4RIIWLzV2Wztb1Uf1G7b5rVLp
	IGdunArA1/itK9wYGCOLKhbAAWYUeLx31IZqLmNesHaUKdhRlgfybKYGAOrZ7IUiKgsHRjyW02r
	OYp0S6ijoA77TLWQX
X-Google-Smtp-Source: AGHT+IHEX9C9BG244eF2d9mgLMuGw0QUZWfe3dHedU1PfZIWjGiY7BHoncQgqzNfC1LnCJ7AMUfL4Q==
X-Received: by 2002:a05:600c:458b:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-43f2ff9bfb0mr8081525e9.24.1744269131156;
        Thu, 10 Apr 2025 00:12:11 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c8fb4sm44426355e9.35.2025.04.10.00.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:12:10 -0700 (PDT)
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
Subject:
 Re: [PATCH v2 4/8] sunxi: Remove obsolete USBx_VBUS_PIN Kconfig symbols
Date: Thu, 10 Apr 2025 09:12:07 +0200
Message-ID: <3349527.44csPzL39Z@jernej-laptop>
In-Reply-To: <20250409002036.12212-5-andre.przywara@arm.com>
References:
 <20250409002036.12212-1-andre.przywara@arm.com>
 <20250409002036.12212-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 9. april 2025 ob 02:20:32 Srednjeevropski poletni =C4=8Das je An=
dre Przywara napisal(a):
> From: Samuel Holland <samuel@sholland.org>
>=20
> Now that the USB PHY driver uses the device tree to get VBUS supply
> regulators, these Kconfig symbols are unused. Remove them.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


