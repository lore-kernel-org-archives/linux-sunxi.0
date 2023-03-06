Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF657473
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Mar 2023 22:20:12 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id t4so9721722ybg.11
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Mar 2023 14:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678141211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pOqDJttcohXKj1RSFtrNisdNxjQPQ9b/aoMKjMVgTM=;
        b=WQLXFgm2cskHChBbeJjnWfHzLaVEexVQKOQ4rB9cRG3lQA3qPXuomhUFMa1bPJaV+O
         elX+AVtcktbnW0u6KZFFrMz/uVu6DNtCdgp7AOhijqFyjyBI6havk1pXij2OauQZ92qg
         TP7BYf+epbi5+Fb8EdRlsu8DoxuCo/2SVjKw2HJW8WDIUgzdaxomEvmi9CQMcj+Gtg/u
         AWdSzRJdlgO45NCMRtVrCRZOSi4bGROwqVtYX+0cJKot3gy/M2pkyUPeu9oLPYu3Bo7A
         haB/pNnDt3IxCUNKe7BAbGoTTF32+chnWsq932lhwVWXjK9AljFmPq2wHMNt9iZXwgl3
         6/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678141211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pOqDJttcohXKj1RSFtrNisdNxjQPQ9b/aoMKjMVgTM=;
        b=cSGRsRSJ7xzzh2YFQ+TFx9MNTxlDla0nWIZWILAG7PtlgCSygax5bT0WlgYtrcnLuY
         3iwsY4nBreblvE4EJuAEIZB2OxcJ1BtaYGb+6cfTl5pKUVpk5kx3v3a2Gr/RM6EPEsHO
         Qag8I2TUetCIE+huryCX0R8PP/LmO0R/ZlJXhlFjB1Y50+j9VUvtXt6be++y2bRq+SN/
         UK6GQSRTMYgZclQdD/TkXkeJ5ANgp+JQraoZY1kv+qJJUJ9w4Uxjn8dozbdzyTOBVnFN
         8pkZmElMTLy7x+AR8YOAQ7sunGRzhiYYFahNZrveh+25TfI+hWIfY8QxW01MRRf7U5lC
         6mpA==
X-Gm-Message-State: AO0yUKVEQeU/hZkVIpjTV9pmxcqhRp/9jjVyr3Z66WiCHHnKfC4522Yt
	lh6dLaFPvTFjVlae1ZgrGKEshhnJNVLAfbLV8w8Ztw==
X-Google-Smtp-Source: AK7set+xwxOTuAGUH2F4JBk51moW8y8vFCxjzdcMEe6q9xVEyLeKbxDfeAXuirvD55r2Rwjk4zMOQZkWM/2/groUae8=
X-Received: by 2002:a05:6902:4c2:b0:ab8:1ed9:cfd6 with SMTP id
 v2-20020a05690204c200b00ab81ed9cfd6mr7198831ybs.5.1678141211227; Mon, 06 Mar
 2023 14:20:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-1-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 23:19:59 +0100
Message-ID: <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm/dma-helper: Add dedicated fbdev emulation
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

> Add fbdev emulation that is optimized for DMA helpers, as used by most
> drivers. It operates directly on GEM DMA buffers in system memory.
> Memory pages are mmap'ed directly to userspace. No implicit shadow
> buffers need to be allocated; as can happen with the generic fbdev
> emulation. Convert drivers that fulfil the requirements.
>
> Tested with fbcon and IGT on vc4.
>
> Future direction: providing a dedicated fbdev emulation for GEM DMA
> helpers will allow us to remove this case from the generic fbdev code.
> The latter can then be simplified.

1) I love your work.

2) Why isn't this DRM driver changed?
drivers/gpu/drm/mcde/mcde_drv.c
AFAICT it also uses GEM buffers in system memory.

3) This one:
drivers/gpu/drm/pl111/pl111_drv.c
is also very similar, but can sometimes use a dedicated
RAM memory for allocations using CMA, does that make
it not a candidate?

They aren't much different in how they work from the TVE200.

Yours,
Linus Walleij
