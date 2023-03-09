Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1606AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Q1AOpfNjOxvAZETLXJ3cfQNQDRtqZl5XqWjuhR9Ks4YTtlnDz9eoHhtfM3H4QOpF67nuoc
	ualrTISMJpGPYc4U/J782WtzMxZbPPwiYNgM+hZocunVuj155Gf9QqD/4NuvicVITIJSby
	rnoH6F1bFB6Z7XOZgYRy2YATEK8wee0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-ZzgPdP2bMnCRiQNUHINUwg-1; Thu, 09 Mar 2023 06:18:11 -0500
X-MC-Unique: ZzgPdP2bMnCRiQNUHINUwg-1
Received: by mail-wr1-f69.google.com with SMTP id bh3-20020a05600005c300b002c70d6e2014so350289wrb.10
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360690;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=Zn0/x/PuhGWwAlEwkff+awhcrgMv/3hXqcLM5Ss7WeYcB012cLI/vGAmGJLhW6MKIa
         BVG2FUtnm/sENU6NtAZDTyjhdXXeyEQThiBYU4N59gj02Rs0OWBBL+MSCgoY5/BfQMvm
         hcMc3/BvDXWLVo1JxdYXimsgxRJZuHMNoCE0TwsWvFzeth+QGD9dRtLrsLA9aEb13Fby
         SZOE4YVv65SOAbeK8QuwEc6Ky2XuZyLo2/gVJKXVnBW559NjN4CsGce28PooTo/VzRtl
         ITKEbDRennW9yP+7yGSNP+1fh2zqAvu42YFhJgI34X6qLaNq8fTNbHsiV7ANaQv/4vQk
         dpKw==
X-Gm-Message-State: AO0yUKWAQ2tfQXRRM27DfaDUPK89IV5yb91j/uRGogETaQuCXhT+0pWx
	F75ZGwpv8CxBps7HRXMfgg8H9xmzSHauz48u7/ToB34+ZMqIZtOC4F+WYwTxPSrg5Q5xkBQ0Bfe
	hwtTiFRnEMByhF3MMQvTUCwM=
X-Received: by 2002:a05:600c:458b:b0:3ea:d620:570a with SMTP id r11-20020a05600c458b00b003ead620570amr19256918wmo.38.1678360690490;
        Thu, 09 Mar 2023 03:18:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8nz/b/mv461MJo6uCh18V+HWYnANd/m5ucTuXO+pUDMtWMOWVVOePuNeDpPXiYp2Mt7j7R+w==
X-Received: by 2002:a05:600c:458b:b0:3ea:d620:570a with SMTP id r11-20020a05600c458b00b003ead620570amr19256887wmo.38.1678360690262;
        Thu, 09 Mar 2023 03:18:10 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c229000b003eb2e33f327sm4775721wmf.2.2023.03.09.03.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:18:10 -0800 (PST)
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
Subject: Re: [PATCH 03/22] arm/malidp: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-4-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-4-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:18:09 +0100
Message-ID: <87v8jacgwe.fsf@minerva.mail-host-address-is-not-set>
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

