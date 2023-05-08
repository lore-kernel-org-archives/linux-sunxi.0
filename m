Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3CE5CB0
	for <linux-sunxi@lists.linux.dev>; Mon,  8 May 2023 04:43:20 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50bc22805d3so6236272a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 07 May 2023 21:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683520999; x=1686112999;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wLGbxnOdQH05ihvsc63364XzMDdgmp6oHJPVZ7OBOoM=;
        b=bNDHeN2Mv9sA7wX69vDsJeOoMS+Lm006HMq41c6ncW6gq7CMRV50jSJ8yuKObyIlrJ
         PiPm+3JXsaprVIMfMzNdMpopKz6Cdor9/1bdBMF9vagxHh0URpy3Mu2aghHtltX/7skL
         MnAM/oMdsd4YGiedf9m9diV9jB0vvSKddJNbtAQXatgyPp+bCXxggwGyqL3/7qJp+IvD
         u6Ta/VNfikkbjb4u7zq2bK/15j6/YjPwo40PpcW9gM5vjYwXrMTnACcH2kWO4iB7j2fz
         JNd7EOlL4fxOSHSIcGz5Jo8P+3IHuelT+oKyZNcneNPAvktnGmpkUvbFCmmCfwjcbmEt
         ZBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683520999; x=1686112999;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLGbxnOdQH05ihvsc63364XzMDdgmp6oHJPVZ7OBOoM=;
        b=f1Giba5x2NyT9xxPVndfzvYC36+uyM34z6LQJjJDEJGaYaqBZao/hLQC2Izrz2dDZ7
         ox7vNY12j+qz43OWenIuVpWB/04PuvXdQ3XTIRNewib+gFZWjgfkgqhX98H3wdO7I/Q8
         qsKaIJe8U0KATdOeLINMqzEemk/S+6qJTLRzhYCOXy8Bd53yi4eebWqQqRfoeCHin5+7
         0miRwFzegxhoSQbWAtrjkQHxNIJNFwdcKwLclFBN9xEWDSzVt5ugyoO7zp8/lc7RkQDS
         uJ6u1a9wiR4dWrYUCrzBDFzlSiT8VTeUiC+x/RxiZ5kxS5b9+CVD2oLPMnO3shJpqqys
         Go2A==
X-Gm-Message-State: AC+VfDzDuzIPfF2gPc3gjg0JTGLdZ3piYh8a858ERImQcLnI8JWZE/xW
	hRuhfPCbC0kLRCq/Qd1EFYVw1gdA7qqtuKjuyKM=
X-Google-Smtp-Source: ACHHUZ7mNoFVuUgYjmaEGFCXtfAGR8Za76cQQJ3P63GXnHwj4GjAkK7hfDQHde09dzNijnm1XeZ9jvIEVy/mf5aiAaY=
X-Received: by 2002:a17:907:da5:b0:94a:67a9:6052 with SMTP id
 go37-20020a1709070da500b0094a67a96052mr8491313ejc.67.1683520998626; Sun, 07
 May 2023 21:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 8 May 2023 06:43:07 +0200
Message-ID: <CAKXUXMzqCktKz7vGN4_QAp4n1SeP0-YHL19evmVSfseZOemd5g@mail.gmail.com>
Subject: Situation of CONFIG_CLK_SUNXI_PRCM_SUN9I
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Dear Maxime,

with commit 49c726d55c1b ("clk: sunxi: Add Kconfig options"), you
introduce various build configurations for Legacy clock support for
Allwinner SoCs. Among them, you introduce the config
CLK_SUNXI_PRCM_SUN9I in drivers/clk/sunxi/Kconfig, but this config is
not used anywhere in the kernel tree.

Can we just delete this config CLK_SUNXI_PRCM_SUN9I again, as it is
not needed, or did you simply miss to adjust the Makefile for this
option to be effective?

I will gladly send a patch, once you could give me a quick pointer.


Best regards,

Lukas
