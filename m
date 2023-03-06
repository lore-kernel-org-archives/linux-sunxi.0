Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D3B7473
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Mar 2023 22:19:20 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-53852143afcso211140067b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Mar 2023 14:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678141159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIwy9GGWWk7FRheyk7kQvNm+28TrmRYb7v9Ze4E4qE4=;
        b=ICZbYBbMVaIDZmAFB6H5iCrhGOEY35M31GUKkKobfQ8xltOrmn8D7FBBCOITMcflZS
         tG44B2qro/h5+lzF6tMxsW8eAPNd9g34RzZohr48LOpkOe65wBRX5KoI/Ijr40eZ47u0
         hg9LCHTphHBINZkB8S5Stwn7tdrs6yBXkgkm5ESSb9puGdqGNkOVYFJ7AlZ5nH8WM/BX
         VLXoEQKY4rimQFW9XQI71Ag9FOrsXPDGATyku/a5MWV099Hb/BvLMCqc0tbzZW/EPoo/
         JYcXWDx5G47YQPkidEUVePtZhKEOq7OFI76H8ngB+J188eN8H6kWVzpgqs5QTDJcNVaE
         PWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678141159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIwy9GGWWk7FRheyk7kQvNm+28TrmRYb7v9Ze4E4qE4=;
        b=59k6FSeOwe5UHJgl7RW2XDh1uwmhoQ0nfsANjsl3VJkUDK/v6awtROkGgX2iBrmLqK
         irw6CHo8+ArCzwYlCQGuELlOCUY21p9HwZbY/f3NtHPxfks48RapjK7dIlxqANyqUlHx
         MfLVcjA/GUomFQ0kTbes4hF+vouXNIfogh3n1EnyP9v4V9D55s2mXWgVSh0DtmMss4m2
         Uzu5EIEA3WdfU0rq1gveDangsIwV/JJRkhBHDR4BQSRYPNTRrsE/xKDS/Z9yiwwON1hY
         RIsfkd8PsqiNkYRsqDz8sQNyX8LlXD9srlUwUhWsUx5hiGERsHF5HgXERy2KK1F37GRN
         EsLQ==
X-Gm-Message-State: AO0yUKXS+BbOasB/bMhR1o+kE6uhQoQPX33lPT/O4oLfBgknYFZNLDFn
	5mo0d8K83mhgo9W9qd67/rVKuDCDgk+qRBzdkt1FeQ==
X-Google-Smtp-Source: AK7set+FEBHOTN7jH6jw+W4M/INkl80XRa4XzqDzPxdd9YGD5yqFWOonMchaUl4aHKnjh/2xQeNLpP3z0RkBrl7WU5s=
X-Received: by 2002:a81:b705:0:b0:535:fe26:acc with SMTP id
 v5-20020a81b705000000b00535fe260accmr7785857ywh.10.1678141159600; Mon, 06 Mar
 2023 14:19:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de> <20230301153101.4282-21-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-21-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 23:19:08 +0100
Message-ID: <CACRpkdYS54Svj=B-NfrjX+kBDYw5e9Jyt70L0tr_iX5+mVYK4A@mail.gmail.com>
Subject: Re: [PATCH 20/22] drm/tve200: Use GEM DMA fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, andrew@aj.id.au, 
	laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, p.zabel@pengutronix.de, anitha.chrisanthus@intel.com, 
	edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com, 
	yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com, 
	philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com, samuel@sholland.org, 
	jyri.sarha@iki.fi, tomba@kernel.org, hyun.kwon@xilinx.com, 
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 1, 2023 at 4:31=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

That sounds neat:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
