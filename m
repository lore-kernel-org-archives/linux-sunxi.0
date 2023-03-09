Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7AD6AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=J8AMSPbfaaWKAdueqBDchdfwCvvjPH6b5rfoKS9mYt5FZwMsDRY7NN8KQQ1LtTPgg8AZXC
	GQRxVvE9O7zrNk7DbpwaTEhE3pdK47y3HIuBADhdV0EUqatg4WJzh30ZTUeKgLBv2Mn3sP
	Ohmepe7GD96m683HdvXgEjcd097g5tI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-wVd_MKgBNri8N-rWZMS8qA-1; Thu, 09 Mar 2023 06:21:01 -0500
X-MC-Unique: wVd_MKgBNri8N-rWZMS8qA-1
Received: by mail-wm1-f70.google.com with SMTP id n15-20020a05600c500f00b003dd07ce79c8so655126wmr.1
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360860;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=gHyEVpAjN6Lk8E/6tPRf3hx5I43wLqLo6n33jFJeg60PiB+c33D+5ifrt6VLyhxtoF
         kSDXz9mbZPg7NAcwa57bCVbqkEdyLJTnpX8/HFmWgB8dvw6P0Gx1Y9+aUOJWd4MupqYx
         w8GwD8JuircLnBoO1hITst0y+74m+oKIDnZrM5J6mlMGENasdtESHk5q8xlV8CUe/oLo
         6xk/QbdBBWZ9Rp+o1xe+YmXQclcJw8UClamYki56vqg5Dr2am8qMZYwE61cAbw1QIle6
         SljJNtA9RQwj9CgibYNyzyQtI8TUVFLdsYaYxDKsd2CuD+OkXTSaXXfkm0xKg320bs2v
         c/UA==
X-Gm-Message-State: AO0yUKWjAg0tHWASGy3QN9Y6PEt84KQeT8zDMUGwkv38LxCoCq5zk2At
	v9hyVs+yUqUoA8jdfdW03CfDqAofJKnTE/hkbyOkpIcpB6D5lu2apVzR+xNmLKWPGinRj3x+yNX
	0ltXIgOq+/8jee5dw2D4ZrfY=
X-Received: by 2002:a05:600c:3506:b0:3ea:f6c4:5f26 with SMTP id h6-20020a05600c350600b003eaf6c45f26mr18534978wmq.17.1678360860416;
        Thu, 09 Mar 2023 03:21:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8sLO5bKSPBoOiZMye1ieYHzGLgjQdrxGWGVp5ppUvSkKaG+jgho1T4oKqlnOH+WRjzqLQwTQ==
X-Received: by 2002:a05:600c:3506:b0:3ea:f6c4:5f26 with SMTP id h6-20020a05600c350600b003eaf6c45f26mr18534954wmq.17.1678360860177;
        Thu, 09 Mar 2023 03:21:00 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c3b0800b003eae73ee4a1sm2681759wms.17.2023.03.09.03.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:21:00 -0800 (PST)
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
Subject: Re: [PATCH 07/22] drm/imx/dcss: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-8-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-8-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:59 +0100
Message-ID: <87jzzqcgro.fsf@minerva.mail-host-address-is-not-set>
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

