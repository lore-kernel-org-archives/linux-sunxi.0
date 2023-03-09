Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D6B6AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=UayWtNRr7gRkHJP0MtmXmdwGpo+0QWa9KZ2/jsmZWdlLS14ZTN4GcUPTHt9xH1eHTSefBP
	CKF5QSDR+GP6vjZrY1/8Oa7POIBjFFGXL9kaDE9+xIoKwmz4TTGXb/G+aaqAyf2yxLxn0p
	yi/mL1pjrOD7OM0FDUdt1R9EVYvqjRg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-1UD18IXVMVKBwjd0Ua6pWQ-1; Thu, 09 Mar 2023 06:17:49 -0500
X-MC-Unique: 1UD18IXVMVKBwjd0Ua6pWQ-1
Received: by mail-wr1-f72.google.com with SMTP id bh3-20020a05600005c300b002c70d6e2014so349973wrb.10
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360668;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=OCmCBCsRSIMySxS1YhkfREqFPq/7w3Qg5sdfHnzisUq0LGQWuMrD+bUIvkI2cM0LbG
         IJu4JMGatX6vOsIRl100PZ2ZaF/LVi3OD+v7+7TzzXWhUwrOZMJLnnL3Lw4EgziirhS1
         KnqqlNNJkFz3BKQrFiXpP8FzD0jCBIkfg608Z9XoCsLgz62fhgeUYpiPq9zZtNoakhJo
         FyuYCslpyy4Pc5uT5c6VRCzC2fMLgpzt44GTaezUX9hSCeEjxP2txTugV4a9lujKTi6A
         JkuMSq+tV/1I1XHC2tijmxlJYMQWSdOPn7Y9dc0zcDueGrJ3vX2pHsTYQEfWdfPO0LDG
         bykw==
X-Gm-Message-State: AO0yUKVS5kywZjm+ggpSHwCvJ137mMclRhjwnzV9i4ScopwGffW93tvr
	huPxM+8I02sTv2ICbvk1NQDvzwsgFpKjwTWQM7FSwHGI6fTIO49pETa9LEBwrjiyqboGNx67u8p
	E8tu4uP3Mnmr8WJWYpq4WvNY=
X-Received: by 2002:a5d:670d:0:b0:2c7:1319:7b1d with SMTP id o13-20020a5d670d000000b002c713197b1dmr13606713wru.39.1678360668804;
        Thu, 09 Mar 2023 03:17:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8t7W3VVjilkedn2prHPhya2P0ttMZiu2dHkADuEES7J7gfekac/bMcyXv4f/qMKVji9jryrA==
X-Received: by 2002:a5d:670d:0:b0:2c7:1319:7b1d with SMTP id o13-20020a5d670d000000b002c713197b1dmr13606665wru.39.1678360668526;
        Thu, 09 Mar 2023 03:17:48 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c12-20020a5d63cc000000b002c5801aa9b0sm17711159wrw.40.2023.03.09.03.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:17:48 -0800 (PST)
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
Subject: Re: [PATCH 02/22] arm/hdlcd: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-3-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-3-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:17:47 +0100
Message-ID: <87y1o6cgx0.fsf@minerva.mail-host-address-is-not-set>
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

