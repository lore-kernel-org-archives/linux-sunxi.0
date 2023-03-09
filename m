Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3176AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=CU40T/dhvBztNwrsVnlRl1wprx1SK03OK+kO20wyYBCfHjLSrOzvCMrcJr8eMnaabGSwIh
	rqf/haMMXQc/ahc1CEeEffYvx33ny7wNJXLmUDu8XDDt1OlIiAdOI799V1fy5g+wAOqDNL
	XtBiep6tjUK7UqV/VT5k/GhgUf8UOGU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-VKx5-iWqMbSvGT6PR5rk8Q-1; Thu, 09 Mar 2023 06:21:24 -0500
X-MC-Unique: VKx5-iWqMbSvGT6PR5rk8Q-1
Received: by mail-wm1-f72.google.com with SMTP id az12-20020a05600c600c00b003e8910ec2fdso539496wmb.6
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360883;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=loKnKDHZX6xTlkEY6ZHRY28WsRckqxiOvQLVd3MjoV2j/08BIWY6hS1QBV85u7OU28
         d1rybeaCV95TlZVXzSlk4bMCTx8fzeQ7hXubrgQb5XH++LyPLyciUW4Do9SrH7ODy8+L
         0+BQ8BEq7x2rYi4JGd8gt8r74TQooIKgcRyPP/8s6i8gPWgAc7jcL2dsicxzisBeaD0J
         gdowP99cLFB7+S5KS7gB5kdqghhpR7lhlTrOpsmOhP9+SEWqSmcM7LmenoZeRfl/pQ2p
         RfpEr9DRnB8SM0MBxd0ykaK9MmwPk4heW8wzx1e05VOi7/dM1KGQyOtucJJq+cFIxSUe
         AJnA==
X-Gm-Message-State: AO0yUKVRNCJq+m9i92hLfnMHmFlz3RzQBPd/Krs0kPvvcp0Je99bhKff
	yt6pFnnFYRTunBtpWikVwwt/e8eY8x/sPIFge6VLEFot1KoHJsSAIlfyb480ICeEuM818uMT84f
	IiTj4fVL5d5a7P+cwJbFBdeQ=
X-Received: by 2002:a05:600c:19cf:b0:3e7:772d:22de with SMTP id u15-20020a05600c19cf00b003e7772d22demr18809447wmq.30.1678360883234;
        Thu, 09 Mar 2023 03:21:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9QvIelUa3ZPRMnnDZU4wSkpr+jKhTz8vzz9MlATkeg82OLoMst/ctfKDlY/kc1tAF7ljMTyg==
X-Received: by 2002:a05:600c:19cf:b0:3e7:772d:22de with SMTP id u15-20020a05600c19cf00b003e7772d22demr18809404wmq.30.1678360882944;
        Thu, 09 Mar 2023 03:21:22 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m16-20020a7bca50000000b003eb5a0873e0sm2237300wml.39.2023.03.09.03.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:21:22 -0800 (PST)
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
Subject: Re: [PATCH 08/22] drm/imx: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-9-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-9-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:21:22 +0100
Message-ID: <87h6uucgr1.fsf@minerva.mail-host-address-is-not-set>
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

