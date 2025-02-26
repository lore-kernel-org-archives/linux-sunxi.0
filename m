Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF182904
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740585303; cv=none; b=O8wQ4pI/xZRjPLv0ZUMP5Pd9ZxF43siyUcSmFCQZ8Spvimiz7QLIqBEXh0PpSickPomnSMnt2AJWCH3pV2h0nNKoi4eS+ZXdUTmEI5mDOGSvq2PSt10brkeCPd+9mr8ZCatZzYy7et2ZLHTyoJlKCtZupXSfTRGw5TxGELmvgBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740585303; c=relaxed/simple;
	bh=N9gKOzRQdvZ5hZZTklAcm6Yhtodv4eS5i1XSa+zbnUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kJz9DyBmyqkKijj6CQtuX7FFe7M7OhFBfrNYLczzLpLo2bYZ2Pqxq6Gyj54LDnR7ISFscnFpAMBVsLZg/sTeyfCnK6IBx75bZixztraqwl95f8IYyBcvtkwRkpkzIBhvdvyI6fiYVrYIPyXtfvieWFC2Vp2V10uHcC+QK5uWeQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIH70lql; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIH70lql"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30a2f240156so73307761fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 07:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740585299; x=1741190099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9gKOzRQdvZ5hZZTklAcm6Yhtodv4eS5i1XSa+zbnUo=;
        b=GIH70lqltPIg/Bmu6gCRZCIRHbLYhv3JfHzLmXntC1vucgcL6w6c9RTgg+c0hcFkLM
         Wd8xWts6dvlOmX8vK2AZRkUB8iGc77V54CbE5PTYZgMBkG0hEy8Oohu+l1LrQ5z4KBfW
         jnl3dcO54LYXPygPbYyD7BGNP7iJrPk2rib0Xhobp3QIqlMemVoBrymwyeyJOM7cbxOa
         pbuJMJWzrLed29Z473dzfTDCz/tRCaj+ZpthaY6J/pXgmzppCPkqVnYT/XiGgC6+NvWr
         wCZh5P+BI5xFkLzs23BOHaqk9uIqnBFMELSS7REaDfArY+c7YYfCsEw4hgrIZStFz+h6
         uO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740585299; x=1741190099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9gKOzRQdvZ5hZZTklAcm6Yhtodv4eS5i1XSa+zbnUo=;
        b=S0nObXCtsraF4SdcaxjCozQ3lSs4ilsOzq7BgEMxXnjQTX9BbASCUTudUb4DWPpaJ5
         cACoYiPtgtl5o92QXT4fO7n4/QK11A6MTLQ798b0q5MBIyV9SNDEUEtXqYT30gQ/0Bwe
         fRaiswwSRC5TFUwkM/kS4xUWtJFHnKBDFYy3JSNGrbKDQrDTY9RPVTazljyyxxB5qhTg
         EkTBOckgQ/A855bRJz7DWn445pYOGOSo7bneMfvvYbtqxzCVt50S4TFPxPyCfIerotRf
         1hx87HEaMtzQaBRKHwYE+KwcQDJTCdkfjM/WE15ddZEYM6VdYOhPva4gU6TXzV47+4mk
         hOwA==
X-Forwarded-Encrypted: i=1; AJvYcCWy5XjHhnRwT02UGfnwRBHiykzTwXqAQMwhufOJL4YWxxwHhDOcdIICI+y0ZuaQLcVXw+gQ7/KWWGTXdw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7uCGF5AYvLRnW60j4+QHHDvWjS1q2ATv38yGWS/1PrEQlyLzd
	yxJml8VQD/N6Dl7aM5GWGuh337GR/4fIpTldLRWpktEslFQImZdd
X-Gm-Gg: ASbGnctWOgNJH09pDvtv2qc8xpcUpQZ/RmMBYBFOA78DlVRrYgC2dbG7GtNHUthyq2f
	C+vqIfIf0TeMj3WExu0vdTsmpMiYJj1UA7UpVb2WD3O3knkERhcma9GVnKMa+R0ddwjbr54OP0M
	b3h1Ak3nj9qw8Fy1XwGC55GbgfVy1AkT4yXnFAucVuKrb8bYhKELxnnSEpUMaSoVI0H6Igtv+wn
	h7ns2dYcB7yGRUHKeE7JXNPnv/wO/vm2UavTezbPfBy1hN6gDDlJYvW+uTsv+lNg/IH2OId+tny
	tIIDSlT4rxUoHUxC/PNALigMXWxiLpgBaSRN/7uS0WS9TnzlKYfUPML90fjTIA2edi3OwU5qZ6Q
	38Q==
X-Google-Smtp-Source: AGHT+IEQA+JhhfSXzDdcoMLKHiv9fXBQO4q2Irw7K/uICkwj+f3JfUMxR9uKDiFP3TuLMaH0IxC5qw==
X-Received: by 2002:a2e:6a13:0:b0:308:fd11:7700 with SMTP id 38308e7fff4ca-30b79184946mr27165401fa.20.1740585299172;
        Wed, 26 Feb 2025 07:54:59 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819e1462sm5709901fa.21.2025.02.26.07.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 07:54:57 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Peng Fan <peng.fan@nxp.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>,
 Kuba =?UTF-8?B?U3pjem9kcnp5xYRza2k=?= <kuba@szczodrzynski.pl>,
 Icenowy Zheng <icenowy@aosc.io>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 2/2] sunxi: sun50i_h6: clock: fix PLL_PERIPH0 rate calculation
Date: Wed, 26 Feb 2025 16:54:55 +0100
Message-ID: <1914474.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20250226113712.1257061-3-andre.przywara@arm.com>
References:
 <20250226113712.1257061-1-andre.przywara@arm.com>
 <20250226113712.1257061-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 26. februar 2025 ob 12:37:12 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> On the Allwinner D1/R528/T113-s3 SoCs (NCAT2) the factors encoded in
> the PLL register describe the doubled clock rate, as in the other SoCs.
>=20
> Correct for that by always dividing the calculated rate by 2, except on
> the H6, where we need a divisor of 4 (no change here).
>=20
> This corrects the PERIPH0 clock rate as read by the MMC driver, and
> actually doubles the MMC performance on those NCAT2 chips.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reported-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


