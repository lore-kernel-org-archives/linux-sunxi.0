Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F22139D0A
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 07:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737184588; cv=none; b=Gf8P/cUQH3axAd8Nf2ClczhS91svu41XLIJAIlfHacx9N82J22hdW58SaHOBa+nIMuLtDeuszsrwBo8g6bm3wcwUGwYBGhKiDUFgMU6mVt5i4SJYtqJJJZpkSJlQWU7osqdVH5mlfSuTJ2L3CTi/Bn1Y5kXj26fW7u0S5eX40iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737184588; c=relaxed/simple;
	bh=tvmsiMcnF2/uG8bi1GujCIOYQ4DypSOlsDW3rRw14hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nq1PeiO0uanzXj0unfoLfS1VN9+R5ZjpP85Yl5w4Kn1bfukdC0dEWMw1hXNLGZWRDm5Txhvn1PNFo52+beZsmG9pTl3FQE+ZOHLLuTgtUAkHfyiPe0zq7jeTl1+WCCzr3w+N7uwJLwT6WLFgu3IKDoSElJxW1MA6mSDJXH7hVfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBsrXaEX; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBsrXaEX"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so5255802a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jan 2025 23:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737184585; x=1737789385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvmsiMcnF2/uG8bi1GujCIOYQ4DypSOlsDW3rRw14hc=;
        b=cBsrXaEX4JAC/83tLmU9z1FEbzZjA2JVt+U/GHCO+EbbmztPrGnfpT7ZgRnySueFL8
         vozr288sa0Jw2pizize/CQXikd+dCRD21EFvfInD6XrGVtBo+u1sUFVDgvARpYpC9kXr
         jKEXJN5MpmtGLIFCC57bQNcdHjtHjX8JM97A9x9uRrecHxS//VMnhi4pLDvXeP8AGPuO
         uZk4mOs3sWxWGRQO6TjptPwsZI0wti5+LKX5F4hPC9uEDXqt5FkyftDRFRk2VXlKD9HS
         lmCIF/Dzb0UirzvS2XcHS2sz/xL00qt97wx312McpmhIzS1R0XlQCrCgM8yeMT5G7RyJ
         cHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737184585; x=1737789385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvmsiMcnF2/uG8bi1GujCIOYQ4DypSOlsDW3rRw14hc=;
        b=hZ3obwAq9Fsb90e43fDzfHK/ZEu7lYwpbzTIdnUtcCt+6V3zNDRo0IJy8VK7MChIha
         pmWX0ufabj+gFPcyagxwroXbFaR4CDlRFPDgSqsH9elE87/9V/SW+x2mRDUoCDdx7Bv5
         OktOD0I7PbQNa8iEj3gc4PIiSvXROsuAjWbXYi9hcVY2iqi57TGtp55lRHg/JjnGtM2/
         79DtOKQKKJIuFI6/95IT55quusgqGx5IjL4opKJT+Z25YMLnIluFulA1+8fujqg+N+1e
         ELRvjvTeMi1Lp04L4Iqerl9zU0vkHZUhAb3nwf5FgiwkC6a218Mlwa/Xhl3YCddT7WbI
         qPEg==
X-Forwarded-Encrypted: i=1; AJvYcCXicT1sGmOzB30XWdw/3h6DtUqsYJ5DRxVmM+M1eZ2W+eNJnQhyUmz8BAo4+KByaNdrlRtAn4IpUR7PXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYYM5aDiCrNudS+vcE93j9dU3H3dGXt74YfZaaiaE3jH+q7KTB
	UO9v7aeX3f/QjFr++9KtbORQUGCDGgxRfhtMWRx6xP+E2fOdIB6QqC6tHg==
X-Gm-Gg: ASbGncsRMff8bOkHi+T7/zWNWvGWL3HOc11rClXzEc3jw2aej6m2V6lA+254NWBVJ8I
	QVJggrbIhPBCUlhUVYOFALdqioINIXvBLxqbjASYd6jcWZVTqqODuYtvErpVMJuZd7STNc8eYaS
	47Q7R/D6gGM8EowcZsN22vtR9aq6xWKVbAjef2V5+6/iPLmA4yRF2sCn5xw1Zp1ZOHhT4UTNJ+K
	xKqui23UzQOwX6wsWCGhSTYBobC0gLYjuHChHto9hgaOcpen7pQC+7X9RcF6nVc+XDz4PzGQ4Ne
	B/sOpRjGeg0nuE4=
X-Google-Smtp-Source: AGHT+IGLfOUnmOlf0dfv2EPZsI66QYNfhjl0KwhCdKMeegq4EfqhcelIy5iL++pD0InGzuI7g5FXdQ==
X-Received: by 2002:a17:907:1c19:b0:aab:dee6:a3a2 with SMTP id a640c23a62f3a-ab38b4c6500mr434180366b.47.1737184584743;
        Fri, 17 Jan 2025 23:16:24 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384ce0f58sm288083666b.48.2025.01.17.23.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 23:16:24 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Tom Rini <trini@konsulko.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 Simon Glass <sjg@chromium.org>, linux-sunxi@lists.linux.dev,
 Parthiban <parthiban@linumiz.com>
Subject:
 Re: [PATCH 1/8] sunxi: clock: improve grouping of default clock register
 values
Date: Sat, 18 Jan 2025 08:16:22 +0100
Message-ID: <12589905.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20250117014537.22513-2-andre.przywara@arm.com>
References:
 <20250117014537.22513-1-andre.przywara@arm.com>
 <20250117014537.22513-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 17. januar 2025 ob 02:45:30 Srednjeevropski standardni =C4=8Das =
je Andre Przywara napisal(a):
> With each new SoC added to the clock_sun50i_h6.h header file, we add a
> list of default values for the bus clock registers. This list gets a bit
> hard to read, as the spacing between the lines looks confusing.
>=20
> Tighten the lines by removing empty lines, to make it more obvious which
> values belong together. Also remove those comments that were more or
> less duplicating the next code line, and didn't add any information.
>=20
> This makes it easier to find existing values and to add support for new
> SoCs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


