Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16A66AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=SFZp/Og4GvnTEu2G65f1o9EoAFNv75FpzmUCue1CfPD1ONDU2GoXDqwFjHXEH49NuoWmO7
	167/uyGqnDuBrx9ar7A9B4zKPu12ZXEXDCUXXfcZn4hobPJwqZv8Bs9pQCyyZteKDwUMlg
	uu2Hi6mwYIKMJxFrs4GebxZrRcC1wHs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-fBdNiQmTODWFx15Ug0FxBw-1; Thu, 09 Mar 2023 06:20:04 -0500
X-MC-Unique: fBdNiQmTODWFx15Ug0FxBw-1
Received: by mail-wr1-f70.google.com with SMTP id o15-20020a05600002cf00b002c54a27803cso348744wry.22
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360803;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=VIH2L5f4+4Idl2vtXAeVi7/9MS/zVnEvrTtwQiL0WMFTvUkPUCMbZXn0WT6sqiwa5O
         Hq4pNwp24YF/lkQ+ymnp4Pnaj5RJUweR1dKnbRTzuklECkjJI39eWqWSTJ6G/gnD49xE
         mnmeOzU2vmYufianbN2cDPRFlLthxhBZVcubhQZY9SVmbHaBA67KmaGAsKsVhDyVJMtS
         ScrqUw6iW1WKEc/wNxgyQFnSjgh90PMNExIuI1HWtcwMswhTJzkE9YDLgsZeQCpIGo3Z
         xqvauR0rZuoetaOUpKlEMJFvMolp0OG2Gzo/pzsv1zvvt697eeuUOa8W6tSsL7m2eGeN
         rogA==
X-Gm-Message-State: AO0yUKXpCNu+ROTV/w5alPMdb8WjxprWEKcgYgrSf+nzmPJmw74L6qMy
	uqi+nV3mrQrF1VHpQlBki+sTfXvU7H9TPSJgW8mbI3sAHvjuxnycCrtSu4z3NYDwFb7T+aAr3sY
	eR1twuDSINSYflJ2OYVZg23k=
X-Received: by 2002:a05:600c:19c8:b0:3e1:bfc:d16e with SMTP id u8-20020a05600c19c800b003e10bfcd16emr19563115wmq.39.1678360803685;
        Thu, 09 Mar 2023 03:20:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/qnVD0YYOZOg0gATaJ95G2PynE58HCE1Dk3DOhH1ATAU++l0OCrumBkXbrdoQMrJSTJfkHMQ==
X-Received: by 2002:a05:600c:19c8:b0:3e1:bfc:d16e with SMTP id u8-20020a05600c19c800b003e10bfcd16emr19563083wmq.39.1678360803370;
        Thu, 09 Mar 2023 03:20:03 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t20-20020a0560001a5400b002c54f4d0f71sm18023382wry.38.2023.03.09.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:20:03 -0800 (PST)
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
Subject: Re: [PATCH 04/22] drm/aspeed: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-5-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-5-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:01 +0100
Message-ID: <87sfeecgta.fsf@minerva.mail-host-address-is-not-set>
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

