Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C269722C327
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Mar 2025 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741622751; cv=none; b=UNda1qLKLamtM2TDVceX6M4iV2f01/iEbbQ52V0FlfHwiysGw9j96z6TA2fIyEijYOE15RDLyQzE2ZYAEZJbpHWxcgv4yYWVOreZYloXqBPJxpzWg5fEXxzXaOjbqVK5ofL+nrvoCnJGSZeea1GjQ8ETkfVSi03kyGfgCuG30fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741622751; c=relaxed/simple;
	bh=1sBzCrcWxCos2ucPDzOy8rSIoDUK4uuBb9IVbzpXf6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QqzcbANwYP6b4CgP1AhJQ0VzbVX+VXdmRTYln3T0ceK74Foe/LntN25CEPxYLyyNHC0SlnvFzJHqrLdFpbXweJqa4kDmdu/zxGTL5LVewcctz7VuENTUU289aN6CeXPobMJTnAxzKsy/cJPD1+TCQYSeyu/bwm5GcJk7oitga6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7zR6BsG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7zR6BsG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2143299f8f.3
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Mar 2025 09:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741622748; x=1742227548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sBzCrcWxCos2ucPDzOy8rSIoDUK4uuBb9IVbzpXf6Y=;
        b=i7zR6BsGaImLLkeffta6N5zKV600mMaxyDIOdHAkt5hGEl96jIzJdUPtawa+OhlFRB
         jjhmYomDo872Rrm5Q+RkHrG+bvADVv+V7ZEwaIAW79C6qGqqe41EsN2v/nVYZQsCHXPf
         SNO1eziFJFJXPIyiGknSntW0at/zTh587x/TT/U2tcjO7Mv68xOXaN2s/aB71W382rku
         1yHt5JCwLremyjoZShcEuFmKXfANoUEjZyHnNdK2I7vZiSlcQFMueP0ssdX5bmkcrFUq
         rQsb9tHVFdB4c0OGdNoj17zS5byOsjcM26dx9U56ARpUPa+AnGjFMGkozrQ4g3UzIr2N
         C6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741622748; x=1742227548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sBzCrcWxCos2ucPDzOy8rSIoDUK4uuBb9IVbzpXf6Y=;
        b=D6V7h9WCC63ZzQcloirYRrr7LBI7LrNzH5gD32jtihYsOOQkI9QGiFobDSg5heKPW/
         bjx1s3v/tRSmnXaWqdbxSf7on+9l7WnjbvhMUblFgyOPaqTjfHSY7Hs/3loz9cUEq4b/
         5sryJR97ITFUevO2r6neiEd6hDjt0No6I02YejA39Hr8IkNMxd07/2B520IuKa17iZkY
         D9ZoikVwINbChwtrbb02XNL/m+QcfNxTRvF99Bq3Cjj47xzHilfmm/J1B5J75LtFbKD8
         NlUfLhrrQz0t9xWvFjG0yUBGsDJTHzdFc6nGEUyKdf6mW7HfZnoVj8e2RmUxdtnLav5+
         0HyA==
X-Forwarded-Encrypted: i=1; AJvYcCVD/iWrEmODlzPr+Uq65qtlU6PrwfozHbGf9ElOj4hbk8L4vHfqNRZss5dwRm1kjVQOdH0vwUHnp+WCRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YykW09U9r7g5Sf/LECnHsaPkQ3sR5ooOCrrtP70rnjtTfDzUXsf
	qzT2pikBH8/NAR9dBx9hCy4m2U/pIaRK80X+JVSblJS8y7/hz5Si
X-Gm-Gg: ASbGncub+k59x6xghZLbFC49WoMcUo8mBRB1UQYlvVBK8u5hurdhEU8Nlb9xohfww6t
	cdrEi/w0zqb9Cd1+hMkiyaL3527zh+RZWj1E3NxJ6NkD5V4emj4Ibbmp/7RKzTww+3BkHp40Vmf
	hD0FpbU/RG59RACCnBMgkXyW00QtH/Z5fv8JSS+35BCnATKBYLaw9y60Ti+mJPIuuOh3QE4b2w/
	YPiwXh7njkYVrTXqrHh/nhFDJg3q5g9ZbJ7j/bwtjTXZQURz0ZQK1TAHLJnKCIwSv8srIjPbG3W
	wd5fV7/bXDL8fijcdtyB2QxFnj1yW51vEFpiSoeNTHLRVVB59yvu2s5AVr74mtrxsSn7t2G+ZfG
	zFpvk5tHcpH7IVNaDTNVT
X-Google-Smtp-Source: AGHT+IH1HHf+1OpwkvFsYArfklWxYPjgWRGPYO6MW19aTR4oUCtXkTsxgz2AKwy1itY/6jY/cI2jWA==
X-Received: by 2002:a05:6000:410a:b0:391:4559:8761 with SMTP id ffacd0b85a97d-39145598929mr2906294f8f.36.1741622747749;
        Mon, 10 Mar 2025 09:05:47 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cfa0723c9sm34686035e9.6.2025.03.10.09.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 09:05:47 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 9/9] net: stmmac: sunxi: remove of_get_phy_mode()
Date: Mon, 10 Mar 2025 17:05:45 +0100
Message-ID: <2774218.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <E1trbyF-005qYl-Lu@rmk-PC.armlinux.org.uk>
References:
 <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
 <E1trbyF-005qYl-Lu@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 10. marec 2025 ob 13:10:59 Srednjeevropski standardni =C4=
=8Das je Russell King (Oracle) napisal(a):
> devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
> which is stored in plat_dat->phy_interface. Therefore, we don't need to
> get it in platform code.
>=20
> Set gmac->interface from plat_dat->phy_interface.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


