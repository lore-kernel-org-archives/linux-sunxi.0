Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B056AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=a+Zt9OltAkkNGKt9MD83wZG9X8YtxH2RptqjLLcw5oZU/W8sm+5MBUtiI8M+iY1pY0Fl2I
	Sn0BnnOS2FC6euh29XHZ/0CIzRAn1eVKgpbLd4a+jBPFvJOMbOebhmGJKxP83IRnyTSEuz
	5C3FfGsWhNylJDNNbzB8yc1p1cNF29o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-uHICjNBTPWSZJlmJcXpwyQ-1; Thu, 09 Mar 2023 06:26:12 -0500
X-MC-Unique: uHICjNBTPWSZJlmJcXpwyQ-1
Received: by mail-wm1-f69.google.com with SMTP id k26-20020a05600c0b5a00b003dfe4bae099so664657wmr.0
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361171;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=yzm7TzrkoyBOZy21+HZg1yFjwi5FCQtXq8WbxduJlIJL9/77i7LdFhhbnOs/gfAxg0
         dQrpuh5EEIMm+iAAed4yE/eAqAHuK9jptD1j7wD6V4hRWDa+fyHqETPW0bmdDaUUDnT4
         qklSCx4bVbrB3S3gjOu7auk1MFs4DSXbmDiiZSWoc1lMLsr1iAOtOfkN7xJXHeJ66i0z
         Jc2ojYMn3M6nb7+lvRVDJbFpo3VPjLIHhqu4+Q0RNruPzWwpHBLNPV8KJR0TGjRomPvv
         LtnANgOTfN/lq4xMrta8pV6k27lMSKZqr0180eyf9pfzH5TrXl+mgAXaS1kSea8oj/Wm
         BqvA==
X-Gm-Message-State: AO0yUKXkNAfH00QJJ/Gq1cmjvolV3XdrxzRu0MOt9iZ+/2V4lA0Tx2w6
	x3SzirbmekT+WgOK3VBCF0GdiWtVfl95BgC0odxZe/Nop/LMzrujDcsMTIlnGEf2AWNt1iYASib
	TKbGNexJN8DlpyLzpyU91s0Y=
X-Received: by 2002:a05:600c:310f:b0:3ea:edd7:1f24 with SMTP id g15-20020a05600c310f00b003eaedd71f24mr19249554wmo.39.1678361171513;
        Thu, 09 Mar 2023 03:26:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8P+TR8QVeZTPkvZUtmOPITmpd/ysZXzZ/aUrzjfnJhfAoMKaclBZMuBRrY3afv4leM7oxMzQ==
X-Received: by 2002:a05:600c:310f:b0:3ea:edd7:1f24 with SMTP id g15-20020a05600c310f00b003eaedd71f24mr19249536wmo.39.1678361171233;
        Thu, 09 Mar 2023 03:26:11 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b003eae73f0fc1sm2297965wmb.18.2023.03.09.03.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:26:11 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 14/22] drm/sti: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-15-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-15-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:10 +0100
Message-ID: <87sfee6u99.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

