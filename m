Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381072CAB
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Mar 2023 21:53:16 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id cy23so23780401edb.12
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Mar 2023 13:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glTmX378wFhL+15561BIoVBCccNOW4FDXoOgifMHBy8=;
        b=EjDJ1R8FKouJnuSxadiRe5SiBIgUSITPbM9SnQjhYDyIZ+LuEOc2GfJjRvdd1K10zP
         0B+VLs/N+kcVjphefjob7VPueiCtPcbheJAVql624mVmTFTwLvvcp1iZwDpKctQLPUHW
         891sEv52O94DJnZ6KiXRE4F/ROjfjMTPMKKI+OF6yfwNHXTh46djS1YKS+5RgOvxGYeH
         ZkMiXVI3btf5P7xmeL3czwdHnO3oxMI8+Piuk+XkuMFjbmF1+Tu4Euz0RahvlkxQA0+9
         WfciGbFo0TezFdbslWClljVVfxIS/uCJg+p/6L25hJAymiS1NrGxJW4JFm2298dmi6Zx
         AF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glTmX378wFhL+15561BIoVBCccNOW4FDXoOgifMHBy8=;
        b=avGEk1Yr+/9DHRDpIJFjzA7nI6i09YGRTQjEJ2flRZfusKOt4tqdDUgjjuZBoCBqWt
         w7KKlOGAQfNmXHO5r++gZ7h1Y/PbR5SYajE2BqVLd3SuJKSGjCh4rq355N7l5z6YO44V
         YWZBFDJZ08nHht4Vw56xjt4Wbzx4CXxroR1T5w+uUy+NGIcW1Ve/e3xjAqnDW75KkVKa
         ruZcC01+t3W8hQFoA2Bjn6qUudz2pa55VDE3x+eJ6gjWKkvYPNvr1v5+mk6GHCWsJbNA
         /2RekISU+928a5HdOlZ65bLppH2Ydke44HKKi/HMoQLh687x1eeLizBpnleeBOj7s8Iz
         Qdaw==
X-Gm-Message-State: AO0yUKWkxEytEQbzX2ZdyrlLxR5iKZc46Fu3x9r+X73PJlNt0Ic5gG/M
	BWVwEgU2eRvVw9R//QbuxkOkqObjlgZ1FZKOoaU=
X-Google-Smtp-Source: AK7set+tmz2IUyxluM6H0uJ7rtHOVvVTQ1X6COH7sceQzb5b5yCqFKVzBbXboRNMEcYH9cGeInLEcv9muAb3OM5khBI=
X-Received: by 2002:a50:ce19:0:b0:4bc:2776:5b61 with SMTP id
 y25-20020a50ce19000000b004bc27765b61mr3356647edi.6.1677966793189; Sat, 04 Mar
 2023 13:53:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de> <20230301153101.4282-12-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-12-tzimmermann@suse.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Mar 2023 22:53:02 +0100
Message-ID: <CAFBinCCV4yu1HszSaCJuNVMhDC35hA8cpzLMw1x=a3x+LNYrEw@mail.gmail.com>
Subject: Re: [PATCH 11/22] drm/meson: Use GEM DMA fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, andrew@aj.id.au, 
	laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, p.zabel@pengutronix.de, anitha.chrisanthus@intel.com, 
	edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com, 
	alain.volmat@foss.st.com, yannick.fertre@foss.st.com, 
	raphael.gallais-pou@foss.st.com, philippe.cornu@foss.st.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	jernej.skrabec@gmail.com, samuel@sholland.org, jyri.sarha@iki.fi, 
	tomba@kernel.org, linus.walleij@linaro.org, hyun.kwon@xilinx.com, 
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 1, 2023 at 4:31=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
